-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: -f 4 todo\ChannelsSimulator.luac 

DecompiledFunction_4 = function()
  local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
  if this.bGuideCheckBox then
    do return end
  end
  if this.dwID then
    local szTip = ""
    local x, y = this:GetAbsPos()
    local w, h = this:GetSize()
    local dwID = this.dwID
    local BigFoot_9c987de176f2b454baede402cee36bfa = (GetClientPlayer())
    local dwLevel = nil
    dwLevel = not BF_ChannelsSimulator.emulate or BigFoot_669fa01852f90cf7b764d63244920269[dwID] or 0
    do return end
    dwLevel = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(dwID)
    local dwShowLevel = dwLevel
    if dwShowLevel == 0 then
      dwShowLevel = 1
    end
    local skill = GetSkill(dwID, dwShowLevel)
    if this.bAlone then
      szTip = szTip .. "<text>text=" .. EncodeComponentsString(Table_GetSkillName(dwID, dwLevel)) .. " font=31 </text><text>text=" .. EncodeComponentsString(FormatString(g_tStrings.STR_SKILL_H_THE_WHAT_LEVEL, dwLevel .. "/" .. skill.dwMaxLevel)) .. " font=61 </text>"
      local szDesc = ""
      if dwLevel == 0 then
        szDesc = Table_GetSkillDesc(dwID, dwLevel)
      else
        local skillkey = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillRecipeKey(dwID, dwLevel)
        local skillInfo = GetSkillInfo(skillkey)
        szDesc = GetSkillDesc(dwID, dwLevel, skillkey, skillInfo)
      end
      if szDesc ~= "" then
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(szDesc .. "\n") .. " font=100 </text>"
      end
      dwLevel = 9999
      local szDesc = Table_GetSkillDesc(dwID, dwLevel)
      if szDesc ~= "" then
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(szDesc) .. " font=100 </text>"
      end
      OutputTip(szTip, 300, {x, y, w, h})
      return 
    end
    szTip = szTip .. "<text>text=" .. EncodeComponentsString(Table_GetSkillName(dwID, dwShowLevel)) .. " font=31 </text><text>text=" .. EncodeComponentsString(FormatString(g_tStrings.STR_SKILL_H_THE_WHAT_LEVEL, dwShowLevel .. "/" .. skill.dwMaxLevel)) .. " font=61 </text>"
    if dwLevel ~= 0 then
      local skillkey = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillRecipeKey(dwID, dwLevel)
      local skillInfo = GetSkillInfo(skillkey)
      local szDesc = GetSkillDesc(dwID, dwLevel, skillkey, skillInfo)
      if szDesc ~= "" then
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(g_tStrings.CURRENT_LEVEL) .. " font=106 </text>"
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(szDesc .. "\n") .. " font=100 </text>"
      end
      if dwLevel == skill.dwMaxLevel then
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(g_tStrings.STR_SKILL_H_TOP_LEAVEL) .. " font=106 </text>"
        OutputTip(szTip, 300, {x, y, w, h})
        return 
      end
      szTip = szTip .. "<text>text=" .. EncodeComponentsString(g_tStrings.STR_NEXT_LEVEL) .. " font=106 </text>"
    end
    dwLevel = dwLevel + 1
    local bLevel = false
    if VenationRequireLevel[dwID] then
      local nFont = 106
      if not BF_ChannelsSimulator.emulate and BigFoot_9c987de176f2b454baede402cee36bfa.nLevel < VenationRequireLevel[dwID] then
        nFont = 102
      else
        if BF_ChannelsSimulator.emulate and BF_ChannelsSimulator.Level < VenationRequireLevel[dwID] then
          nFont = 102
        end
      end
      szTip = szTip .. "<text>text=" .. EncodeComponentsString(g_tStrings.STR_LEARN_NEED_LEVEL1) .. " font=106</text>"
      szTip = szTip .. "<text>text=" .. EncodeComponentsString(VenationRequireLevel[dwID]) .. " font=" .. nFont .. "</text>"
      bLevel = true
    end
    if VenationCost[dwID] and VenationCost[dwID][dwLevel] then
      local nFont = 106
      local nCost = math.floor(BF_ChannelsSimulator.GetActualCostTrain(BigFoot_9c987de176f2b454baede402cee36bfa, VenationCost[dwID][dwLevel]))
      if BF_ChannelsSimulator.emulate and not BF_ChannelsSimulator.preview and BF_ChannelsSimulator.BigFoot_2cce3085b1cc1a5a7245e15eb15402e8 < nCost then
        nFont = 102
        do return end
        if BigFoot_9c987de176f2b454baede402cee36bfa.nCurrentTrainValue < nCost then
          nFont = 102
        end
      end
      if bLevel then
        szTip = szTip .. "<text>text=\"\\\t\" font=106 </text>"
      end
      szTip = szTip .. "<handle>handletype=3<text>text=" .. EncodeComponentsString(g_tStrings.STR_LEARN_COST_VENATION) .. " font=106</text>" .. "<text>text=" .. EncodeComponentsString(nCost) .. " font=" .. nFont .. "</text></handle>"
    end
    local fP = 100
    if VenationDifficult[dwID] and VenationDifficult[dwID][dwLevel] then
      local dwbase = 0
      if VenationType[dwID] == BASE_VENATION then
        dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nBaseVenationCof
      else
        if VenationType[dwID] == ASSIST_VENATION then
          dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nAssistVenationCof
        else
          if VenationType[dwID] == PHYSICS_VENATION then
            dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nPhysicsVenationCof
          else
            if VenationType[dwID] == MAGIC_VENATION then
              dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nMagicVenationCof
            end
          end
        end
      end
      fP = 100 * (dwbase + VenationDifficult[dwID][dwLevel]) / 1024
      if fP > 100 then
        fP = 100
      end
    end
    fP = fP + 0.5
    fP = fP - (fP) % 1
    local szReturn = ""
    if VenationCost[dwID] and VenationCost[dwID][dwLevel] then
      local nReturn = math.floor(GetRestoreTrain(BigFoot_9c987de176f2b454baede402cee36bfa, BF_ChannelsSimulator.GetActualCostTrain(BigFoot_9c987de176f2b454baede402cee36bfa, VenationCost[dwID][dwLevel])))
      if nReturn ~= 0 and fP ~= 100 then
        szReturn = "<text>text=" .. EncodeComponentsString(FormatString("\t" .. g_tStrings.STR_LEARN_RETURN_VENATION, nReturn)) .. " font=106 </text>"
        bLevel = false
      end
    end
    szTip = szTip .. "<text>text=" .. EncodeComponentsString(FormatString(g_tStrings.STR_LEARN_SUCCESS_PERCENTAGE, fP)) .. " font=106 </text>" .. szReturn
    if VenationRequirement[dwID] and #VenationRequirement[dwID] ~= 0 then
      local v = VenationRequirement[dwID]
      local szMsg = g_tStrings.STR_NEED_GET_THROUGH
      if bLevel then
        szMsg = "\n" .. szMsg
      end
      szTip = szTip .. "<text>text=" .. EncodeComponentsString(szMsg) .. " font=106 </text>"
      for i,vSkill in ipairs(v) do
        if i ~= 1 then
          szTip = szTip .. "<text>text=" .. EncodeComponentsString(g_tStrings.STR_COMMA) .. " font=106 </text>"
        end
        local nFont = 106
         -- DECOMPILER ERROR: unhandled construct in 'if'

        if BF_ChannelsSimulator.emulate and (not BigFoot_669fa01852f90cf7b764d63244920269[vSkill.ID] or BigFoot_669fa01852f90cf7b764d63244920269[vSkill.ID] < vSkill.Level) then
          nFont = 102
          do return end
          if BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(vSkill.ID) < vSkill.Level then
            nFont = 102
          end
        end
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(FormatString(g_tStrings.STR_LEARN_SKILL_LEVEL, Table_GetSkillName(vSkill.ID, vSkill.Level), vSkill.Level)) .. " font=" .. nFont .. " </text>"
      end
      if #v > 1 then
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(FormatString(STR_ONE_OF)) .. " font=106 </text>"
      end
      bLevel = true
    end
    local skillkey = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillRecipeKey(dwID, dwLevel)
    local skillInfo = GetSkillInfo(skillkey)
    local szDesc = GetSkillDesc(dwID, dwLevel, skillkey, skillInfo)
    if szDesc ~= "" then
      if bLevel then
        szTip = szTip .. "<text>text=" .. EncodeComponentsString("\n" .. szDesc) .. " font=100 </text>"
      else
        szTip = szTip .. "<text>text=" .. EncodeComponentsString(szDesc) .. " font=100 </text>"
      end
    end
    OutputTip(szTip, 300, {x, y, w, h})
  end
end
