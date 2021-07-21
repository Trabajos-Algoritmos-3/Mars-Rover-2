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

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:03:06'!
test01MarsRoverLogPositionWithoutCommands
	|marsRover marsRoverLog log|

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachPosition: marsRoverLog.
	
	marsRover moveTo: ''.
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 1.
	self assert: log includes: '5@5'.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:03:47'!
test02MarsRoverLogPositionWithCommands
	|marsRover marsRoverLog log| 

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachPosition: marsRoverLog.
	
	marsRover moveTo: 'frbl'.
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 3.
	self assert: log includes: '5@5'.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:04:01'!
test03MarsRoverLogPositionWithInvalidCommand
	|marsRover marsRoverLog log |

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachPosition: marsRoverLog.
	
	self
		should: [ marsRover moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 3.
	self assert: log includes: '5@5'.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:04:05'!
test04MarsRoverLogDirectionWithoutCommands
	|marsRover marsRoverLog log|

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachDirection: marsRoverLog.
	
	marsRover moveTo: ''.
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 1.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:04:09'!
test05MarsRoverLogDirectionWithCommands
	|marsRover marsRoverLog log| 

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachDirection: marsRoverLog.
	
	marsRover moveTo: 'frbl'.
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 3.
	self assert: log includes: N cardinalDirection asString.
	self assert: log includes: E cardinalDirection asString.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:04:14'!
test06MarsRoverLogDirectionWithInvalidCommand
	|marsRover marsRoverLog log |

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachDirection: marsRoverLog.
	
	self
		should: [ marsRover moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 3.
	self assert: log includes: N cardinalDirection asString.
	self assert: log includes: E cardinalDirection asString.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:04:19'!
test07MarsRoverLogBothWithoutCommands
	|marsRover marsRoverLog log|

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachBoth: marsRoverLog.
	
	marsRover moveTo: ''.
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 2.
	self assert: log includes: '5@5'.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:04:23'!
test08MarsRoverLogBothWithCommands
	|marsRover marsRoverLog log| 

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachBoth: marsRoverLog.
	
	marsRover moveTo: 'frbl'.
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 6.
	self assert: log includes: '5@5'.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	self assert: log includes: N cardinalDirection asString.
	self assert: log includes: E cardinalDirection asString.
	self assert: log includes: N cardinalDirection asString.
	
	
	
	! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:04:28'!
test09MarsRoverLogBothWithInvalidCommand
	|marsRover marsRoverLog log |

	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverLog _ MarsRoverLog new.
	marsRover attachBoth: marsRoverLog.
	
	self
		should: [ marsRover moveTo: 'frbl fbfbfbfbf' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = MarsRover notValidMovementException ].
	
	log _ marsRoverLog getLog.
	
	self assert: log size equals: 6.
	self assert: log includes: '5@5'.
	self assert: log includes: '5@6'.
	self assert: log includes: '4@6'.
	self assert: log includes: N cardinalDirection asString.
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

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:10:35'!
test01MarsRoverWindowPositionWithoutCommands
	|marsRover marsRoverStatusWindow statusWindow |
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindow _ MarsRoverStatusWindow logging: #Position.
	marsRover attachPosition: marsRoverStatusWindow.
	
	marsRover moveTo: ''.
	
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	
	self assert: statusWindow includes: '5@5'.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:10:45'!
test02MarsRoverWindowPositionWithCommands
	|marsRover marsRoverStatusWindow statusWindow |
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindow _ MarsRoverStatusWindow logging: #Position.
	marsRover attachPosition: marsRoverStatusWindow.
	
	marsRover moveTo: 'f'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	marsRover moveTo: 'r'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	marsRover moveTo: 'b'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	marsRover moveTo: 'l'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:11:34'!
test03MarsRoverWindowDirectionWithoutCommands
	|marsRover marsRoverStatusWindow statusWindow |
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindow _ MarsRoverStatusWindow logging: #Direction.
	marsRover attachDirection: marsRoverStatusWindow.
	
	marsRover moveTo: ''.
	
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	
	self assert: statusWindow includes: N cardinalDirection asString.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:11:00'!
test04MarsRoverWindowDirectionWithCommands
	|marsRover marsRoverStatusWindow statusWindow |
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindow _ MarsRoverStatusWindow logging: #Direction.
	marsRover attachDirection: marsRoverStatusWindow.

	marsRover moveTo: 'f'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: N cardinalDirection asString.
	marsRover moveTo: 'r'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: E cardinalDirection asString.
	marsRover moveTo: 'b'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: E cardinalDirection asString.
	marsRover moveTo: 'l'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: N cardinalDirection asString.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:11:16'!
test05MarsRoverWindowBothWithoutCommands
	|marsRover marsRoverStatusWindow statusWindow |
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindow _ MarsRoverStatusWindow logging: #Both.
	marsRover attachBoth: marsRoverStatusWindow.
	
	marsRover moveTo: ''.
	
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	
	self assert: statusWindow includes: '5@5'.
	self assert: statusWindow includes: N cardinalDirection asString.
	! !

!MarsRoverWindowTest methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:11:09'!
test06MarsRoverWindowBothWithCommands
	|marsRover marsRoverStatusWindow statusWindow |
	
	marsRover _ MarsRover createAt: 5@5 pointingTo: N.
	marsRoverStatusWindow _ MarsRoverStatusWindow logging: #Both.
	marsRover attachBoth: marsRoverStatusWindow.

	marsRover moveTo: 'f'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	self assert: statusWindow includes: N cardinalDirection asString.
	marsRover moveTo: 'r'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '5@6'.
	self assert: statusWindow includes: E cardinalDirection asString.
	marsRover moveTo: 'b'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	self assert: statusWindow includes: E cardinalDirection asString.
	marsRover moveTo: 'l'.
	statusWindow _ marsRoverStatusWindow getStatusWindow.
	self assert: statusWindow includes: '4@6'.
	self assert: statusWindow includes: N cardinalDirection asString.! !


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
	instanceVariableNames: 'currentPosition currentCardinalDirection observersPosition observersDirection'
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


!MarsRover methodsFor: 'position' stamp: 'fran 6/28/2021 23:21:03'!
isAt
	^ currentPosition.! !

!MarsRover methodsFor: 'position' stamp: 'fran 6/29/2021 18:20:40'!
pointsTo
	^ currentCardinalDirection.! !


!MarsRover methodsFor: 'initialization' stamp: 'fran 7/20/2021 22:55:09'!
initializeWith: aPosition pointingTo: aCardinalDirection
	currentPosition _ aPosition.
	currentCardinalDirection  _ aCardinalDirection cardinalDirection.
	observersPosition _ OrderedCollection new.
	observersDirection _ OrderedCollection new.! !


!MarsRover methodsFor: 'private' stamp: 'fran 7/19/2021 21:35:11'!
moveBackward
	currentPosition _ currentPosition - currentCardinalDirection.
	self notifyChangeOfPosition.! !

!MarsRover methodsFor: 'private' stamp: 'fran 7/19/2021 21:35:26'!
moveForward
	currentPosition _ currentPosition + currentCardinalDirection.
	self notifyChangeOfPosition.! !

!MarsRover methodsFor: 'private' stamp: 'fran 6/30/2021 23:04:22'!
notValidMovement
	^ self error: MarsRover notValidMovementException.! !

!MarsRover methodsFor: 'private' stamp: 'fran 7/19/2021 21:35:35'!
rotateLeft
	currentCardinalDirection _ (currentCardinalDirection rotatedBy: (Float pi / 2)) truncated.
	self notifyChangeOfDirection.! !

!MarsRover methodsFor: 'private' stamp: 'fran 7/19/2021 21:35:42'!
rotateRight
	currentCardinalDirection _ (currentCardinalDirection rotatedBy: (3 * Float pi / 2)) truncated.
	self notifyChangeOfDirection.! !


!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 22:56:46'!
attachBoth: anObserver
	observersPosition add: anObserver.
	observersDirection add: anObserver.
	anObserver updatePosition: self.
	anObserver updateDirection: self.! !

!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 22:56:12'!
attachDirection: anObserver
	observersDirection add: anObserver.
	anObserver updateDirection: self.! !

!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 22:55:56'!
attachPosition: anObserver
	observersPosition add: anObserver.
	anObserver updatePosition: self.! !

!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 22:57:09'!
notifyChangeOfDirection
	observersDirection do: [:anObserver | anObserver updateDirection: self].! !

!MarsRover methodsFor: 'observable' stamp: 'fran 7/20/2021 22:57:16'!
notifyChangeOfPosition
	observersPosition do: [:anObserver | anObserver updatePosition: self].! !

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


!classDefinition: #MarsRoverLog category: 'MarsRover-2'!
Object subclass: #MarsRoverLog
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fran 7/19/2021 21:25:21'!
getLog
	^ log.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:03:25'!
initialize
	log _ OrderedCollection new.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:01:30'!
updateDirection: aMarsRover
	log add: aMarsRover pointsTo asString.
	! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:01:49'!
updatePosition: aMarsRover
	log add: aMarsRover isAt asString.
	! !


!classDefinition: #MarsRoverStatusWindow category: 'MarsRover-2'!
Object subclass: #MarsRoverStatusWindow
	instanceVariableNames: 'currentCardinalPosition currentCardinalDirection logger'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-2'!

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fran 7/19/2021 23:33:34'!
getStatusWindow
	|statusWindow|
	statusWindow _ OrderedCollection new.
	(logger = #Direction) ifTrue: [statusWindow add: currentCardinalDirection].
	(logger = #Position) ifTrue: [statusWindow add: currentCardinalPosition].
	(logger = #Both) ifTrue: [statusWindow add: currentCardinalPosition. statusWindow add: currentCardinalDirection ].
	^statusWindow
	! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:10:12'!
initializeWith: aLogger
	logger _ aLogger.! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:05:07'!
updateDirection: aMarsRover
	currentCardinalDirection _ aMarsRover pointsTo asString.! !

!MarsRoverStatusWindow methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:05:16'!
updatePosition: aMarsRover
	currentCardinalPosition _ aMarsRover isAt asString
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStatusWindow class' category: 'MarsRover-2'!
MarsRoverStatusWindow class
	instanceVariableNames: ''!

!MarsRoverStatusWindow class methodsFor: 'as yet unclassified' stamp: 'fran 7/20/2021 23:09:54'!
logging: aLogger
	^self new initializeWith: aLogger.! !
