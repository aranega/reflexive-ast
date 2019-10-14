Class {
	#name : #RABlock,
	#superclass : #RAExpression,
	#instVars : [
		'#statements => ToManySlot inClass: #RAStatement containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RABlock >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitBlock: self
]

{ #category : #initialization }
RABlock >> initialize [
	super initialize.
]

{ #category : #accessing }
RABlock >> statements [
	^ statements
]

{ #category : #accessing }
RABlock >> temporaries [
	^ temporaries
]
