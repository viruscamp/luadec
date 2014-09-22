-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: -f 10 todo\ChannelsSimulator.luac 

DecompiledFunction_10 = function(l_10_0)
  local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
  local BigFoot_4082b0e24d90b4bdf8a90c76450bab93 = false
  local bHave = false
  local page = l_10_0:GetFirstChild()
  repeat
    if page then
      local pageN = page:GetNext()
      if page.bCommonPage then
        if page.szName == l_10_0.szName then
          page:Show()
          BigFoot_4082b0e24d90b4bdf8a90c76450bab93 = page
        else
          page:Destroy()
        end
      end
      page = pageN
    elseif not BigFoot_4082b0e24d90b4bdf8a90c76450bab93 then
      if not l_10_0.szName then
        l_10_0.szName = "Introduction"
      end
      local BigFoot_c2f245debd3efc045524792c222180d3 = Wnd.OpenWindow("ChannelsPanel_" .. l_10_0.szName)
      BigFoot_4082b0e24d90b4bdf8a90c76450bab93 = BigFoot_c2f245debd3efc045524792c222180d3:Lookup("Wnd_" .. l_10_0.szName)
      BigFoot_4082b0e24d90b4bdf8a90c76450bab93.szName = l_10_0.szName
      BigFoot_4082b0e24d90b4bdf8a90c76450bab93.bCommonPage = true
      BigFoot_4082b0e24d90b4bdf8a90c76450bab93:ChangeRelation(l_10_0, true, true)
      l_10_0:Lookup("Scene_SFX"):BringToTop()
      l_10_0:Lookup("Btn_Close"):BringToTop()
      l_10_0:Lookup("CheckBox_ShowAll"):BringToTop()
      Wnd.CloseWindow("ChannelsPanel_" .. l_10_0.szName)
    end
    local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
    local handle = BigFoot_4082b0e24d90b4bdf8a90c76450bab93:Lookup("", "")
    local hName = handle:Lookup("Handle_Name")
    if hName then
      hName:Show(ChannelsPanel.bShowName)
    end
    do
      if not ChannelsPanel[BigFoot_4082b0e24d90b4bdf8a90c76450bab93.szName] then
        local aBtn = {}
      end
      for k,v in pairs(aBtn) do
        local btn = BigFoot_4082b0e24d90b4bdf8a90c76450bab93:Lookup("Btn_" .. k)
        local text = handle:Lookup("Text_" .. k)
        local img = handle:Lookup("Image_" .. k)
        btn.dwID = v
        local nLevel = nil
        nLevel = not BF_ChannelsSimulator.emulate or BigFoot_669fa01852f90cf7b764d63244920269[btn.dwID] or 0
        do return end
        nLevel = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(btn.dwID)
        if BF_ChannelsSimulator.emulate then
          btn.bCanOpen, btn.nError = BF_ChannelsSimulator.CanOpenVenation(BF_ChannelsSimulator.Level, btn.dwID), BF_ChannelsSimulator.Level
        else
          btn.bCanOpen, btn.nError = CanOpenVenation(BigFoot_9c987de176f2b454baede402cee36bfa, btn.dwID), BigFoot_9c987de176f2b454baede402cee36bfa
        end
        btn.bMax = false
        if nLevel >= 1 or btn.bCanOpen then
          btn:Enable(true)
          if text then
            text:Show()
            text:SetText(nLevel)
          end
          if nLevel == 0 then
            if text then
              text:SetFontScheme(186)
            end
            if img then
              img:Hide()
            else
              local skill = GetSkill(btn.dwID, nLevel)
              if nLevel == skill.dwMaxLevel then
                btn.bMax = true
                if text then
                  text:SetFontScheme(185)
                elseif text then
                  text:SetFontScheme(186)
                end
              end
              if img then
                img:Show()
              else
                btn:Enable(false)
                if text then
                  text:Hide()
                end
                if img then
                  img:Hide()
                end
              end
            end
          end
        end
      end
    end
     -- WARNING: missing end command somewhere! Added here
  end
end
