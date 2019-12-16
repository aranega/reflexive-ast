Class {
	#name : #RAAstMethodPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'astTreePresenter',
		'codePresenter',
		'ast'
	],
	#category : #'ReflexiveAST-UI'
}

{ #category : #specs }
RAAstMethodPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal 
		add: #astTreePresenter ;
		add: #codePresenter;
		yourself
]

{ #category : #accessing }
RAAstMethodPresenter >> ast [
	^ ast
	
]

{ #category : #accessing }
RAAstMethodPresenter >> ast: aMethodNode [
	| dirtyVisitor |
	ast := aMethodNode.
	astTreePresenter ast: ast.
	dirtyVisitor := DirtyPrettyPrinter  new.
	codePresenter text: (ast acceptVisitor: dirtyVisitor)
]

{ #category : #accessing }
RAAstMethodPresenter >> connectPresenters [
	
	
]

{ #category : #accessing }
RAAstMethodPresenter >> initializePresenters [
	astTreePresenter := RAAstTreePresenter new.
	codePresenter := SpCodePresenter new.
]

{ #category : #accessing }
RAAstMethodPresenter >> updateCodeView [
	codePresenter text: (ast acceptVisitor: DirtyPrettyPrinter new)
]
