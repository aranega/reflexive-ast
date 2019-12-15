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
RAStatement >> isCascade [
	^ false
]

{ #category : #testing }
RAStatement >> isReturn [
	^ false
]

{ #category : #testing }
RAStatement >> isVariable [
	^ false
]
