class_name CreatureData
extends Resource

enum Type { MAGIC, SCIENCE, ESOTERICISM, COMMON }

const TYPE_NAMES = ["Magic", "Science", "Esotericism", "Common"]

const ADVANTAGES = {
	Type.MAGIC: Type.SCIENCE,
	Type.SCIENCE: Type.ESOTERICISM,
	Type.ESOTERICISM: Type.MAGIC,
}

@export var id: String = ""
@export var display_name: String = ""
@export var creature_type: Type = Type.COMMON
@export var portrait: Texture2D

func get_type_name() -> String:
	return TYPE_NAMES[creature_type]

func has_advantage_over(other: CreatureData) -> bool:
	return ADVANTAGES.get(creature_type, -1) == other.creature_type
