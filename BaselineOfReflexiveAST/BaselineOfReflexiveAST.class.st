Class {
	#name : #BaselineOfReflexiveAST,
	#superclass : #BaselineOf,
	#category : #BaselineOfReflexiveAST
}

{ #category : #baselines }
BaselineOfReflexiveAST >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'ReflexiveAST' ]
]

{ #category : #baselines }
BaselineOfReflexiveAST >> project [
	^ super project
		loadType: #atomic;
		yourself
]
