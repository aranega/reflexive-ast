Class {
	#name : #RAMethodSignature,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#selector => ToOneSlot inClass: #RASelector containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAMethodSignature >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitMethodSignature: self
]

{ #category : #accessing }
RAMethodSignature >> selector [
	^ selector
]

{ #category : #accessing }
RAMethodSignature >> selector: anObject [
	selector := anObject
]
