Mars Robots: Technical Test
===========================

[![Code Climate](https://codeclimate.com/github/foxjerem/mars-robots/badges/gpa.svg)](https://codeclimate.com/github/foxjerem/mars-robots) [![Test Coverage](https://codeclimate.com/github/foxjerem/mars-robots/badges/coverage.svg)](https://codeclimate.com/github/foxjerem/mars-robots)

Ruby Version
------------
Ruby 2.1.2

Objectives
----------

Create a programme that moves a set of robots sequentially over a grid on a distant planet

Workings
--------
- Designed code for maximum flexibility and extensibility: new instructions can easily be added and can be processed by the original logic
- Implemented squares/mission as separate classes rather than as boolean/array to ensure extensibility and strictly respect SRP
- Added validation for maximum coordinate and instruction code length
- Assumed that single digit coordinates would be declared as 'xy', but if a single coordinate had double digits the other would be padded with a zero to remove ambiguity

Classes
--------
- Square: unit of the grid. Contains a 'scent' if a robot falls off world
- Grid: holds squares
- Instruction: a single movement instruction comprising a rotation and a distance
- Mission: an array of instructions generated from a code string
- Position: a coordinate and a heading
- Robot: moves around the grid as instructed by a mission. Scents a square if it falls off world
- MissionControl: runs missions based on file input

Running the application
------------------------

```shell
$ bundle
$ ruby run.rb data.txt
```

[NB: can substitute data.txt for any file containing instructions in correct format]

Running the test suite
-----------------------

```shell
$ bundle
$ rspec
```

Sample Input
------------
```shell
53
11E
RFRFRFRF

32N
FRRFLLFFRRFLL

03W
LLFFFLFLFL
```

Output
------
```shell
11E
33NLOST
23S
```
