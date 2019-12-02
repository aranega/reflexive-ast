Class {
	#name : #RAWorld,
	#superclass : #Object,
	#instVars : [
		'#classes => ToManySlot inClass: #RAClass containment: true'
	],
	#category : #'ReflexiveAST-core'
}

{ #category : #initialization }
RAWorld >> classes [
	^ classes 
]

{ #category : #initialization }
RAWorld >> findOrAddClass: aClass [
	| subresult |
	subresult := classes
		select: [ :c | c originClass name = aClass name ].
	subresult
		ifEmpty: [ | cls |
			cls := RAClass new.
			cls originClass: aClass.
			classes add: cls.
			^ cls ].
	^ subresult at: 1
]

{ #category : #initialization }
RAWorld >> initialize [
	
	self class initializeSlots: self.
	super initialize.
]
