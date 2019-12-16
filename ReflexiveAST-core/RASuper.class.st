Class {
	#name : #RASuper,
	#superclass : #RAPseudoVariable,
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RASuper >> acceptVisitor: aVisitor [
	^ aVisitor visitSuper: self
]

{ #category : #accessing }
RASuper >> initialize [
	name := 'super'
]
