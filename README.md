TO DO

Add robot ignores instruction if scent present

Add mission control

 - run missions
 - generate output


Sample

53
11E
RFRFRFRF

Classes:
--------
- Square: unit of the grid. Can be scented when a robot falls off world
- Grid: holds squares
- Instruction: a single movement instruction with a rotation and a distance
- Mission: an array of instructions generated from a code string
- Position: a coordinate and a heading
- Robot: moves around the grid as instructed by a mission. Scents a square if it falls off world
- MissionControl: runs missions based on file input