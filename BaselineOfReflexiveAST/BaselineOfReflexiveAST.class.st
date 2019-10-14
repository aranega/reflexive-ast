Class {
	#name : #BaselineOfReflexiveAST,
	#superclass : #BaselineOf,
	#category : #BaselineOfReflexiveAST
}

{ #category : #baselines }
BaselineOfReflexiveAST >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'ReflexiveAST-slots';
				package: 'ReflexiveAST-core'
					with: [ spec requires: #('ReflexiveAST-slots') ] ]
]
