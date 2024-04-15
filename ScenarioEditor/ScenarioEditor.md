# Scenario Editor

## Table of Contents

[Overview]()

[Specifics]()

[How do I do...?]()
* [Create an NPC and have it follow a path]()

[Scenario Ideas]()

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

## How do I do...?

### Create an NPC and have it follow a path

TODO...
