TO DO

Add mission control
 - create robots
 - creates grid
 - has a grid
 - pass grid to robots
 - run missions

Classes:
--------
- Square: unit of the grid. Can be scented when a robot falls off world
- Grid: holds squares
- Instruction: a single movement instruction with a rotation and a distance
- Mission: an array of instructions generated from a code string
- Position: a coordinate and a heading
- Robot: moves around the grid as instructed by a mission. Scents a square if it falls off world