Class {
	#name : #RBAst2RAAst,
	#superclass : #RBProgramNodeVisitor,
	#category : #'ReflexiveAST-examples'
}

{ #category : #visiting }
RBAst2RAAst >> visitMethodNode: methodNode [
	| method |
	method := RAMethod new.
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
	^ method
]
