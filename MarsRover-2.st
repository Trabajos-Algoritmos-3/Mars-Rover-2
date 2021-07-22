!classDefinition: #MarsRoverLogTest category: 'MarsRover-2'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: 'E N S W marsRoverLog marsRovers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:51:52'!
setUp
	N _ North new.
	S _ South new.
	E _ East new.
	W _ West new.
	marsRovers _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:52:13'!
test01MarsRoverLogPositionWithoutCommands
	|log|
	
	marsRovers attachPosition: marsRoverLog.
	marsRovers moveTo: ''.
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 0.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:52:26'!
test02MarsRoverLogPositionWithCommands
	|log| 

	marsRovers attachPosition: marsRoverLog.
	
	marsRovers moveTo: 'frbl'.
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 2.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:52:41'!
test03MarsRoverLogPositionWithInvalidCommand
	|log |

	marsRovers attachPosition: marsRoverLog.
	
	self
		should: [ marsRovers moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 2.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:52:49'!
test04MarsRoverLogDirectionWithoutCommands
	|log|

	marsRovers attachDirection: marsRoverLog.
	
	marsRovers moveTo: ''.
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 0.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:53:05'!
test05MarsRoverLogDirectionWithCommands
	|log| 

	marsRovers attachDirection: marsRoverLog.
	
	marsRovers moveTo: 'frbl'.
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 2.
	self assert: log includes: E cardinalDirection asString.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:53:17'!
test06MarsRoverLogDirectionWithInvalidCommand
	|log |

	marsRovers attachDirection: marsRoverLog.
	
	self
		should: [ marsRovers moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 2.
	self assert: log includes: E cardinalDirection asString.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:53:36'!
test07MarsRoverLogBothWithoutCommands
	|log|

	marsRovers attachBoth: marsRoverLog.
	
	marsRovers moveTo: ''.
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 0.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:53:47'!
test08MarsRoverLogBothWithCommands
	|log| 

	marsRovers attachBoth: marsRoverLog.
	
	marsRovers moveTo: 'frbl'.
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 4.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	self assert: log includes: E cardinalDirection asString.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 22:54:28'!
test09MarsRoverLogBothWithInvalidCommand
	|log|

	marsRovers attachBoth: marsRoverLog.
	
	self
		should: [ marsRovers moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 4.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	self assert: log includes: E cardinalDirection asString.
	self assert: log includes: N cardinalDirection asString.
	
	
	
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
	instanceVariableNames: 'E N S W marsRovers marsRoverStatusWindows'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:11:52'!
fff: amarsRovers iii: amarsRoverStatusWindows
	|statusWindow|
	
	amarsRovers moveTo: 'f'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	amarsRovers moveTo: 'r'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	amarsRovers moveTo: 'b'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	amarsRovers moveTo: 'l'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:01:36'!
setUp
	N _ North new.
	S _ South new.
	E _ East new.
	W _ West new.
	marsRovers _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindows _ MarsRoverStatusWindow new.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:02:31'!
test01MarsRoverWindowPositionWithoutCommands
	|statusWindow |
	
	marsRovers attachPosition: marsRoverStatusWindows.
	
	marsRovers moveTo: ''.
	
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	
	self assert: statusWindow size equals: 0.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:12:18'!
test02MarsRoverWindowPositionWithCommands
	
	marsRovers attachPosition: marsRoverStatusWindows.
	self fff: marsRovers iii: marsRoverStatusWindows.

	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:03:51'!
test03MarsRoverWindowDirectionWithoutCommands
	|statusWindow|
	
	marsRovers attachDirection: marsRoverStatusWindows.
	
	marsRovers moveTo: ''.
	
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	
	self assert: statusWindow size equals: 0.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:10:17'!
test04MarsRoverWindowDirectionWithCommands
	
	
	marsRovers attachDirection: marsRoverStatusWindows.
	self xxx: marsRovers yyy: marsRoverStatusWindows.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:04:26'!
test05MarsRoverWindowBothWithoutCommands
	|statusWindow |
	
	marsRovers attachBoth: marsRoverStatusWindows.
	
	marsRovers moveTo: ''.
	
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	
	self assert: statusWindow size equals: 0.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:04:55'!
test06MarsRoverWindowBothWithCommands
	|statusWindow|
	
	marsRovers attachBoth: marsRoverStatusWindows.

	marsRovers moveTo: 'f'.
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	marsRovers moveTo: 'r'.
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	self assert: statusWindow includes: E cardinalDirection asString.
	marsRovers moveTo: 'b'.
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	self assert: statusWindow includes: E cardinalDirection asString.
	marsRovers moveTo: 'l'.
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	self assert: statusWindow includes: N cardinalDirection asString.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:07:49'!
xxx: aMarsRover yyy: amarsRoverStatusWindows
	|statusWindow |
	aMarsRover moveTo: 'f'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	aMarsRover moveTo: 'r'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: E cardinalDirection asString.
	aMarsRover moveTo: 'b'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: E cardinalDirection asString.
	aMarsRover moveTo: 'l'.
	statusWindow _ amarsRoverStatusWindows getStatusWindow.
	self assert: statusWindow includes: N cardinalDirection asString.
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

!North methodsFor: 'direction' stamp: 'fj 7/22/2021 00:38:34'!
cardinalDirection
	^ 0@1! !


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
	instanceVariableNames: 'position cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRover methodsFor: 'movement' stamp: 'fran 7/19/2021 21:32:47'!
moveTo: aCommandString
	|commandString command|

	1 to: aCommandString size do: [ :atIndex | 
			commandString _ (aCommandString at: atIndex) asString.
			command _ Commands with: commandString.
			command move: self.
	]

	! !


!MarsRover methodsFor: 'position' stamp: 'fran 7/20/2021 23:55:14'!
isAt
	^ position value.! !

!MarsRover methodsFor: 'position' stamp: 'fran 7/20/2021 23:55:30'!
pointsTo
	^ cardinalDirection value.! !


!MarsRover methodsFor: 'initialization' stamp: 'fran 7/20/2021 23:55:43'!
initializeWith: aPosition pointingTo: aCardinalDirection
	position _ aPosition.
	cardinalDirection  _ aCardinalDirection.! !


!MarsRover methodsFor: 'private' stamp: 'fj 7/22/2021 00:22:29'!
moveBackward
	position change: (position value - cardinalDirection value).! !

!MarsRover methodsFor: 'private' stamp: 'fj 7/22/2021 00:22:34'!
moveForward
	position change: (position value + cardinalDirection value).! !

!MarsRover methodsFor: 'private' stamp: 'fran 6/30/2021 23:04:22'!
notValidMovement
	^ self error: MarsRover notValidMovementException.! !

!MarsRover methodsFor: 'private' stamp: 'fj 7/22/2021 00:22:46'!
rotateLeft
	cardinalDirection change: (cardinalDirection value rotatedBy: (Float pi / 2)) truncated.! !

!MarsRover methodsFor: 'private' stamp: 'fj 7/22/2021 00:23:06'!
rotateRight
	cardinalDirection change: (cardinalDirection value rotatedBy: (3 * Float pi / 2)) truncated.! !


!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 23:48:59'!
attachBoth: anObserver
	self attachDirection: anObserver.
	self attachPosition: anObserver.! !

!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 23:55:30'!
attachDirection: anObserver
	cardinalDirection attach: anObserver.! !

!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 23:55:14'!
attachPosition: anObserver
	position attach: anObserver.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-2'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'fj 7/22/2021 00:21:51'!
createAt: aPosition pointingTo: aCardinalDirection
	|marsRoverPosition marsRoverDirection|
	marsRoverPosition _ MarsRoverAttribute createFor: aPosition.
	marsRoverDirection _ MarsRoverAttribute createFor: aCardinalDirection cardinalDirection.
	^ self new initializeWith: marsRoverPosition pointingTo: marsRoverDirection.! !


!MarsRover class methodsFor: 'error description' stamp: 'fran 6/30/2021 23:03:05'!
notValidMovementException
	^ 'The movement is not valid'.! !


!classDefinition: #MarsRoverAttribute category: 'MarsRover-2'!
Object subclass: #MarsRoverAttribute
	instanceVariableNames: 'attribute observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 00:00:47'!
attach: anObserver
	observers add: anObserver.! !

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 00:18:18'!
change: aMarsRoverAttribute
	attribute _ aMarsRoverAttribute.
	self notifyChange.! !

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 00:18:18'!
initializeWith: aMarsRoverAttribute
	attribute _ aMarsRoverAttribute.
	observers _ OrderedCollection new.! !

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 00:14:53'!
notifyChange
	observers do: [:anObserver | anObserver update: self].! !

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 00:18:18'!
value
	^ attribute .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverAttribute class' category: 'MarsRover-2'!
MarsRoverAttribute class
	instanceVariableNames: ''!

!MarsRoverAttribute class methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 00:19:31'!
createFor: aMarsRoverAttribute
	^self new initializeWith: aMarsRoverAttribute .! !


!classDefinition: #MarsRoverLog category: 'MarsRover-2'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverLog methodsFor: 'main protocol' stamp: 'fran 7/19/2021 21:25:21'!
getLog
	^ log.! !

!MarsRoverLog methodsFor: 'main protocol' stamp: 'fran 7/20/2021 23:50:52'!
update: aMarsRover
	log add: aMarsRover value asString.
	! !


!MarsRoverLog methodsFor: 'initialization' stamp: 'fran 7/20/2021 23:03:25'!
initialize
	log _ OrderedCollection new.! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-2'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'oO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverStatusWindow methodsFor: 'main protocol' stamp: 'fj 7/22/2021 00:27:11'!
getStatusWindow
	^oO .
	! !

!MarsRoverStatusWindow methodsFor: 'main protocol' stamp: 'fj 7/22/2021 00:38:20'!
update: aMarsRover
	| value |
	value _ aMarsRover value asString.
	value isKindOf: CardinalDirection.
	! !


!MarsRoverStatusWindow methodsFor: 'initialization' stamp: 'fj 7/22/2021 00:26:37'!
initialize
	oO _ OrderedCollection new.! !
