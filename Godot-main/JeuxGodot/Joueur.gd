extends CharacterBody2D






















const VITESSE = 500
const SAUT = -500
const GRAVITE = 20
const DECELERATION = 20



func _physics_process(_delta):
	
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = SAUT
	else:
		velocity.y += GRAVITE
	
	var direction = 0
	direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if direction == 0:
		velocity.x = move_toward(velocity.x,0,DECELERATION)
	else:
		velocity.x = VITESSE * direction
	
	
	#COTE ANIMATIONS
	var _animated_sprite = $AnimatedSprite2D
	
	#CHECK LE SENS DU PERSO
	if direction == -1:
		_animated_sprite.set_flip_h(true)
	elif direction == 1:
		_animated_sprite.set_flip_h(false)
		
	#DIFFERENTES ANIMATIONS DES ACTIONS	
	if Input.is_action_just_pressed("ui_up"):
		_animated_sprite.play("jumping")
	elif is_on_floor():
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			_animated_sprite.play("running")
		else:
			_animated_sprite.play("standing")	
	move_and_slide()
	
	
