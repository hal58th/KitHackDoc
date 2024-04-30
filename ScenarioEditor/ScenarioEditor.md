# Scenario Editor

## Table of Contents

[Overview](#Overview)

[Specifics](#Specifics)

[How do I do...?](#how-do-i-do)
* [Create an NPC and have it follow a path](#create-an-npc-and-have-it-follow-a-path)
* [Display Lap Time As Floater](#display-lap-time-as-a-floater)
[Methods](#Methods)

[Other Resources](#Other-Resources)

[Scenario Ideas](ScenarioIdeas.md)

## Video Tutorials

1. [KitHack Model Club Scenario Editor Overview - By Jacob Siepker (Kithack Developer)](https://www.youtube.com/watch?v=2xT9QH6O6a0)

## Overview

Copied from: [Dev Blog - Scenario Editor Deep Dive](https://store.steampowered.com/news/app/2107090/view/3995322938534878130)

### Stages

Stages are like parts of a triathalon. A stage is completed after completing a pretermined waypoint. A lot of scenarios only have one stage.

### Modules

Once you add a module to a mission stage, you can configure it using the sidebar panel. Each module has its own set of options here, and most of them will have inputs or outputs for triggers.

### Props

Props are objects you can place around the map. These can be anything from set decoration, track markers, to functional mission elements.
Some props are also procedural, like the geotex runways you can lay down anywhere, and they will adapt to the terrain.

### Triggers

Triggers are the main way by which the different bits of the scenario logic can communicate with one another. Props and Modules can generate triggers. You can connect trigger inputs from other things to these, so that when the trigger signal goes out, whatever is plugged in will receive it.

### Parameters

Parameters are very much like global variables. They are defined in the mission parameters panel, and are always accessible to everything in the mission.

Parameters can be read by or written to by props and modules using parameter input and output ports, which are connected in the same way you would link up triggers. To make it clear if something is going to be reading or writing, we've got different styles of input and output ports.

Parameters can also come in the form of Expressions. Expressions are basically a line of script code, which gets evaluated and stores the result in the value of the parameter. This can be literally anything. It actually is a line of runtime compiled C# code, which allows you to access anything in the game, including the value of other parameters.

### Scripts

You can use scripts through the Script Module, which lets you write actual code, which gets executed by an input trigger signal. Scripts are basically C# code, but they also support our custom syntax for accessing mission parameters.

## Specifics

### Types of Modules

* Actions
* AI/NPCs
* Career
* Flow Control
* Game Setup
* Logic
* Propes
* Tracking
* Trigger Logic
* UI

TODO...

### Scripts

Compile log location:
You are supposed to be able to see the logs with the log viewer (F8). But you can view the log at:
`%USERPROFILE%\AppData\LocalLow\Floating Origin Interactive\KitHack Model Club\Player.log`

## How do I do...?

### Create an NPC and have it follow a path

TODO...

### Display lap time as floater

The script below needs to be added as a `.scs` extension and put it in your scenario folder.
Add a "Logic"->"Script from file module", add it, compile it and hit test. You will also need to add a float parameter called currentLapTime to have it compile successfully.
Hook it up to your lap trigger and it will display when a lap is complete.

```c#
String lapTimeStr;
lapTimeStr = "Lap Time! " + [[currentLapTime]].ToString();

Floater("hello".RTColor(XKCDColors.NotSoGoodOrange).RTItalic());
Floater(lapTimeStr.RTColor(XKCDColors.NotSoGoodOrange).RTItalic());   
```

## Methods

Not sure if this is useful at all.

### Vehicle Methods

```
get_ReferenceTransform
GetName
get_VehicleInfo
set_VehicleInfo
get_Parameters
get_Construct
get_ConstructData
set_ConstructData
get_IsLocalVehicle
get_IsPlayerVehicle
get_IsLocalPlayerVehicle
get_IsInLocalEditor
get_IsEditing
get_IsAuthorityOrBot
get_IsViewTarget
get_PlayerOwner
get_Receiver
get_Rb
get_RootPart
get_AttachedPartsCount
get_Spawned
get_InitComplete
get_VehicleComponents
get_Autotrim
get_Physics
get_CollisionMgmt
get_NetMovement
get_Resources
get_Paint
get_Ballistics
get_Volumetrics
get_Logger
get_Scoring
get_SignalStrength
get_Wind
get_ActionsInteraction
NotifyHierarchyModified
Start
FindPlayerOwner
SetPlayerOwner
Spawn
SpawnPart
DeletePartSet
RecurseDeletePartSet
PartModules
GetModules
GetAllVehicleModules
FindPartByConstructID
SetVehicleGround
AdjustToGround
StartFlight
ResetVehicle
RestoreDamage
ResetHighlightRenderers
GetHighlighter
OnEditorStart
OnEditorEnd
SaveToFile
SaveConstructToFile
UpdateConstructData
get_isDespawning
get_ShouldDrawForces
get_NetworkScnCraftSpawnGuid
set_NetworkScnCraftSpawnGuid
get_NetworkisEditing
set_NetworkisEditing
get_NetworkplayerOwnerId
set_NetworkplayerOwnerId
SerializeSyncVars
DeserializeSyncVars
get_isServer
get_isClient
get_isLocalPlayer
get_isServerOnly
get_isClientOnly
get_isOwned
get_hasAuthority
get_authority
get_netId
get_connectionToServer
get_connectionToClient
get_netIdentity
get_ComponentIndex
SetSyncVarDirtyBit
SetDirty
IsDirty
ClearAllDirtyBits
GeneratedSyncVarSetter
GeneratedSyncVarSetter_GameObject
GeneratedSyncVarSetter_NetworkIdentity
GeneratedSyncVarSetter_NetworkBehaviour
GeneratedSyncVarDeserialize
GeneratedSyncVarDeserialize_GameObject
GeneratedSyncVarDeserialize_NetworkIdentity
GeneratedSyncVarDeserialize_NetworkBehaviour
OnSerialize
OnDeserialize
SerializeObjectsAll
SerializeObjectsDelta
OnStartServer
OnStopServer
OnStartClient
OnStopClient
OnStartLocalPlayer
OnStopLocalPlayer
OnStartAuthority
OnStopAuthority
IsInvoking
CancelInvoke
Invoke
InvokeRepeating
CancelInvoke
IsInvoking
StartCoroutine
StartCoroutine_Auto
StopCoroutine
StopAllCoroutines
get_useGUILayout
set_useGUILayout
get_enabled
set_enabled
get_isActiveAndEnabled
get_transform
get_gameObject
GetComponent
TryGetComponent
GetComponent
GetComponentInChildren
GetComponentsInChildren
GetComponentInParent
GetComponents
get_tag
set_tag
GetComponents
CompareTag
SendMessageUpwards
SendMessage
BroadcastMessage
GetInstanceID
GetHashCode
Equals
get_name
set_name
get_hideFlags
set_hideFlags
ToString
GetType
Vehicle Properties
UnityEngine.Transform ReferenceTransform
VehicleInfo VehicleInfo
VehicleParameters Parameters
Construct Construct
Byte[] ConstructData
Boolean IsLocalVehicle
Boolean IsPlayerVehicle
Boolean IsLocalPlayerVehicle
Boolean IsInLocalEditor
Boolean IsEditing
Boolean IsAuthorityOrBot
Boolean IsViewTarget
IVehicleOwner PlayerOwner
FSInputReceiver Receiver
FSRigidbody Rb
Part RootPart
Int32 AttachedPartsCount
Boolean Spawned
Boolean InitComplete
System.Collections.Generic.IEnumerable`1[IVehicleComponent] VehicleComponents
FSControl.AutoTrim Autotrim
VehiclePhysics Physics
VehicleCollisionMgmt CollisionMgmt
VehicleNetworkMovement NetMovement
VehicleResources Resources
VehiclePaint Paint
VehicleBallistics Ballistics
VehicleVolumetrics Volumetrics
Vehicles.Logging.VehicleLogger Logger
VehicleScoring Scoring
VehicleSignalStrength SignalStrength
Wind.VehicleWind Wind
UI.Flight.VehicleActionsInteraction ActionsInteraction
Boolean isDespawning
Boolean ShouldDrawForces
System.String NetworkScnCraftSpawnGuid
Boolean NetworkisEditing
UInt32 NetworkplayerOwnerId
Boolean isServer
Boolean isClient
Boolean isLocalPlayer
Boolean isServerOnly
Boolean isClientOnly
Boolean isOwned
Boolean hasAuthority
Boolean authority
UInt32 netId
Mirror.NetworkConnection connectionToServer
Mirror.NetworkConnectionToClient connectionToClient
Mirror.NetworkIdentity netIdentity
Byte ComponentIndex
Boolean useGUILayout
Boolean enabled
Boolean isActiveAndEnabled
UnityEngine.Transform transform
UnityEngine.GameObject gameObject
System.String tag
System.String name
UnityEngine.HideFlags hideFlags
```

### Module Methods

```
get_Scenario
get_scnBehaviourData
GetData
get_isMissionModule
get_isServer
get_isClient
get_isLocalPlayer
get_isServerOnly
get_isClientOnly
get_isOwned
get_hasAuthority
get_authority
get_netId
get_connectionToServer
get_connectionToClient
get_netIdentity
get_ComponentIndex
SetSyncVarDirtyBit
SetDirty
IsDirty
ClearAllDirtyBits
GeneratedSyncVarSetter
GeneratedSyncVarSetter_GameObject
GeneratedSyncVarSetter_NetworkIdentity
GeneratedSyncVarSetter_NetworkBehaviour
GeneratedSyncVarDeserialize
GeneratedSyncVarDeserialize_GameObject
GeneratedSyncVarDeserialize_NetworkIdentity
GeneratedSyncVarDeserialize_NetworkBehaviour
OnSerialize
OnDeserialize
SerializeObjectsAll
SerializeObjectsDelta
OnStartServer
OnStopServer
OnStartClient
OnStopClient
OnStartLocalPlayer
OnStopLocalPlayer
OnStartAuthority
OnStopAuthority
IsInvoking
CancelInvoke
Invoke
InvokeRepeating
CancelInvoke
IsInvoking
StartCoroutine
StartCoroutine_Auto
StopCoroutine
StopAllCoroutines
get_useGUILayout
set_useGUILayout
get_enabled
set_enabled
get_isActiveAndEnabled
get_transform
get_gameObject
GetComponent
GetComponent
TryGetComponent
GetComponent
GetComponentInChildren
GetComponentsInChildren
GetComponentInParent
GetComponentsInParent
GetComponents
get_tag
set_tag
GetComponents
CompareTag
SendMessageUpwards
SendMessage
BroadcastMessage
GetInstanceID
GetHashCode
Equals
get_name
set_name
get_hideFlags
set_hideFlags
ToString
GetType
Module Properties
Scenarios.Scenario Scenario
Scenarios.ScnBehaviourData scnBehaviourData
Boolean isMissionModule
Boolean isServer
Boolean isClient
Boolean isLocalPlayer
Boolean isServerOnly
Boolean isClientOnly
Boolean isOwned
Boolean hasAuthority
Boolean authority
UInt32 netId
Mirror.NetworkConnection connectionToServer
Mirror.NetworkConnectionToClient connectionToClient
Mirror.NetworkIdentity netIdentity
Byte ComponentIndex
Boolean useGUILayout
Boolean enabled
Boolean isActiveAndEnabled
UnityEngine.Transform transform
UnityEngine.GameObject gameObject
System.String tag
System.String name
UnityEngine.HideFlags hideFlags
```

## Other Resources

[Kithack Helper Repo by Auggie](https://github.com/AuggieTPG/Kithack_Helper)
