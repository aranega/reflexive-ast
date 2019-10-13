# reflexive-ast

This project tries to implement an AST for Pharo in a kind of metamodel style. The idea is to be able to propose an AST with reflexion upon its references (as well as automatic references update).

## Installation

```smalltalk
Metacello new
	baseline: 'ReflexiveAST';
	repository: 'github://aranega/reflexive-ast';
	load
```
