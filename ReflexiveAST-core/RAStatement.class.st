Class {
	#name : #RAStatement,
	#superclass : #ReflectiveAstNode,
	#category : #'ReflexiveAST-core-core'
}

{ #category : #testing }
RAStatement >> isBlock [
	^ false
]

{ #category : #testing }
RAStatement >> isReturn [
	^ false
]
