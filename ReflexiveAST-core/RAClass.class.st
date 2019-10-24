Class {
	#name : #RAClass,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#name',
		'#instVars => ToManySlot inClass: #RAInstVarDefinition containment: true',
		'#methods => ToManySlot inClass: #RAMethod containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAClass >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitClass: self
]

{ #category : #initialization }
RAClass >> initialize [
	super initialize.
]

{ #category : #accessing }
RAClass >> instVars [
	^ instVars
]

{ #category : #accessing }
RAClass >> methods [
	^ methods
]

{ #category : #accessing }
RAClass >> name [
	^ name
]

{ #category : #accessing }
RAClass >> name: aName [
	name := aName
]
