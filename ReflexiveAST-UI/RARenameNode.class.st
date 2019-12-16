Class {
	#name : #RARenameNode,
	#superclass : #CmCommand,
	#category : #'ReflexiveAST-UI'
}

{ #category : #executing }
RARenameNode >> execute [
	| node |
	node := self context selectedNode.
	
]
