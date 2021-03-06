Extension { #name : #Object }

{ #category : #'*SlangBrowser-VMMaker-Translation to C' }
Object class >> asCString [
	"Answer the translated C source for this class."

	"Interpreter asCString"
	"ObjectMemory asCString"
	"FilePlugin asCString"

	| vmm cg stream |
	(Smalltalk hasClassNamed: 'VMMaker')
		ifTrue: [vmm := Smalltalk at: #VMMaker]
		ifFalse: [^ self notify: 'VMMaker not in this image'].
	cg := vmm codeGenerator: #cCode forClass: self.
	stream := ReadWriteStream on: String new.
	cg emitCCodeOn: stream doAssertions: true.
	^ stream contents

]

{ #category : #'*SlangBrowser-VMMaker-Translation to C' }
Object class >> asCString: aSelector [
	"Answer the translated C source for a method."

	"Interpreter asCString: #bytecodePrimBlockCopy"
	"ObjectMemory asCString: #lastPointerOf:"

	| vmm cg method stream |
	(Smalltalk hasClassNamed: 'VMMaker')
		ifTrue: [vmm := Smalltalk at: #VMMaker]
		ifFalse: [^ self notify: 'VMMaker not in this image'].
	cg := vmm codeGenerator: #cCode forClass: self.
	cg isString ifTrue:
		[^ '/* ', self name, ' can not be translated. */',
			String cr, '/* ', cg, ' */'].
	method := cg methodNamed: aSelector.
	method ifNil: [^ self methodNotTranslatedMessage: aSelector].
	stream := ReadWriteStream on: String new.
	method emitCCodeOn: stream generator: cg.
	^ stream contents

]

{ #category : #'*SlangBrowser-VMMaker-Translation to C' }
Object class >> asInlinedCString [
	"Answer the translated C source for this class."

	"Interpreter asInlinedCString"
	"ObjectMemory asInlinedCString"
	"FilePlugin asInlinedCString"

	| vmm cg stream |
	(Smalltalk hasClassNamed: 'VMMaker')
		ifTrue: [vmm := Smalltalk at: #VMMaker]
		ifFalse: [^ self notify: 'VMMaker not in this image'].
	cg := vmm codeGenerator: #inlinedCCode forClass: self.
	stream := ReadWriteStream on: String new.
	cg emitCCodeOn: stream doAssertions: true.
	^ stream contents

]

{ #category : #'*SlangBrowser-VMMaker-Translation to C' }
Object class >> asInlinedCString: aSelector [
	"Answer the translated Inlined C source for a method."

	"Interpreter asCString: #bytecodePrimBlockCopy"
	"ObjectMemory asCString: #lastPointerOf:"

	| vmm cg method stream |
	(Smalltalk hasClassNamed: 'VMMaker')
		ifTrue: [vmm := Smalltalk at: #VMMaker]
		ifFalse: [^ self notify: 'VMMaker not in this image'].
	cg := vmm codeGenerator: #inlinedCCode forClass: self.
	cg isString ifTrue:
		[^ '/* ', self name, ' can not be translated. */',
			String cr, '/* ', cg, ' */'].
	method := cg methodNamed: aSelector.
	method ifNil: [^ ObjectMemory methodNotTranslatedMessage: aSelector].
	stream := ReadWriteStream on: String new.
	method emitCCodeOn: stream generator: cg.
	^ stream contents

]

{ #category : #'*SlangBrowser-VMMaker-Translation to C' }
Object class >> methodNotTranslatedMessage: aSelector [
	"For browser support with VMMaker"

	^ 	'/* No source has been generated for #', aSelector asString, ' */', String cr,
		'/* Method may have been fully inlined, or is not exported and */' translated,
		String cr, '/* has no senders. See senders of #' translated, aSelector asString, ' */'

]
