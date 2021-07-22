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

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:42:49'!
test01MarsRoverLogPositionWithoutCommands
	|log logCheck |
	
	marsRovers attachPosition: marsRoverLog.
	marsRovers moveTo: ''.
	logCheck _ OrderedCollection withAll: #().
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:42:07'!
test02MarsRoverLogPositionWithCommands
	|log logCheck | 

	marsRovers attachPosition: marsRoverLog.
	
	marsRovers moveTo: 'frbl'.
	logCheck _ OrderedCollection withAll: #('5@6' '4@6').
.
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:43:45'!
test03MarsRoverLogPositionWithInvalidCommand
	|log logCheck |

	marsRovers attachPosition: marsRoverLog.
	
	self
		should: [ marsRovers moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	logCheck _ OrderedCollection withAll: #('5@6' '4@6').
.
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:44:18'!
test04MarsRoverLogDirectionWithoutCommands
	|log logCheck |

	marsRovers attachDirection: marsRoverLog.
	
	marsRovers moveTo: ''.
	logCheck _ OrderedCollection withAll: #().
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:50:39'!
test05MarsRoverLogDirectionWithCommands
	|log logCheck | 

	marsRovers attachDirection: marsRoverLog.
	
	marsRovers moveTo: 'frbl'.
	logCheck _ OrderedCollection withAll: #('1@0' '0@1').
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:50:48'!
test06MarsRoverLogDirectionWithInvalidCommand
	|log logCheck |

	marsRovers attachDirection: marsRoverLog.
	
	self
		should: [ marsRovers moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	logCheck _ OrderedCollection withAll: #('1@0' '0@1').
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:51:06'!
test07MarsRoverLogBothWithoutCommands
	|log logCheck |

	marsRovers attachBoth: marsRoverLog.
	
	marsRovers moveTo: ''.
	logCheck _ OrderedCollection withAll: #().
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:52:41'!
test08MarsRoverLogBothWithCommands
	|log logCheck | 

	marsRovers attachBoth: marsRoverLog.
	
	marsRovers moveTo: 'frbl'.
	
	logCheck _ OrderedCollection withAll: #('5@6' '1@0' '4@6' '0@1').
.
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:52:50'!
test09MarsRoverLogBothWithInvalidCommand
	|log logCheck |

	marsRovers attachBoth: marsRoverLog.
	
	self
		should: [ marsRovers moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	logCheck _ OrderedCollection withAll: #('5@6' '1@0' '4@6' '0@1').
.
	log _ marsRoverLog getLog.
	
	self assert: log = logCheck.
	
	
	
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

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/21/2021 23:01:36'!
setUp
	N _ North new.
	S _ South new.
	E _ East new.
	W _ West new.
	marsRovers _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindows _ MarsRoverStatusWindow new.! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 13:01:41'!
test01MarsRoverWindowPositionWithoutCommands
	|statusWindow windowCheck |
	
	marsRovers attachPosition: marsRoverStatusWindows.
	
	marsRovers moveTo: ''.
	windowCheck _ OrderedCollection withAll: #().
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	
	self assert: statusWindow = windowCheck.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 13:00:45'!
test02MarsRoverWindowPositionWithCommands
	|statusWindow windowCheck |
	marsRovers attachPosition: marsRoverStatusWindows.
		
	
	marsRovers moveTo: 'f'.
	windowCheck _ OrderedCollection withAll: #('5@6').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'r'.
	windowCheck _ OrderedCollection withAll: #('5@6').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'b'.
	windowCheck _ OrderedCollection withAll: #('4@6').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'l'.
	windowCheck _ OrderedCollection withAll: #('4@6').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.

	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 13:01:50'!
test03MarsRoverWindowDirectionWithoutCommands
	|statusWindow windowCheck |
	
	marsRovers attachDirection: marsRoverStatusWindows.
	
	marsRovers moveTo: ''.
	windowCheck _ OrderedCollection withAll: #().
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	
	self assert: statusWindow = windowCheck.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 13:05:51'!
test04MarsRoverWindowDirectionWithCommands
	|statusWindow windowCheck |
	
	marsRovers attachDirection: marsRoverStatusWindows.
		
	marsRovers moveTo: 'f'.
	windowCheck _ OrderedCollection withAll: #().
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'r'.
	windowCheck _ OrderedCollection withAll: #('1@0').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'b'.
	windowCheck _ OrderedCollection withAll: #('1@0').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'l'.
	windowCheck _ OrderedCollection withAll: #('0@1').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 13:04:52'!
test05MarsRoverWindowBothWithoutCommands
	|statusWindow windowCheck |
	
	marsRovers attachBoth: marsRoverStatusWindows.
	
	marsRovers moveTo: ''.
	windowCheck _ OrderedCollection withAll: #().
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	
	self assert: statusWindow = windowCheck.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/22/2021 15:24:19'!
test06MarsRoverWindowBothWithCommands
	|statusWindow windowCheck |
	
	marsRovers attachBoth: marsRoverStatusWindows.

	marsRovers moveTo: 'f'.
	windowCheck _ OrderedCollection withAll: #('5@6').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'r'.
	windowCheck _ OrderedCollection withAll: #('5@6' '1@0').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'b'.
	windowCheck _ OrderedCollection withAll: #('4@6' '1@0').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.
	
	marsRovers moveTo: 'l'.
	windowCheck _ OrderedCollection withAll: #('4@6' '0@1').
	statusWindow _ marsRoverStatusWindows getStatusWindow.
	self assert: statusWindow = windowCheck.! !


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

!MarsRover class methodsFor: 'instance creation' stamp: 'fj 7/22/2021 12:20:32'!
createAt: aPosition pointingTo: aCardinalDirection
	|marsRoverPosition marsRoverDirection|
	marsRoverPosition _ MarsRoverAttribute createFor: aPosition onChange: #updatePosition:.
	marsRoverDirection _ MarsRoverAttribute createFor: aCardinalDirection cardinalDirection onChange: #updateDirection:.
	^ self new initializeWith: marsRoverPosition pointingTo: marsRoverDirection.! !


!MarsRover class methodsFor: 'error description' stamp: 'fran 6/30/2021 23:03:05'!
notValidMovementException
	^ 'The movement is not valid'.! !


!classDefinition: #MarsRoverAttribute category: 'MarsRover-2'!
Object subclass: #MarsRoverAttribute
	instanceVariableNames: 'attribute observers changeMessage'
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

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 11:46:50'!
initializeWith: aMarsRoverAttribute onChange: onChangeMessage
	attribute _ aMarsRoverAttribute.
	changeMessage _ onChangeMessage.
	observers _ OrderedCollection new.! !

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 12:16:49'!
notifyChange
	observers do: [:anObserver | changeMessage sendTo: anObserver with: self ].! !

!MarsRoverAttribute methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 11:29:56'!
value
	^ attribute .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverAttribute class' category: 'MarsRover-2'!
MarsRoverAttribute class
	instanceVariableNames: ''!

!MarsRoverAttribute class methodsFor: 'as yet unclassified' stamp: 'fj 7/22/2021 11:46:15'!
createFor: aMarsRoverAttribute onChange: onChangeMessage
	^self new initializeWith: aMarsRoverAttribute onChange: onChangeMessage.! !


!classDefinition: #MarsRoverLog category: 'MarsRover-2'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverLog methodsFor: 'main protocol' stamp: 'fran 7/19/2021 21:25:21'!
getLog
	^ log.! !

!MarsRoverLog methodsFor: 'main protocol' stamp: 'fj 7/22/2021 12:13:15'!
updateDirection: aMarsRoverAttribute
	log add: aMarsRoverAttribute value asString.
	! !

!MarsRoverLog methodsFor: 'main protocol' stamp: 'fj 7/22/2021 12:13:08'!
updatePosition: aMarsRoverAttribute
	log add: aMarsRoverAttribute value asString.
	! !


!MarsRoverLog methodsFor: 'initialization' stamp: 'fran 7/20/2021 23:03:25'!
initialize
	log _ OrderedCollection new.! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-2'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'currentCardinalPosition currentCardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverStatusWindow methodsFor: 'main protocol' stamp: 'fj 7/22/2021 12:26:31'!
getStatusWindow
	| statusWindow |
	statusWindow _ OrderedCollection new.
	(currentCardinalPosition) ifNotNil: [statusWindow add: currentCardinalPosition].
	(currentCardinalDirection ) ifNotNil: [statusWindow add: currentCardinalDirection].
	^statusWindow .! !

!MarsRoverStatusWindow methodsFor: 'main protocol' stamp: 'fj 7/22/2021 12:24:45'!
updateDirection: aMarsRoverAttribute

	currentCardinalDirection _ aMarsRoverAttribute value asString.
	! !

!MarsRoverStatusWindow methodsFor: 'main protocol' stamp: 'fj 7/22/2021 12:24:19'!
updatePosition: aMarsRoverAttribute

	currentCardinalPosition _ aMarsRoverAttribute value asString.
	! !


!MarsRoverStatusWindow methodsFor: 'initialization' stamp: 'fj 7/22/2021 12:23:49'!
initialize
	currentCardinalPosition _ nil.
	currentCardinalDirection _ nil.! !
