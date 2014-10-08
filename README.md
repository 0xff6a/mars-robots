Mars Robots: Technical Test
===========================

[![Code Climate](https://codeclimate.com/github/foxjerem/mars-robots/badges/gpa.svg)](https://codeclimate.com/github/foxjerem/mars-robots) [![Code Climate](https://codeclimate.com/github/foxjerem/mars-robots/badges/gpa.svg)](https://codeclimate.com/github/foxjerem/mars-robots)

Ruby Version
------------
Ruby 2.1.2

Objectives
----------

- Create a program that moves a set of robots sequentially over a grid on a distant planet

Workings
--------
- Assumed that single digit coordinates would be declared as 'xy', but if a single coordinate had double digits the other would be padded with a zero to remove ambiguity

Classes
--------
- Square: unit of the grid. Can be scented when a robot falls off world
- Grid: holds squares
- Instruction: a single movement instruction with a rotation and a distance
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

[NB: can substitute any file in the desired format]

Running the test suite
-----------------------

```shell
$ bundle
$ rspec
```