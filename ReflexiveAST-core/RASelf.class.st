Class {
	#name : #RASelf,
	#superclass : #RAPseudoVariable,
	#category : #'ReflexiveAST-core-core'
}

{ #category : #accessing }
RASelf >> acceptVisitor: aVisitor [
	^ aVisitor visitSelf: self
]

{ #category : #'rbast-polymorphic' }
RASelf >> binding [
	^ OCSelfVariable new
]

{ #category : #accessing }
RASelf >> initialize [
	name := 'self'
]
