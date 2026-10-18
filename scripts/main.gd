extends Control

# TEMPORAIRE : On charge toutes les créatures existantes pour swap facilement entre elles
# (jeu final : assignation de la créature unique en tête d'équipe via menu)
const CREATURES: Array[CreatureData] = [
	preload("res://data/creatures/pigasus.tres"),
	preload("res://data/creatures/lifebulb.tres"),
	preload("res://data/creatures/bitmin.tres"),
	preload("res://data/creatures/pigeon.tres"),
]
var companion_index := 0

@onready var companion_label: Label = $margin/column/companion_lbl
@onready var companion_image: TextureRect = $margin/column/companion

var steps := 0
var watts := 0

@onready var step_label: Label = $margin/column/step_lbl
@onready var watts_label: Label = $margin/column/watts_lbl
@onready var step_btn: Button = $margin/column/addStep_btn

func _ready() -> void:
	step_btn.pressed.connect(_add_step)
	_print_cmpt()
	$margin/column/change_companion_btn.pressed.connect(_change_companion)
	_show_companion()

func _add_step() -> void:
	steps += 20
	watts += 1
	_print_cmpt()

func _print_cmpt() -> void:
	step_label.text = "Step : %d" % steps
	watts_label.text = "Watts : %d" % watts

func _change_companion() -> void:
	companion_index = (companion_index + 1) % CREATURES.size()
	_show_companion()

func _show_companion() -> void:
	var creature: CreatureData = CREATURES[companion_index]
	companion_label.text = "%s\nType: %s" % [creature.display_name,creature.get_type_name(),]

	if creature.portrait != null:
		companion_image.texture = creature.portrait
	else:
		companion_image.texture = preload("res://icon.svg")
