extends StaticBody3D

@onready var shader : ShaderMaterial = $MeshInstance.mesh.material.next_pass

@export var targeted := false:
	get:
		return targeted
	set(val):
		targeted = val
		if targeted:
			# TODO: activate interact_shader
			shader.set_shader_parameter("strength", 0.2)
		else:
			#TODO: deactivate interact_shader
			shader.set_shader_parameter("strength", 0.0)
