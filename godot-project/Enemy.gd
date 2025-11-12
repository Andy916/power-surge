extends Area2D
var x = 3
func _on_Enemy_body_entered(body):
	body.reset()
func _process(_delta):
	rotation_degrees += 15
