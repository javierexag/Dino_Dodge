extends Node2D

var meteoritos_prefab = preload("res://meteorito.tscn")
# Called when the node enters the scene tree for the first time.
var spawn_interval = 2.0 # Intervalo de generación en segundos
var spawn_timer = 0.0



func _ready():
	# Iniciar el temporizador de generación
	spawn_timer = spawn_interval

	

func _process(delta):
	# Reducir el temporizador
	spawn_timer -= delta
	# Si el temporizador llega a cero, generar un meteorito y reiniciar el temporizador
	if spawn_timer <= 0:
		spawn_meteorito()
		spawn_timer = spawn_interval
		if(spawn_interval > 0.5) : 
			spawn_interval = spawn_interval - 0.1

func obtenerObjetoAleatorio(miArray):
	if miArray.size() == 0:
		return null  # Devolver null si el array está vacío
	var indiceAleatorio = randi() % miArray.size()  # Generar un índice aleatorio
	return miArray[indiceAleatorio]  # Devolver el elemento aleatorio

func spawn_meteorito():
	# Instanciar un meteorito
	var meteorito = meteoritos_prefab.instantiate()
	var spawners = [get_node("SP1"),get_node("SP2"),get_node("SP3"),get_node("SP4"),get_node("SP5"),get_node("SP6"),get_node("SP7"),get_node("SP8")]
	# Colocar el meteorito en una posición aleatoria dentro del área del spawner
	#meteorito.position = Vector2(randf() * get_viewport_rect().size.x, randf() * get_viewport_rect().size.y)
	print(spawners.size())
	meteorito.position=obtenerObjetoAleatorio(spawners).position
	#meteorito.position = pos.position
	# Agregar el meteorito como un nodo hijo del spawner
	add_child(meteorito)
