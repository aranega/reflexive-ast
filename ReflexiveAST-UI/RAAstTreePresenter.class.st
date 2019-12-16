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
RAAstTreePresenter >> actionGroupMenu [
	| group selection |
	group := (CmCommandGroup named: 'Create AST node') asSpecGroup
		description: 'Create sub AST node';
		beDisplayedAsGroup;
		beRoot;
		yourself.
	selection := self selectedNode.
	(selection class slots
		select: [ :slot | slot isReferenceRelationSlot and: [ slot isContainment ] ])
		do: [ :each | self subGroupForTypeMenu: each forGroup: group ].
	^ group
]

{ #category : #initialization }
RAAstTreePresenter >> ast [
	^ methodNode
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
			(SpStringTableColumn title: 'Node' evaluated: [ :node | node display ]);
		addColumn:
			(SpStringTableColumn
				title: 'Type'
				evaluated: [ :node | node class name ]);
		children: [ :node | node children ];
		contextMenu: [ self actionGroupMenu asMenuPresenter ];
		beResizable
]

{ #category : #initialization }
RAAstTreePresenter >> isNodeSelected [
	^ innerTable selectedItems isNotEmpty
]

{ #category : #initialization }
RAAstTreePresenter >> selectedNode [
	^ innerTable selection selectedItem
]

{ #category : #initialization }
RAAstTreePresenter >> subGroupForTypeMenu: slot forGroup: group [
	| subgroup groupName |
	groupName := 'Create ''{1}'' kind node' format: {slot name}.
	subgroup := (CmCommandGroup named: groupName) asSpecGroup.
	group register: subgroup.
	({slot targetClass} , slot targetClass allSubclasses
		reject: [ :sub | sub isAbstract ])
		do: [ :sub | 
			subgroup
				register:
					(RACreateSubNode new
						owner: self selectedNode;
						type: sub) asSpecCommand ].
	^ group
]
