-- Decompiled using luadec 2.1 UNICODE by sztupy (http://winmo.sztupy.hu) and viruscamp 
-- Command line was: popup_hint.luac 

PopUpHint = {is_init = false, 
popups = {}, DEF_FONT_1 = g_all_b52_normal_fnt, DEF_FONT_2 = g_all_b52_normal_fnt, DEF_TEXT_2_OFFCET = 30, DEF_TIME_OUT = 500, 
show_popup_event_id = {}, show_popup_timeout = 0, DEF_1_ALIGN = "left", DEF_1_ALIGN_V = "top", DEF_2_ALIGN = "left", DEF_2_ALIGN_V = "top", TOP_OFFSET = 100, 
DEFAULT_TEXT_OFFSET = {25, 25}, 
DEFAULT_VERT_FLIPPED_OFFSET = {25, 60}, DEFAULT_TEXT_WIDTH = 330, DEFAULT_TEXT_HEIGHT = 175, DEFAULT_BUBBLE_OFFSET = 315, DEFAULT_HOR_FLIPPED_BUBBLE_OFFSET = 65, SCREEN_HALF_WIDTH = 512}
local EqValOrDef = function(val, def)
  if val == nil then
    return def
  end
  return val
end

PopUpHint.Init = function(time_out, font1, font2)
  PopUpHint.is_init = true
  PopUpHint.show_popup_event_id = {}
  if time_out == nil then
    PopUpHint.show_popup_timeout = PopUpHint.DEF_TIME_OUT
  else
    PopUpHint.show_popup_timeout = time_out
  end
  if font1 then
    PopUpHint.DEF_FONT_1 = font1
  end
  if font1 then
    PopUpHint.DEF_FONT_2 = font2
  end
end

PopUpHint.Controls = {id = "hint_ex_location", kind = "hint_ex", 
rect = {0, 0, 1, 1}, back_sprite = "", on_show_snd = "all_pnl_open_snd", on_hide_snd = "all_pnl_open_snd", on_shaiking_snd = "all_pnl_focus6_snd", 
on_show_event = {"POPUP_HINT_SHOW"}, 
on_hide_event = {"POPUP_HINT_CLOSE", ""}, 
controls = {
{id = "img_popup_hint_panel", kind = "image", 
rect = {0, 0, 180, 120}, sprite = "all_buble_spr", 
controls = {
{id = "lbl_popup_hint_task", kind = "label", 
rect = {0, 70, 300, 40}, font = PopUpHint.DEF_FONT_1, text = ""}, 
{id = "lbl_popup_hint_task_2", kind = "label", 
rect = {0, 30, 300, 40}, font = PopUpHint.DEF_FONT_2, text = ""}}}}}
PopUpHint.OnAnyControlOver = function(control_id, is_over)
  assert(PopUpHint.is_init == true, "PopUpHint system was not initialized. Please, use PopUpHint.Init() in screen fade in.")
   -- DECOMPILER ERROR: unhandled construct in 'if'

  if is_over and (PopUpHint.show_popup_event_id[control_id] ~= 0 or PopUpHint.show_popup_event_id[control_id] ~= nil) then
    PopUpHint.show_popup_event_id[control_id] = hge.schedule(PopUpHint.show_popup_timeout, "PopUpHint_ShowHint", control_id, is_over)
  end
  do return end
  if PopUpHint.show_popup_event_id[control_id] == 0 and PopUpHint.show_popup_event_id[control_id] == nil then
    hge.cancel(PopUpHint.show_popup_event_id[control_id])
    PopUpHint.show_popup_event_id[control_id] = 0
  else
    PopUpHint_ShowHint(control_id, is_over)
  end
end

PopUpHint_ShowHint = function(id, is_over)
  -- upvalues: EqValOrDef
  PopUpHint.show_popup_event_id[id] = 0
  if is_over == true then
    local popup_data = PopUpHint.popups[id]
    assert(popup_data ~= nil, "incorrect popup data")
    if popup_data.beforeShowCallback ~= nil then
      popup_data.beforeShowCallback(id)
    end
    local x, y, w, h = hge.control_get_rect(id)
    local is_custom_sprite_used = true
    local sprite = popup_data.popup_sprite
    if sprite == nil then
      sprite = "all_buble_spr"
      is_custom_sprite_used = false
    end
    local scale = {1, 1}
    local _, _, _w, _h = hge.sprite_get_rect(sprite)
    if popup_data.hint_rect == nil then
      popup_data.hint_rect = {x, y, _w, _h}
    else
      scale[1] = popup_data.hint_rect[3] / _w
      scale[2] = popup_data.hint_rect[4] / _h
    end
    local location = {x = popup_data.hint_rect[1], y = popup_data.hint_rect[2], w = popup_data.hint_rect[3], h = popup_data.hint_rect[4]}
    local location_text = {x = popup_data.hint_rect[1], y = popup_data.hint_rect[2], w = PopUpHint.DEFAULT_TEXT_WIDTH * scale[1], h = PopUpHint.DEFAULT_TEXT_HEIGHT * scale[2]}
    local location_text2 = {x = popup_data.hint_rect[1], y = popup_data.hint_rect[2], w = PopUpHint.DEFAULT_TEXT_WIDTH * scale[1], h = PopUpHint.DEFAULT_TEXT_HEIGHT * scale[2]}
    local is_bubble_flipped_vert = y < location.h + PopUpHint.TOP_OFFSET
    local B_POS = {LEFT = 1, RIGHT = 2}
    local bubble_pos = 0
    if is_custom_sprite_used then
      if sprite == "all_buble_flip_vert_hor_spr" or sprite == "all_buble_flip_vert_spr" or sprite == "all_buble_flip_spr" then
        location_text.x = location.x + PopUpHint.DEFAULT_VERT_FLIPPED_OFFSET[1] * scale[1]
        location_text.y = location.y + PopUpHint.DEFAULT_VERT_FLIPPED_OFFSET[2] * scale[2]
      elseif sprite == "all_buble_spr" then
        location_text.x = location.x + PopUpHint.DEFAULT_TEXT_OFFSET[1] * scale[1]
        location_text.y = location.y + PopUpHint.DEFAULT_TEXT_OFFSET[2] * scale[2]
      elseif sprite == "all_buble_flip_hor_spr" then
        location_text.x = location.x + PopUpHint.DEFAULT_TEXT_OFFSET[1] * scale[1]
        location_text.y = location.y + PopUpHint.DEFAULT_TEXT_OFFSET[2] * scale[2]
      end
    else
      if x <= PopUpHint.SCREEN_HALF_WIDTH then
        bubble_pos = B_POS.LEFT
      else
        bubble_pos = B_POS.RIGHT
      end
      if is_bubble_flipped_vert == false then
        location.y = y - location.h
        if bubble_pos == B_POS.LEFT then
          sprite = "all_buble_flip_hor_spr"
          location.x = x + math.floor(w / 2) - PopUpHint.DEFAULT_HOR_FLIPPED_BUBBLE_OFFSET * scale[1]
        else
          sprite = "all_buble_spr"
          location.x = x + math.floor(w / 2) - PopUpHint.DEFAULT_BUBBLE_OFFSET * scale[1]
        end
        location_text.x = location.x + PopUpHint.DEFAULT_TEXT_OFFSET[1] * scale[1]
        location_text.y = location.y + PopUpHint.DEFAULT_TEXT_OFFSET[2] * scale[2]
      end
    else
      sprite = "all_buble_flip_spr"
      location.y = y + h
      if bubble_pos == B_POS.LEFT then
        sprite = "all_buble_flip_vert_hor_spr"
        location.x = x + math.floor(w / 2) - PopUpHint.DEFAULT_HOR_FLIPPED_BUBBLE_OFFSET * scale[1]
      else
        sprite = "all_buble_flip_vert_spr"
        location.x = x + math.floor(w / 2) - PopUpHint.DEFAULT_BUBBLE_OFFSET * scale[1]
      end
      location_text.x = location.x + PopUpHint.DEFAULT_VERT_FLIPPED_OFFSET[1] * scale[1]
      location_text.y = location.y + PopUpHint.DEFAULT_VERT_FLIPPED_OFFSET[2] * scale[2]
    end
    location_text2.x = location_text.x
    location_text2.y = location_text.y
    location_text2.y = location_text.y + 30
    if popup_data.text1_offset ~= nil then
      location_text.x = location_text.x + popup_data.text1_offset[1]
      location_text.y = location_text.y + popup_data.text1_offset[2]
      location_text.w = popup_data.text1_offset[3]
      location_text.h = popup_data.text1_offset[4]
    end
    if popup_data.text2_offset ~= nil then
      location_text2.x = location_text2.x + popup_data.text2_offset[1]
      location_text2.y = location_text2.y + popup_data.text2_offset[2]
      location_text2.w = popup_data.text2_offset[3]
      location_text2.h = popup_data.text2_offset[4]
    end
    local popup_2_text = EqValOrDef(popup_data.text2, "")
    local lbl_1_font = EqValOrDef(popup_data.font1, PopUpHint.DEF_FONT_1)
    local lbl_2_font = EqValOrDef(popup_data.font2, PopUpHint.DEF_FONT_2)
    local lbl_1_align = EqValOrDef(popup_data.text1_h, PopUpHint.DEF_1_ALIGN) .. " " .. EqValOrDef(popup_data.text1_v, PopUpHint.DEF_1_ALIGN_V)
    local lbl_2_align = EqValOrDef(popup_data.text2_h, PopUpHint.DEF_2_ALIGN) .. " " .. EqValOrDef(popup_data.text2_v, PopUpHint.DEF_2_ALIGN_V)
    hge.control_set_rect("img_popup_hint_panel", location.x, location.y, location.w, location.h)
    hge.control_set_rect("lbl_popup_hint_task", location_text.x, location_text.y, location_text.w, location_text.h)
    hge.control_set_rect("lbl_popup_hint_task_2", location_text2.x, location_text2.y, location_text2.w, location_text2.h)
    hge.image_set_sprite("img_popup_hint_panel", sprite)
    hge.label_set_string("lbl_popup_hint_task", popup_data.text1)
    hge.label_set_string("lbl_popup_hint_task_2", popup_2_text)
    hge.label_set_font("lbl_popup_hint_task", lbl_1_font)
    hge.label_set_font("lbl_popup_hint_task_2", lbl_2_font)
    hge.label_set_align("lbl_popup_hint_task", lbl_1_align)
    hge.label_set_align("lbl_popup_hint_task_2", lbl_2_align)
    hge.fire_event("POPUP_HINT_SHOW", "")
  else
    hge.fire_event("POPUP_HINT_CLOSE", "")
  end
end

PopUpHint.CreatePopUpHintControl = function(id, rect, text1, text2, font1, font2, text1_h, text1_v, text2_h, text2_v, beforeShowCallback, hint_rect, popup_sprite, hit_spr, text1_offset, text2_offset)
  assert(id ~= nil, "incorrect id")
  assert(text1 ~= nil, "Try to create empty popup hint")
  if hint_rect == nil then
    local popup_data = {text1 = text1, font1 = font1, text2 = text2, font2 = font2, beforeShowCallback = beforeShowCallback, hint_rect = hint_rect, popup_sprite = popup_sprite, hit_spr = hit_spr, text1_offset = text1_offset, text2_offset = text2_offset}
    PopUpHint.popups[id] = popup_data
    PopUpHint.SetPopUpTextAlign(id, text1_h, text1_v, text2_h, text2_v)
    do
      local hintButton = {id = id, kind = "button", rect = rect, 
sprites = {up = "", over = "", down = "", disable = "", hit = popup_data.hit_spr}, text = "", font = g_all_b52_normal_fnt, on_mouse_l_button = "", on_mouse_over = PopUpHint.OnAnyControlOver, on_mouse_over_snd = ""}
      return hintButton
    end
     -- WARNING: missing end command somewhere! Added here
  end
end

PopUpHint.SetPopUpHintText = function(id, text1, text2, font1, font2)
  assert(id ~= nil, "incorrect id")
  assert(text1 ~= nil, "Try to create empty popup hint")
  if PopUpHint.popups[id] == nil then
    PopUpHint.popups[id] = {}
  end
  local popup_data = PopUpHint.popups[id]
  popup_data.text1 = text1
  popup_data.font1 = font1
  popup_data.text2 = text2
  popup_data.font2 = font2
end

PopUpHint.SetPopUpHintTextOffset = function(id, text1_offset, text2_offset)
  assert(id ~= nil, "Nill value occured while trying to set popup hint text offset")
  local popup_data = PopUpHint.popups[id]
  popup_data.text1_offset = text1_offset
  popup_data.text2_offset = text2_offset
end

PopUpHint.SetPopUpTextAlign = function(id, text1_h, text1_v, text2_h, text2_v)
  assert(id ~= nil, "incorrect id")
  assert(PopUpHint.popups[id] ~= nil, "incorrect popup id")
  local popup_data = PopUpHint.popups[id]
  popup_data.text1_h = text1_h
  popup_data.text1_v = text1_v
  popup_data.text2_h = text2_h
  popup_data.text2_v = text2_v
end

PopUpHint.SetPopUpHintText1 = function(id, text1)
  assert(id ~= nil, "incorrect id")
  assert(text1 ~= nil, "Try to create empty popup hint")
  if PopUpHint.popups[id] == nil then
    PopUpHint.popups[id] = {}
  end
  local popup_data = PopUpHint.popups[id]
  popup_data.text1 = text1
end

PopUpHint.SetPopUpHintText2 = function(id, text2)
  assert(id ~= nil, "incorrect id")
  assert(text2 ~= nil, "Try to create empty popup hint")
  if PopUpHint.popups[id] == nil then
    PopUpHint.popups[id] = {}
  end
  local popup_data = PopUpHint.popups[id]
  popup_data.text2 = text2
end


