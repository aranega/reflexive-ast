Class {
	#name : #RBAst2RAAst,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'currentScope'
	],
	#category : #'ReflexiveAST-examples'
}

{ #category : #visiting }
RBAst2RAAst >> createVariableUse: aVariable [
	| varCollection varUse scope |
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
			varCollection := scope keywords
				select: [ :each | each argument name = aVariable name ]
				thenCollect: [ :each | each argument ].
			varCollection
				ifNotEmpty: [ ^ varUse reference: (varCollection at: 1) ] ].
	varCollection := scope owningClass. 	"get instance vars from parent class"
	varCollection
		ifNil: [ ^ nil ].
	varUse := RAInstVarUse new
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
	^ assign
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
RBAst2RAAst >> visitMessageNode: messageNode [
	| messageSend |
	messageSend := RAMessageSend new.
	
	^ messageSend 
]

{ #category : #visiting }
RBAst2RAAst >> visitMethodNode: methodNode [
	| method |
	method := RAMethod new.
	currentScope push: method.
	method keywords
		addAll:
			(methodNode keywords
				withIndexCollect: [ :each :i | 
					| arg keyword argDef |
					keyword := RAKeywordDefinition new.
					keyword name: each asString.
					argDef := RAArgumentDefinition new.
					arg := methodNode arguments at: i.
					argDef name: arg name asString.
					keyword argument: argDef.
					keyword ]).
	method temporaries
		addAll:
			(methodNode temporaries
				collect: [ :each | 
					| tempDef |					
					tempDef := RATempDefinition new.
					tempDef name: each name asString.
					]).
	method statements addAll: (
		methodNode body statements collect: [:each |
			each acceptVisitor: self
		]
	).
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
RBAst2RAAst >> visitTemporaryNode: tempNode [
	^ self createVariableUse: tempNode
]
