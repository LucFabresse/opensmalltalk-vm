Class {
	#name : #VMPLabelSymbol,
	#superclass : #VMPSymbol,
	#category : #'CogTools-VMProfiler'
}

{ #category : #LICENSE }
VMPLabelSymbol class >> LICENSE [
	^'Project Squeak

	Copyright (c) 2005-2013, 3D Immersive Collaboration Consulting, LLC., All Rights Reserved

	Redistributions in source code form must reproduce the above copyright and this condition.

Licensed under MIT License (MIT)
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'
]

{ #category : #comparing }
VMPLabelSymbol >> importance [
	^4
]

{ #category : #accessing }
VMPLabelSymbol >> limit [
	"Answer the address.  labels are point entities"
	^address
]

{ #category : #accessing }
VMPLabelSymbol >> limit: aValue [
	"Ignore.  labels are point entities"
]

{ #category : #accessing }
VMPLabelSymbol >> type [
	^#label
]
