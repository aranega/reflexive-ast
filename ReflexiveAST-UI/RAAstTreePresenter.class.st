Class {
	#name : #RAAstTreePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'innerTable',
		'methodNode'
	],
	#category : #'ReflexiveAST-UI'
}

{ #category : #specs }
RAAstTreePresenter class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #innerTable;
		yourself
]

{ #category : #initialization }
RAAstTreePresenter >> ast: aMethodNode [
	methodNode := aMethodNode.
	innerTable roots: { methodNode  }
]

{ #category : #initialization }
RAAstTreePresenter >> initializePresenters [
	innerTable := self newTreeTable.
	innerTable
		addColumn:
			(SpStringTableColumn
				title: 'Node'
				evaluated: [ :node | node display ]);
		addColumn:
			(SpStringTableColumn
				title: 'Type'
				evaluated: [ :node | node class name ]);
		children: [ :node | node children ];
		beResizable
]
