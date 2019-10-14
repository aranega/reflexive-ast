Class {
	#name : #RAMethod,
	#superclass : #ReflectiveAstNode,
	#instVars : [
		'#temporaries => ToManySlot inClass: #RATempDefinition containment: true',
		'#statements => ToManySlot inClass: #RATempDefinition containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAMethod >> initialize [
	super initialize.
]

{ #category : #accessing }
RAMethod >> statements [
	^ statements
]

{ #category : #accessing }
RAMethod >> temporaries [
	^ temporaries
]
