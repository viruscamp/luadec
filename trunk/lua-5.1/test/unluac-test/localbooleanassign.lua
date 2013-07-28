local armor = being.eq.armor
local boots = being.eq.boots
if not armor and not boots then
  being:msg( "You have no armor to fix! Nothing happens." )
  return
end
local damaged_armor = armor and armor:is_damaged() 
local damaged_boots = boots and boots:is_damaged()
if not damaged_armor and not damaged_boots then 
  being:msg( "You have no armor that needs fixing! Nothing happens." )
  return
end
ui.blink( YELLOW, 20 )
