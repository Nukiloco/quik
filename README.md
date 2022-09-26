![logo](./assets/logo.png)

# QUIK
The quick utility addon for Godot!

## Install and enable
To install and enable Quik, download the addon on the asset lib.
Then go to Project > Plugins > Quik and press "Enable"

Quik will automatically add in a singleton ``q`` to the project.

## Using
Quik stores all utilities in one global letter called ``q``.

Here is all the utilities you can use!

## Examples
### Log to the screen
```
# This will print to the screen "test: hello world".
q.d.l('test', 'hello world!')

# We can update that text any time to something like this.
q.d.l('test', 'we updated the text on the screen!')
```

### Track node variable and log to the screen
```
# This will constantly update the info on the screen of the player's position as it keeps track of the node information every frame.
# We are passing in the node (player) and the variable name on the node (position).
var player: KinematicBody2D = get_node('Player')
q.d.lt(player, 'position')
```

### Visually log position
```
# This will display a square on the screen where the position is at.
q.v.lp('test', Vector2(100, 100), 5, true)
```

### Visually track node position
```
# This will constantly display a square on the screen of the player's global position as it keeps track of the node information every frame.
# We are passing in the node (player) and we give it a custom name to display on the screen. The name is required here currently for it to function properly.
var player: KinematicBody2D = get_node('Player')
q.v.lpt(player, 'player is here!', 5, true)
```