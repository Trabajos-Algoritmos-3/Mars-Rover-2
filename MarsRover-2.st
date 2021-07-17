!classDefinition: #MarsRoverLogTest category: 'MarsRover-2'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: 'E N S W'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/16/2021 22:35:35'!
setUp
	N _ North new.
	S _ South new.
	E _ East new.
	W _ West new.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/16/2021 22:56:53'!
test01MarsRoverLogWithoutCommands
	|marsRover marsRoverLog|

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ marsRover getLog.
	
	marsRover moveTo: ''.
	
	self assert: marsRoverLog size equals: 2.
	self assert: marsRoverLog includes: 'Position: 5@5'.
	self assert: marsRoverLog includes: 'Direction: ', N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/16/2021 23:02:01'!
test02MarsRoverLogWithCommands
	|marsRover marsRoverLog|

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ marsRover getLog.
	
	marsRover moveTo: 'frbl'.
	
	self assert: marsRoverLog size equals: 6.
	self assert: marsRoverLog includes: 'Position: 5@5'.
	self assert: marsRoverLog includes: 'Direction: ', N cardinalDirection asString.
	self assert: marsRoverLog includes: 'Position: 5@6'.
	self assert: marsRoverLog includes: 'Direction: ', E cardinalDirection asString.
	self assert: marsRoverLog includes: 'Position: 4@6'.
	self assert: marsRoverLog includes: 'Direction: ', N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/16/2021 23:06:06'!
test03MarsRoverLogWithInvalidCommand
	|marsRover marsRoverLog|

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ marsRover getLog.
	
	self
		should: [ marsRover moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	self assert: marsRoverLog size equals: 6.
	self assert: marsRoverLog includes: 'Position: 5@5'.
	self assert: marsRoverLog includes: 'Direction: ', N cardinalDirection asString.
	self assert: marsRoverLog includes: 'Position: 5@6'.
	self assert: marsRoverLog includes: 'Direction: ', E cardinalDirection asString.
	self assert: marsRoverLog includes: 'Position: 4@6'.
	self assert: marsRoverLog includes: 'Direction: ', N cardinalDirection asString.
	
	
	
	! !


!classDefinition: #MarsRoverTests category: 'MarsRover-2'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: 'E N S W'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 17:43:30'!
setUp
	N _ North new.
	S _ South new.
	E _ East new.
	W _ West new.! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:12:31'!
test01WithoutCommandsDoesNotMove
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	
	marsRover moveTo: ''.
	
	self assert: marsRover isAt equals: 5@5.
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:12:47'!
test02MoveForwardPointingNorth
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	
	marsRover moveTo: 'f'.
	
	self assert: marsRover isAt equals: 5@6.
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:12:53'!
test03MoveBackwardPointingNorth
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	
	marsRover moveTo: 'b'.
	
	self assert: marsRover isAt equals: 5@4.
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:13:12'!
test04MoveForwardPointingSouth
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: S.
	
	marsRover moveTo: 'f'.
	
	self assert: marsRover isAt equals: 5@4.
	self assert: marsRover pointsTo equals: S cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:13:24'!
test05MoveBarckwardPointingSouth
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: S.
	
	marsRover moveTo: 'b'.
	
	self assert: marsRover isAt equals: 5@6.
	self assert: marsRover pointsTo equals: S cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:13:39'!
test06MoveForwardPointingEast
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: E.
	
	marsRover moveTo: 'f'.
	
	self assert: marsRover isAt equals: 6@5.
	self assert: marsRover pointsTo equals: E cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:13:49'!
test07MoveBackwardPointingEast
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: E.
	
	marsRover moveTo: 'b'.
	
	self assert: marsRover isAt equals: 4@5.
	self assert: marsRover pointsTo equals: E cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:13:58'!
test08MoveForwardPointingWest
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: W.
	
	marsRover moveTo: 'f'.
	
	self assert: marsRover isAt equals: 4@5.
	self assert: marsRover pointsTo equals: W cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:14:06'!
test09MoveBackwardPointingWest
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: W.
	
	marsRover moveTo: 'b'.
	
	self assert: marsRover isAt equals: 6@5.
	self assert: marsRover pointsTo equals: W cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:14:22'!
test10PointingNorthRotateRight
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	
	marsRover moveTo: 'r'.
	
	self assert: marsRover pointsTo equals: E cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:14:32'!
test11PointingNorthRotateLeft
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	
	marsRover moveTo: 'l'.
	
	self assert: marsRover pointsTo equals: W cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:14:43'!
test12PointingSouthRotateRight
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: S.
	
	marsRover moveTo: 'r'.
	
	self assert: marsRover pointsTo equals: W cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:14:54'!
test13PointingSouthRotateLeft
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: S.
	
	marsRover moveTo: 'l'.
	
	self assert: marsRover pointsTo equals: E cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:15:04'!
test14PointingEastRotateRight
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: E.
	
	marsRover moveTo: 'r'.
	
	self assert: marsRover pointsTo equals: S cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:15:17'!
test15PointingEastRotateLeft
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: E.
	
	marsRover moveTo: 'l'.
	
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:15:39'!
test16PointingWestRotateRight
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: W.
	
	marsRover moveTo: 'r'.
	
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:15:50'!
test17PointingWestRotateLeft
	|marsRover|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: W.
	
	marsRover moveTo: 'l'.
	
	self assert: marsRover pointsTo equals: S cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:16:03'!
test18MoveInDifferentDirections
	|marsRover|
	
	marsRover _ MarsRover createAt: 0@0 pointingTo: N.
	
	marsRover moveTo: 'ffrblfb'.
	
	self assert: marsRover isAt equals: -1@2.
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:16:18'!
test19OnCommandFailureStopsMoving
	|marsRover|
	
	marsRover _ MarsRover createAt: 0@0 pointingTo: N.
	
	self
		should: [ marsRover moveTo: 'ffybfff' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	self assert: marsRover isAt equals: 0@2.
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:16:33'!
test20WithUpperCaseCommandDoesNotMove
	|marsRover|
	
	marsRover _ MarsRover createAt: 0@0 pointingTo: N.
	
	self
		should: [ marsRover moveTo: 'FBF' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	self assert: marsRover isAt equals: 0@0.
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'fran 7/1/2021 18:16:40'!
test21WithNumericCommandDoesNotMove
	|marsRover|
	
	marsRover _ MarsRover createAt: 0@0 pointingTo: N.
	
	self
		should: [ marsRover moveTo: '66' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	self assert: marsRover isAt equals: 0@0.
	self assert: marsRover pointsTo equals: N cardinalDirection.
	
	
	
	! !


!classDefinition: #MarsRoverWindowTest category: 'MarsRover-2'!
TestCase subclass: #MarsRoverWindowTest
	instanceVariableNames: 'E N S W'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/16/2021 23:09:02'!
setUp
	N _ North new.
	S _ South new.
	E _ East new.
	W _ West new.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/16/2021 23:14:48'!
test01MarsRoverWindowWithoutCommands
	|marsRover marsRoverWindow|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverWindow _ marsRover getWindow.
	
	marsRover moveTo: ''.
	
	self assert: marsRoverWindow includes: 'Position: 5@5'.
	self assert: marsRoverWindow includes: 'Direction: ', N cardinalDirection asString.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/16/2021 23:19:28'!
test02MarsRoverWindowWithCommands
	|marsRover marsRoverWindow|
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRover moveTo: 'f'.
	marsRoverWindow _ marsRover getWindow.
	self assert: marsRoverWindow includes: 'Position: 5@6'.
	marsRover moveTo: 'r'.
	marsRoverWindow _ marsRover getWindow.
	self assert: marsRoverWindow includes: 'Direction: ', E cardinalDirection asString.
	marsRover moveTo: 'b'.
	marsRoverWindow _ marsRover getWindow.
	self assert: marsRoverWindow includes: 'Position: 4@6'.
	marsRover moveTo: 'l'.
	marsRoverWindow _ marsRover getWindow.
	self assert: marsRoverWindow includes: 'Direction: ', N cardinalDirection asString.
	! !


!classDefinition: #CardinalDirection category: 'MarsRover-2'!
Object subclass: #CardinalDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!


!classDefinition: #East category: 'MarsRover-2'!
CardinalDirection subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!East methodsFor: 'direction' stamp: 'fran 6/29/2021 19:36:24'!
cardinalDirection
	^  1@0! !


!classDefinition: #North category: 'MarsRover-2'!
CardinalDirection subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!North methodsFor: 'direction' stamp: 'fran 6/29/2021 19:36:00'!
cardinalDirection
	^  0@1! !


!classDefinition: #South category: 'MarsRover-2'!
CardinalDirection subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!South methodsFor: 'direction' stamp: 'fran 6/29/2021 19:36:42'!
cardinalDirection
	^  0@-1! !


!classDefinition: #West category: 'MarsRover-2'!
CardinalDirection subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!West methodsFor: 'direction' stamp: 'fran 6/29/2021 19:36:50'!
cardinalDirection
	^  -1@0! !


!classDefinition: #Commands category: 'MarsRover-2'!
Object subclass: #Commands
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!Commands methodsFor: 'movement' stamp: 'fran 6/30/2021 22:32:48'!
move: aMarsRover
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Commands class' category: 'MarsRover-2'!
Commands class
	instanceVariableNames: ''!

!Commands class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 23:25:53'!
canHandle: aCommand
	self subclassResponsibility.! !

!Commands class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 23:26:21'!
for: aCommand
	self subclassResponsibility.! !

!Commands class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 23:28:47'!
with: commandString
	^ (self allSubclasses detect: [:aClass | aClass canHandle: commandString ]) for: commandString.! !


!classDefinition: #Backward category: 'MarsRover-2'!
Commands subclass: #Backward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!Backward methodsFor: 'movement' stamp: 'fran 6/30/2021 22:31:54'!
move: aMarsRover
	aMarsRover moveBackward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backward class' category: 'MarsRover-2'!
Backward class
	instanceVariableNames: ''!

!Backward class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:23:02'!
canHandle: aCommand
	^ aCommand = 'b'.! !

!Backward class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:24:21'!
for: aCommand
	^ self new.! !


!classDefinition: #CommandNotValid category: 'MarsRover-2'!
Commands subclass: #CommandNotValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!CommandNotValid methodsFor: 'movement' stamp: 'fran 6/30/2021 22:47:16'!
move: aMarsRover
	^ aMarsRover notValidMovement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandNotValid class' category: 'MarsRover-2'!
CommandNotValid class
	instanceVariableNames: ''!

!CommandNotValid class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:56:04'!
canHandle: aCommand
	^ (aCommand = 'f') not and: [(aCommand = 'b') not and: [(aCommand = 'l') not and: [(aCommand = 'r') not]]].! !

!CommandNotValid class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:41:18'!
for: aCommand
	^ self new.! !


!classDefinition: #Forward category: 'MarsRover-2'!
Commands subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!Forward methodsFor: 'movement' stamp: 'fran 6/30/2021 22:32:10'!
move: aMarsRover
	aMarsRover moveForward.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Forward class' category: 'MarsRover-2'!
Forward class
	instanceVariableNames: ''!

!Forward class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:23:17'!
canHandle: aCommand
	^ aCommand = 'f'.! !

!Forward class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:24:27'!
for: aCommand
	^ self new.! !


!classDefinition: #RotateLeft category: 'MarsRover-2'!
Commands subclass: #RotateLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!RotateLeft methodsFor: 'movement' stamp: 'fran 6/30/2021 22:32:22'!
move: aMarsRover
	aMarsRover rotateLeft.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateLeft class' category: 'MarsRover-2'!
RotateLeft class
	instanceVariableNames: ''!

!RotateLeft class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:23:26'!
canHandle: aCommand
	^ aCommand = 'l'.! !

!RotateLeft class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:24:31'!
for: aCommand
	^ self new.! !


!classDefinition: #RotateRight category: 'MarsRover-2'!
Commands subclass: #RotateRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!RotateRight methodsFor: 'movement' stamp: 'fran 6/30/2021 22:32:32'!
move: aMarsRover
	aMarsRover rotateRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateRight class' category: 'MarsRover-2'!
RotateRight class
	instanceVariableNames: ''!

!RotateRight class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:23:33'!
canHandle: aCommand
	^ aCommand = 'r'.! !

!RotateRight class methodsFor: 'instance creation' stamp: 'fran 6/30/2021 22:24:34'!
for: aCommand
	^ self new.! !


!classDefinition: #MarsRover category: 'MarsRover-2'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentCardinalDirection log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRover methodsFor: 'movement' stamp: 'fran 6/30/2021 23:32:35'!
moveTo: aCommandString
	|commandString command|

	1 to: aCommandString size do: [ :atIndex | 
			commandString _ (aCommandString at: atIndex) asString.
			command _ Commands with: commandString.
			command move: self.
	]! !


!MarsRover methodsFor: 'position' stamp: 'fran 6/28/2021 23:21:03'!
isAt
	^ currentPosition.! !

!MarsRover methodsFor: 'position' stamp: 'fran 6/29/2021 18:20:40'!
pointsTo
	^ currentCardinalDirection.! !


!MarsRover methodsFor: 'initialization' stamp: 'fran 7/16/2021 22:52:41'!
initializeWith: aPosition pointingTo: aCardinalDirection
	currentPosition _ aPosition.
	currentCardinalDirection  _ aCardinalDirection cardinalDirection.
	log _ OrderedCollection new.
	log add: 'Position: ', currentPosition asString.
	log add: 'Direction: ', currentCardinalDirection asString.
	! !


!MarsRover methodsFor: 'private' stamp: 'fran 7/16/2021 22:49:57'!
moveBackward
	currentPosition _ currentPosition - currentCardinalDirection.
	log add: 'Position: ', currentPosition asString.! !

!MarsRover methodsFor: 'private' stamp: 'fran 7/16/2021 22:50:01'!
moveForward
	currentPosition _ currentPosition + currentCardinalDirection.
	log add: 'Position: ', currentPosition asString.! !

!MarsRover methodsFor: 'private' stamp: 'fran 6/30/2021 23:04:22'!
notValidMovement
	^ self error: MarsRover notValidMovementException.! !

!MarsRover methodsFor: 'private' stamp: 'fran 7/16/2021 23:03:38'!
rotateLeft
	currentCardinalDirection _ (currentCardinalDirection rotatedBy: (Float pi / 2)) truncated.
	log add: 'Direction: ', currentCardinalDirection asString.! !

!MarsRover methodsFor: 'private' stamp: 'fran 7/16/2021 23:03:34'!
rotateRight
	currentCardinalDirection _ (currentCardinalDirection rotatedBy: (3 * Float pi / 2)) truncated.
	log add: 'Direction: ', currentCardinalDirection asString.! !


!MarsRover methodsFor: 'window' stamp: 'fran 7/16/2021 23:14:20'!
getWindow
	|window|
	window _ OrderedCollection new.
	window add: 'Position: ', currentPosition asString.
	window add: 'Direction: ', currentCardinalDirection asString.
	^ window.! !


!MarsRover methodsFor: 'log' stamp: 'fran 7/16/2021 22:47:30'!
getLog
	^ log.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-2'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'fran 7/1/2021 17:42:59'!
createAt: aPosition pointingTo: aCardinalDirection
	^ self new initializeWith: aPosition pointingTo: aCardinalDirection.! !


!MarsRover class methodsFor: 'error description' stamp: 'fran 6/30/2021 23:03:05'!
notValidMovementException
	^ 'The movement is not valid'.! !
