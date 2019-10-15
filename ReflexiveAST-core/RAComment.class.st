Class {
	#name : #RAComment,
	#superclass : #RALiteral,
	#instVars : [
		'content'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #accessing }
RAComment >> acceptVisitor: anAstVisitor [
	^ anAstVisitor visitComment: self
]

{ #category : #accessing }
RAComment >> content [
	^ content
]

{ #category : #accessing }
RAComment >> content: aComment [
	content := aComment
]
