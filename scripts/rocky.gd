extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Dino Duck":
		area.get_parent().velocity.y = 0
		area.get_parent().position.y = 392
		
		if self.name == "Rocky 1":
			self.position.x = 26.955
			self.get_parent().get_child(1).position.x = 26.955
			self.get_parent().get_child(2).position.x = 26.955
		elif self.name == "Rocky 2":
			self.get_parent().get_child(0).position.x = 26.955
			self.position.x = 26.955
			self.get_parent().get_child(3).position.x = 26.955
		else:
			self.get_parent().get_child(1).position.x = 26.955
			self.get_parent().get_child(2).position.x = 26.955
			self.position.x = 26.955
			
		self.get_parent().rockTween1.kill()
		self.get_parent().rockTween2.kill()
		self.get_parent().rockTween3.kill()
		
		$"../Dino Game Timer".stop()
		$"../Dino Game Timer".start()
