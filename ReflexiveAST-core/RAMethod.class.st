Class {
	#name : #RAMethod,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#keywords => ToManySlot inClass: #RAKeywordDefinition containment: true',
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true',
		'#statements => ToManySlot inClass: #RAStatement containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAMethod >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitMethod: self
]

{ #category : #initialization }
RAMethod >> initialize [
	super initialize.
]

{ #category : #accessing }
RAMethod >> keywords [
	^ keywords
]

{ #category : #accessing }
RAMethod >> owningClass [
	^ self parent
]

{ #category : #accessing }
RAMethod >> statements [
	^ statements
]

{ #category : #accessing }
RAMethod >> temporaries [
	^ temporaries
]
