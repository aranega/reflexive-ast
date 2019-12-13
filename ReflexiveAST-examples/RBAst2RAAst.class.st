Class {
	#name : #RBAst2RAAst,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'currentScope',
		'owningClass',
		'world'
	],
	#category : #'ReflexiveAST-examples'
}

{ #category : #'instance creation' }
RBAst2RAAst class >> new: aWorld [
	| inst |
	inst := super new.
	inst world: aWorld.
	^ inst
]

{ #category : #visiting }
RBAst2RAAst >> createVariableUse: aVariable [
	| varCollection varUse scope definition |
	scope := currentScope top.
	aVariable isBlockVar
		ifTrue: [ varUse := RATempUse new.
			varCollection := scope temporaries
				select: [ :each | each name = aVariable name ].
			varCollection
				ifNotEmpty: [ ^ varUse reference: (varCollection at: 1) ] ].
	aVariable isTemp
		ifTrue: [ varUse := RATempUse new.
			varCollection := scope temporaries
				select: [ :each | each name = aVariable name ].
			varCollection
				ifNotEmpty: [ ^ varUse reference: (varCollection at: 1) ] ].
	aVariable isArgument
		ifTrue: [ varUse := RAArgumentUse new.
			varCollection := self extractAccessibleArguments
				select: [ :each | each name = aVariable name ].
			varCollection
				ifNotEmpty: [ ^ varUse reference: (varCollection at: 1) ] ].
	owningClass ifNil: [ ^ nil ].
	varUse := RAInstVarUse new.
	definition := owningClass createOrGetInstVarNamed: aVariable name.
	varUse reference: definition.
	^ varUse
]

{ #category : #visiting }
RBAst2RAAst >> extractAccessibleArguments [
	^ currentScope flatCollect: [ :each | each arguments ]
]

{ #category : #visiting }
RBAst2RAAst >> initialize [
	currentScope := Stack new.
]

{ #category : #visiting }
RBAst2RAAst >> visitAssignmentNode: assignNode [
	| assign var |
	assign := RAAssignment new.
	var := self createVariableUse: assignNode variable.
	var ifNil: [ ^ RAComment new content: 'Not yet implemented (missing class ref)' ].
	assign variable: var.
	assign expression: (assignNode value acceptVisitor: self).
	^ assign
]

{ #category : #visiting }
RBAst2RAAst >> visitBinaryMessageNode: messageNode [
	| messageSend |
	messageSend := RABinaryMessageSend new.
	messageSend left: (messageNode receiver acceptVisitor: self).
	messageSend right: ((messageNode arguments at: 1) acceptVisitor: self).
	messageSend operator: messageNode selector.
	^ messageSend 
]

{ #category : #visiting }
RBAst2RAAst >> visitBlockNode: blockNode [
	| block |
	block := RABlock new.
	currentScope push: block.
	block arguments
		addAll:
			(blockNode arguments
				collect: [ :each | 
					| argDef |
					argDef := RAArgumentDefinition new.
					argDef name: each name asString.
					argDef ]).
	block temporaries
		addAll:
			(blockNode temporaries
				collect: [ :each | 
					| tempDef |					
					tempDef := RATempDefinition new.
					tempDef name: each name asString.
					]).
	block statements addAll: (
		blockNode body statements collect: [:each |
			each acceptVisitor: self
		]
	).
	currentScope pop.
	^ block
]

{ #category : #visiting }
RBAst2RAAst >> visitGlobalNode: aGlobalNode [
	
	^ RAPseudoVariable new name: aGlobalNode name 
]

{ #category : #visiting }
RBAst2RAAst >> visitKeywordMessageNode: messageNode [
	| messageSend keywordList |
	messageSend := RAMessageSend new.
	messageSend receiver: (messageNode receiver acceptVisitor: self).
	keywordList := messageNode keywords.
	keywordList
		withIndexCollect: [ :each :i | 
			| keyword |
			keyword := RAKeyword new.
			keyword name: each asString.
			messageNode arguments ifNotEmpty: [  | argNode |
				argNode := messageNode arguments at: i.
				keyword expression: (argNode acceptVisitor: self).
			].
			messageSend keywords add: keyword ].
	^ messageSend
]

{ #category : #visiting }
RBAst2RAAst >> visitLiteralNode: literalNode [
	| val literal |
	literal := literalNode value.
	literal isString
		ifTrue: [ val := RAString new ].
	literal isArray
		ifTrue: [ val := RAArray new ].
	literal isNumber
		ifTrue: [ val := RANumber new ].
	(#(true false) includes: literal)
		ifTrue: [ val := RAArray new ].
	val literalValue: literal.
	^ val
]

{ #category : #visiting }
RBAst2RAAst >> visitMessageNode: messageNode [
	messageNode isBinary
		ifTrue: [ ^ self visitBinaryMessageNode: messageNode ].
	^ self visitKeywordMessageNode: messageNode
]

{ #category : #visiting }
RBAst2RAAst >> visitMethodNode: methodNode [
	| method |
	world := world ifNil: [ RAWorld new ].
	method := RAMethod new.
	currentScope push: method.
	method owningClass: (world findOrAddClass: methodNode methodClass).
	owningClass := method owningClass.
	method keywords
		addAll:
			(methodNode keywords
				withIndexCollect: [ :each :i | 
					| arg keyword argDef |
					keyword := RAKeywordDefinition new.
					keyword name: each asString.
					methodNode arguments ifNotEmpty: [ 
						argDef := RAArgumentDefinition new.
					arg := methodNode arguments at: i.
					argDef name: arg name asString.
					keyword argument: argDef.
						 ].
					
					keyword ]).
	method temporaries
		addAll:
			(methodNode temporaries
				collect: [ :each | 
					| tempDef |
					tempDef := RATempDefinition new.
					tempDef name: each name asString ]).
	method statements
		addAll:
			(methodNode body statements
				collect: [ :each | each acceptVisitor: self ]).
	currentScope pop.
	^ method
]

{ #category : #visiting }
RBAst2RAAst >> visitReturnNode: messageNode [
	| return |
	return := RAReturn new.
	return expression: (messageNode value acceptVisitor: self).
	^ return 
]

{ #category : #visiting }
RBAst2RAAst >> visitSelfNode: selfNode [
	^ RAPseudoVariable new name: 'self'
]

{ #category : #visiting }
RBAst2RAAst >> visitTemporaryNode: tempNode [
	^ self createVariableUse: tempNode
]

{ #category : #visiting }
RBAst2RAAst >> visitVariableNode: varNode [
	^ self createVariableUse: varNode
]

{ #category : #visiting }
RBAst2RAAst >> world: aWorld [
	world := aWorld
]
