extends Resource
class_name Item

## Displayed upon generic look or inventory
@export var item_name: String = "A new item"

## Displayed upon look at this item
@export_multiline var item_description = "A brand new item"

## Weight of the item
@export var item_weight: int = 0

## Can player pickup an item.
@export var pickable: bool = true
