Class {
	#name : #RAClass,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#instVars => ToManySlot inClass: #RAInstVarDefinition containment: true'
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
