-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: test\todo\ChannelsSimulator.luac 

BF_ChannelsSimulator = {BigFoot_d39b200492710b5b89785b03a21e33e7 = 70, 
BigFoot_5f64b171232f3a1579d5f9f0bb50931f = {}, BigFoot_8ffd04905f1039a2342d8ee2cde5774b = 0, BigFoot_2cce3085b1cc1a5a7245e15eb15402e8 = 0, BigFoot_5228dfc835e0069055b51034e8f04cf3 = 0, 
BigFoot_ad0a832947633a236421070639d974f8 = {}}
local BigFoot_82c1f7ff9fe375991bbc112c6d247f17 = {
[9] = {60, 62, 63, 64, 67, 65, 68, 66, 69, 70, 71, 73, 75}, 
[1206] = {60, 62, 63, 64, 67, 65, 68, 66, 69, 70, 72, 74, 76}, 
[40] = {60, 77, 78, 1196, 84, 86, 88, 87, 89, 90}, 
[43] = {91, 94, 98, 111, 114, 117}, 
[42] = {91, 93, 97, 96, 110, 113, 116}, 
[41] = {91, 92, 95, 99, 112, 115}, 
[45] = {118, 126, 120, 128, 153, 155}, 
[44] = {118, 127, 121, 122, 123, 124, 119, 129, 154}, 
[170] = {156, 163, 158, 165, 167, 169}, 
[46] = {156, 164, 159, 160, 161, 162, 157, 166, 168}}
local print = function(BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88)
  local szFont = GetMsgFontString("MSG_SYS")
  OutputMessage("MSG_SYS", FormatString("<text>text=\"<经脉加点模拟器> \" font=10 r=0 g=196 b=196</text><text>text=\"<D0> \"</text><D1><text>text=\"\n\" font=<D1></text>", BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88, szFont), true)
end

BF_ChannelsSimulator.GetActualCostTrain = function(BigFoot_9c987de176f2b454baede402cee36bfa, BigFoot_c8854a838d9d08f9224f1e74e9927e51)
  if BF_ChannelsSimulator.emulate then
    local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
    local BigFoot_f3c54c9070e9d9b5d2edc1a3da85f7e1, BigFoot_91152949e45b6a5d8be1d756bfea1c3f = nil, nil
    BigFoot_f3c54c9070e9d9b5d2edc1a3da85f7e1 = BigFoot_669fa01852f90cf7b764d63244920269[73] and BigFoot_669fa01852f90cf7b764d63244920269[73] or 0
    BigFoot_91152949e45b6a5d8be1d756bfea1c3f = BigFoot_669fa01852f90cf7b764d63244920269[9] and BigFoot_669fa01852f90cf7b764d63244920269[9] or 0
    BigFoot_c8854a838d9d08f9224f1e74e9927e51 = BigFoot_c8854a838d9d08f9224f1e74e9927e51 * (1 - (BigFoot_f3c54c9070e9d9b5d2edc1a3da85f7e1) * 0.01 - (BigFoot_91152949e45b6a5d8be1d756bfea1c3f) * 0.01)
    return BigFoot_c8854a838d9d08f9224f1e74e9927e51
  else
    return GetActualCostTrain(BigFoot_9c987de176f2b454baede402cee36bfa, BigFoot_c8854a838d9d08f9224f1e74e9927e51)
  end
end

BF_ChannelsSimulator.OnLButtonClick = function()
  -- upvalues: BigFoot_82c1f7ff9fe375991bbc112c6d247f17
  local szName = this:GetName()
  if szName == "Btn_Close" then
    CloseChannelsPanel()
  elseif szName == "Btn_Back" then
    local BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = this:GetRoot()
    do
      BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName = nil
      ChannelsPanel.UpdateCommonPage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
    end
  else
    if this.dwID and not this.bMax then
      if this.bCanOpen then
        local dwID = this.dwID
        local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
        if not BF_ChannelsSimulator.emulate then
          local dwLevel = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(dwID) + 1
          local skill = GetSkill(dwID, dwLevel)
          local szDesc = g_tStrings.STR_TWO_CHINESE_SPACE .. Table_GetSkillName(dwID, dwLevel) .. FormatString(g_tStrings.STR_SKILL_H_THE_WHAT_LEVEL1, dwLevel)
          if VenationCost[dwID] and VenationCost[dwID][dwLevel] then
            local nCost = BF_ChannelsSimulator.GetActualCostTrain(BigFoot_9c987de176f2b454baede402cee36bfa, VenationCost[dwID][dwLevel])
            nCost = math.floor(nCost)
            szDesc = szDesc .. g_tStrings.STR_COMMA .. g_tStrings.STR_LEARN_COST_VENATION .. nCost .. g_tStrings.STR_COMMA
          end
          local fP = 100
          if VenationDifficult[dwID] and VenationDifficult[dwID][dwLevel] then
            local dwbase = 0
            if VenationType[dwID] == BASE_VENATION then
              dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nBaseVenationCof
            else
              if VenationType[dwID] == ASSIST_VENATION then
                dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nAssistVenationCof
              end
            else
              if VenationType[dwID] == PHYSICS_VENATION then
                dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nPhysicsVenationCof
              end
            else
              if VenationType[dwID] == MAGIC_VENATION then
                dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nMagicVenationCof
              end
            end
            fP = 100 * (dwbase + VenationDifficult[dwID][dwLevel]) / 1024
          end
          if fP > 100 then
            fP = 100
          end
          fP = fP + 0.5
          fP = fP - (fP) % 1
          szDesc = szDesc .. FormatString(g_tStrings.STR_LEARN_SUCCESS_PERCENTAGE, fP)
          szDesc = szDesc .. "\n" .. g_tStrings.MSG_VENATION_GET_SURE
          local BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88 = {
{szOption = g_tStrings.STR_HOTKEY_SURE, fnAction = function()
            -- upvalues: dwID
            GetClientPlayer().OpenVenation(dwID)
          end}, 
{szOption = g_tStrings.STR_HOTKEY_CANCEL}; szMessage = szDesc, szName = "OpenVenationSure", fnAutoClose = function()
            return not IsChannelsPanelOpened()
          end}
          MessageBox(BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88)
        else
          local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
          if not BigFoot_669fa01852f90cf7b764d63244920269[dwID] then
            BigFoot_669fa01852f90cf7b764d63244920269[dwID] = 1
          else
            BigFoot_669fa01852f90cf7b764d63244920269[dwID] = BigFoot_669fa01852f90cf7b764d63244920269[dwID] + 1
          end
          local BigFoot_c8854a838d9d08f9224f1e74e9927e51 = math.floor(BF_ChannelsSimulator.GetActualCostTrain(BigFoot_9c987de176f2b454baede402cee36bfa, VenationCost[dwID][BigFoot_669fa01852f90cf7b764d63244920269[dwID]]))
          if not BF_ChannelsSimulator.preview then
            table.insert(BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8, dwID)
            BF_ChannelsSimulator.BigFoot_2cce3085b1cc1a5a7245e15eb15402e8 = BF_ChannelsSimulator.BigFoot_2cce3085b1cc1a5a7245e15eb15402e8 - BigFoot_c8854a838d9d08f9224f1e74e9927e51
          end
          if BigFoot_82c1f7ff9fe375991bbc112c6d247f17[dwID] and BigFoot_669fa01852f90cf7b764d63244920269[dwID] and BigFoot_669fa01852f90cf7b764d63244920269[dwID] ~= 10 then
            local BigFoot_0db5ab7591386d733b59a51d951e85d0 = math.random(1, 10)
            BigFoot_669fa01852f90cf7b764d63244920269[dwID] = BigFoot_0db5ab7591386d733b59a51d951e85d0
          end
          do return end
          BF_ChannelsSimulator.BigFoot_8ffd04905f1039a2342d8ee2cde5774b = BF_ChannelsSimulator.BigFoot_8ffd04905f1039a2342d8ee2cde5774b + BigFoot_c8854a838d9d08f9224f1e74e9927e51
          if dwID == 60 then
            BF_ChannelsSimulator.BigFoot_5228dfc835e0069055b51034e8f04cf3 = BF_ChannelsSimulator.BigFoot_5228dfc835e0069055b51034e8f04cf3 + 900
          end
          ChannelsPanel.UpdateGuidePage(this:GetRoot())
          ChannelsPanel.UpdateCommonPage(this:GetRoot())
          ChannelsPanel.UpdateTrainValue(this:GetRoot())
        end
      end
    end
  else
    local szMsg = g_tStrings.ERR_OPEN_VENATION_GET_NOT_SATISFLED
    if this.nError == ERR_OPEN_VENATION_LEVEL_LOWER then
      szMsg = g_tStrings.ERR_OPEN_VENATION_LEVEL_LOWER
    else
      if this.nError == ERR_OPEN_VENATION_NOT_ENOUGH_TRAIN then
        szMsg = g_tStrings.ERR_OPEN_VENATION_NOT_ENOUGH_TRAIN
      end
    else
      if this.nError == ERR_OPEN_VENATION_NOT_OPEN then
        szMsg = g_tStrings.ERR_OPEN_VENATION_NOT_OPEN
      end
    else
      if this.nError == ERR_OPEN_VENATION_LIMIT_TRAIN then
        szMsg = g_tStrings.ERR_OPEN_VENATION_LIMIT_TRAIN
      end
    end
    OutputMessage("MSG_ANNOUNCE_RED", szMsg)
  end
end

BF_ChannelsSimulator.OnMouseEnter = function()
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
      end
      do return end
      if BigFoot_9c987de176f2b454baede402cee36bfa.nCurrentTrainValue < nCost then
        nFont = 102
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
        end
      else
        if VenationType[dwID] == PHYSICS_VENATION then
          dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nPhysicsVenationCof
        end
      else
        if VenationType[dwID] == MAGIC_VENATION then
          dwbase = BigFoot_9c987de176f2b454baede402cee36bfa.nMagicVenationCof
        end
      end
      fP = 100 * (dwbase + VenationDifficult[dwID][dwLevel]) / 1024
    end
    if fP > 100 then
      fP = 100
    end
    fP = fP + 0.5
    fP = fP - (fP) % 1
    local szReturn = ""
    if VenationCost[dwID] and VenationCost[dwID][dwLevel] then
      local nReturn = math.floor(GetRestoreTrain(BigFoot_9c987de176f2b454baede402cee36bfa, BF_ChannelsSimulator.GetActualCostTrain(BigFoot_9c987de176f2b454baede402cee36bfa, VenationCost[dwID][dwLevel])))
    end
    if nReturn ~= 0 and fP ~= 100 then
      szReturn = "<text>text=" .. EncodeComponentsString(FormatString("\t" .. g_tStrings.STR_LEARN_RETURN_VENATION, nReturn)) .. " font=106 </text>"
      bLevel = false
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
        end
        do return end
        if BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(vSkill.ID) < vSkill.Level then
          nFont = 102
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
      end
    else
      szTip = szTip .. "<text>text=" .. EncodeComponentsString(szDesc) .. " font=100 </text>"
    end
    OutputTip(szTip, 300, {x, y, w, h})
  end
end

BF_ChannelsSimulator.Clear = function(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f = {}
  BF_ChannelsSimulator.Level = BF_ChannelsSimulator.BigFoot_d39b200492710b5b89785b03a21e33e7
  BF_ChannelsSimulator.BigFoot_8ffd04905f1039a2342d8ee2cde5774b = 0
  ChannelsPanel.UpdateGuidePage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  ChannelsPanel.UpdateCommonPage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  ChannelsPanel.UpdateTrainValue(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
end

BF_ChannelsSimulator.Reset = function(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  BF_ChannelsSimulator.Init()
  ChannelsPanel.UpdateGuidePage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  ChannelsPanel.UpdateCommonPage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  ChannelsPanel.UpdateTrainValue(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
end

BF_ChannelsSimulator.Apply = function()
  if #BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8 > 0 then
    local BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88 = {
{szOption = "确定", fnAction = function()
    BF_ChannelsSimulator.start = true
    BF_ChannelsSimulator.start = true
    GetClientPlayer().OpenVenation(BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8[1])
  end}, 
{szOption = "取消"}; szMessage = "确定要打通所点的经脉吗？", szName = "BF_OpenVenationSure", fnAutoClose = function()
    return not IsChannelsPanelOpened()
  end}
    MessageBox(BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88)
  end
end

BF_ChannelsSimulator.CanOpenVenation = function(BigFoot_0db5ab7591386d733b59a51d951e85d0, BigFoot_8d0febf2348ea712b2b375ae95601d5f)
  -- upvalues: BigFoot_82c1f7ff9fe375991bbc112c6d247f17
  if not VenationRequireLevel[BigFoot_8d0febf2348ea712b2b375ae95601d5f] or BigFoot_0db5ab7591386d733b59a51d951e85d0 < VenationRequireLevel[BigFoot_8d0febf2348ea712b2b375ae95601d5f] then
    return false, ERR_OPEN_VENATION_LEVEL_LOWER
  end
  if BF_ChannelsSimulator.BigFoot_8ffd04905f1039a2342d8ee2cde5774b >= 100000 then
    return false, ERR_OPEN_VENATION_LIMIT_TRAIN
  end
  local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
  local l = BigFoot_669fa01852f90cf7b764d63244920269[BigFoot_8d0febf2348ea712b2b375ae95601d5f]
  local skill = GetSkill(BigFoot_8d0febf2348ea712b2b375ae95601d5f, 1)
  l = l and l + 1 or 1
  if skill.dwMaxLevel < l then
    return false, 0
  end
  if not BF_ChannelsSimulator.preview and BF_ChannelsSimulator.BigFoot_2cce3085b1cc1a5a7245e15eb15402e8 < BF_ChannelsSimulator.GetActualCostTrain(GetClientPlayer(), VenationCost[BigFoot_8d0febf2348ea712b2b375ae95601d5f][l]) then
    return false, ERR_OPEN_VENATION_NOT_ENOUGH_TRAIN
  end
  if BigFoot_82c1f7ff9fe375991bbc112c6d247f17[BigFoot_8d0febf2348ea712b2b375ae95601d5f] then
    for _,v in ipairs(BigFoot_82c1f7ff9fe375991bbc112c6d247f17[BigFoot_8d0febf2348ea712b2b375ae95601d5f]) do
      local maxLevel = GetSkill(v, 1).dwMaxLevel
      if not BigFoot_669fa01852f90cf7b764d63244920269[v] or BigFoot_669fa01852f90cf7b764d63244920269[v] ~= maxLevel then
        return false, ERR_OPEN_VENATION_NOT_OPEN
      end
    end
    return true, 0
  end
  if VenationRequirement[BigFoot_8d0febf2348ea712b2b375ae95601d5f] and #VenationRequirement[BigFoot_8d0febf2348ea712b2b375ae95601d5f] ~= 0 then
    local v = VenationRequirement[BigFoot_8d0febf2348ea712b2b375ae95601d5f]
    for i,skill in ipairs(v) do
      if BigFoot_669fa01852f90cf7b764d63244920269[skill.ID] and skill.Level <= BigFoot_669fa01852f90cf7b764d63244920269[skill.ID] then
        return true, 0
      end
    end
    return false, ERR_OPEN_VENATION_NOT_OPEN
  else
    return true, 0
  end
  return false, 0
end

BF_ChannelsSimulator.UpdateGuidePage = function(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
  local wndGuide = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Lookup("Wnd_Guide")
  local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
  local handle = wndGuide:Lookup("", "")
  local hName = handle:Lookup("Handle_Name")
  if hName then
    hName:Show(ChannelsPanel.bShowName)
  end
  for k,v in pairs(ChannelsPanel.Guide) do
    local btn = wndGuide:Lookup("Btn_" .. k)
    btn.szName = k
    btn.dwID = v[1]
    btn.bGuideBtn = true
    local text = handle:Lookup("Text_" .. k)
    local img = handle:Lookup("Image_" .. k)
    local img1 = (handle:Lookup("Image_" .. k .. "1"))
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
      text:Show()
      text:SetText(nLevel)
      if nLevel == 0 then
        text:SetFontScheme(186)
        img:Hide()
        if img1 then
          img1:Hide()
        end
      else
        local skill = GetSkill(btn.dwID, nLevel)
        if nLevel == skill.dwMaxLevel then
          btn.bMax = true
          text:SetFontScheme(185)
        else
          text:SetFontScheme(186)
        end
        img:Show()
      end
      if img1 then
        img1:Show()
      end
    else
      text:Hide()
      btn:Enable(false)
      img:Hide()
    end
    if img1 then
      img1:Hide()
    end
    for szName,dwID in pairs(v[2]) do
      local c = wndGuide:Lookup("CheckBox_" .. szName)
      local cD = (wndGuide:Lookup("CheckBox_" .. szName .. "_Dis"))
      local bCanOpen, nError = nil, nil
      if BF_ChannelsSimulator.emulate then
        bCanOpen, nError = BF_ChannelsSimulator.CanOpenVenation(BF_ChannelsSimulator.Level, btn.dwID)
      else
        bCanOpen, nError = CanOpenVenation(BigFoot_9c987de176f2b454baede402cee36bfa, btn.dwID)
      end
      local nLevel = nil
      nLevel = not BF_ChannelsSimulator.emulate or BigFoot_669fa01852f90cf7b764d63244920269[dwID] or 0
      do return end
      nLevel = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(dwID)
      if not bCanOpen and nLevel < 1 then
        c, cD = cD, c
      end
      c:Show()
      cD:Hide()
      c.szName = szName
      c.dwID = dwID
      c.bGuideCheckBox = true
    end
  end
  local BigFoot_abc54a57e5cd11187f6138c45fe52547 = false
  for k,v in pairs(ChannelsPanel.Jingwaiqixue) do
    local nLevel = nil
    nLevel = not BF_ChannelsSimulator.emulate or BigFoot_669fa01852f90cf7b764d63244920269[dwID] or 0
    do return end
    nLevel = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(dwID)
    local bCanOpen, nError = nil, nil
    if BF_ChannelsSimulator.emulate then
      bCanOpen, nError = BF_ChannelsSimulator.CanOpenVenation(BF_ChannelsSimulator.Level, dwID)
    else
      bCanOpen, nError = CanOpenVenation(BigFoot_9c987de176f2b454baede402cee36bfa, dwID)
    end
    if nLevel >= 1 or bCanOpen then
      BigFoot_abc54a57e5cd11187f6138c45fe52547 = true
  else
    end
  end
  local c = wndGuide:Lookup("CheckBox_Jingwaiqixue")
  local cD = wndGuide:Lookup("CheckBox_Jingwaiqixue_Dis")
  if BigFoot_abc54a57e5cd11187f6138c45fe52547 then
    c:Show()
    cD:Hide()
    c.szName = "Jingwaiqixue"
    c.dwID = ChannelsPanel.Jingwaiqixue_ID
    c.bGuideCheckBox = true
  else
    c:Hide()
    cD:Show()
    cD.szName = "Jingwaiqixue"
    cD.dwID = ChannelsPanel.Jingwaiqixue_ID
    cD.bGuideCheckBox = true
  end
end

BF_ChannelsSimulator.UpdateCommonPage = function(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
  local BigFoot_4082b0e24d90b4bdf8a90c76450bab93 = false
  local bHave = false
  local page = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetFirstChild()
  while page do
    local pageN = page:GetNext()
    if page.bCommonPage then
      if page.szName == BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName then
        page:Show()
        BigFoot_4082b0e24d90b4bdf8a90c76450bab93 = page
      end
    else
      page:Destroy()
    end
    page = pageN
  end
  if not BigFoot_4082b0e24d90b4bdf8a90c76450bab93 then
    if not BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName then
      BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName = "Introduction"
    end
    local BigFoot_c2f245debd3efc045524792c222180d3 = Wnd.OpenWindow("ChannelsPanel_" .. BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName)
    BigFoot_4082b0e24d90b4bdf8a90c76450bab93 = BigFoot_c2f245debd3efc045524792c222180d3:Lookup("Wnd_" .. BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName)
    BigFoot_4082b0e24d90b4bdf8a90c76450bab93.szName = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName
    BigFoot_4082b0e24d90b4bdf8a90c76450bab93.bCommonPage = true
    BigFoot_4082b0e24d90b4bdf8a90c76450bab93:ChangeRelation(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, true, true)
    BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Lookup("Scene_SFX"):BringToTop()
    BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Lookup("Btn_Close"):BringToTop()
    BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Lookup("CheckBox_ShowAll"):BringToTop()
    Wnd.CloseWindow("ChannelsPanel_" .. BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.szName)
  end
  local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
  local handle = BigFoot_4082b0e24d90b4bdf8a90c76450bab93:Lookup("", "")
  local hName = handle:Lookup("Handle_Name")
  if hName then
    hName:Show(ChannelsPanel.bShowName)
  end
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
        end
      else
        local skill = GetSkill(btn.dwID, nLevel)
        if nLevel == skill.dwMaxLevel then
          btn.bMax = true
          if text then
            text:SetFontScheme(185)
          end
        elseif text then
          text:SetFontScheme(186)
        end
      end
      if img then
        img:Show()
      end
    else
      btn:Enable(false)
      if text then
        text:Hide()
      end
    end
    if img then
      img:Hide()
    end
  end
end

BF_ChannelsSimulator.UpdateTrainValue = function(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
  local handle = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Lookup("Wnd_Guide", "")
  local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
  if BF_ChannelsSimulator.emulate then
    if BF_ChannelsSimulator.preview then
      handle:Lookup("Text_XWValueL"):SetText("*****/*****")
    else
      handle:Lookup("Text_XWValueL"):SetText(BF_ChannelsSimulator.BigFoot_2cce3085b1cc1a5a7245e15eb15402e8 .. "/" .. BF_ChannelsSimulator.BigFoot_5228dfc835e0069055b51034e8f04cf3)
    end
    handle:Lookup("Text_XWValueR"):SetText(BF_ChannelsSimulator.BigFoot_8ffd04905f1039a2342d8ee2cde5774b .. "/" .. 100000)
  else
    handle:Lookup("Text_XWValueL"):SetText(BigFoot_9c987de176f2b454baede402cee36bfa.nCurrentTrainValue .. "/" .. BigFoot_9c987de176f2b454baede402cee36bfa.nMaxTrainValue)
    local nMin, nMax = CalcVenationTrainvalue(BigFoot_9c987de176f2b454baede402cee36bfa)
    handle:Lookup("Text_XWValueR"):SetText(nMin .. "/" .. nMax)
  end
end

BF_ChannelsSimulator.Init = function()
  BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f = {}
  BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8 = {}
  local BigFoot_669fa01852f90cf7b764d63244920269 = BF_ChannelsSimulator.BigFoot_5f64b171232f3a1579d5f9f0bb50931f
  local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
  for name,channel in pairs(ChannelsPanel.Guide) do
    BigFoot_669fa01852f90cf7b764d63244920269[channel[1]] = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(channel[1])
    for name2,channel2 in pairs(channel[2]) do
      BigFoot_669fa01852f90cf7b764d63244920269[channel2] = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(channel2)
      for name3,channel3 in pairs(ChannelsPanel[name2]) do
        BigFoot_669fa01852f90cf7b764d63244920269[channel3] = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(channel3)
      end
    end
  end
  BF_ChannelsSimulator.Level = BigFoot_9c987de176f2b454baede402cee36bfa.nLevel
  BF_ChannelsSimulator.BigFoot_2cce3085b1cc1a5a7245e15eb15402e8 = BigFoot_9c987de176f2b454baede402cee36bfa.nCurrentTrainValue
  BF_ChannelsSimulator.BigFoot_5228dfc835e0069055b51034e8f04cf3 = BigFoot_9c987de176f2b454baede402cee36bfa.nMaxTrainValue
  BF_ChannelsSimulator.BigFoot_8ffd04905f1039a2342d8ee2cde5774b = CalcVenationTrainvalue(BigFoot_9c987de176f2b454baede402cee36bfa)
end

BF_ChannelsSimulator.OpenChannelsPanel = function(...)
  BF_ChannelsSimulator._OpenChannelsPanel(...)
  BF_ChannelsSimulator.Level = GetClientPlayer().nLevel
  BF_ChannelsSimulator.CreateButtons(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
end

BF_ChannelsSimulator.CreateButtons = function()
  -- upvalues: print
  local BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Station.Lookup("Normal/ChannelsPanel")
  if not BF_ChannelsSimulator.BigFoot_432359b9d4de681c30bdba07f8ad2ef3 then
    local button = BFButton.new(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, 80, 25, "配置经脉")
    do
      local bx, by = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetAbsPos()
      button:SetPoint("TOPLEFT", BFScreen, "TOPLEFT", bx + 85, by + 435)
      button:SetStyle("TOGGLE")
      button:AddListener({OnMouseDown = function()
        -- upvalues: button , print
        if button:GetToggle() then
          print("已启用配置经脉功能，加点后需要点击“应用”生效。")
          BF_ChannelsSimulator.emulate = true
          BF_ChannelsSimulator.preview = false
          BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a:Enable()
          BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38:Enable()
          BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1:Enable()
          BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a:SetToggle(false)
          BF_ChannelsSimulator.Reset(this:GetRoot())
        else
          print("已关闭配置经脉功能，加点将直接生效。")
          BF_ChannelsSimulator.emulate = nil
          BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a:SetToggle(false)
          BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a:Disable()
          BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38:Disable()
          BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1:Disable()
          ChannelsPanel.UpdateGuidePage(this:GetRoot())
          ChannelsPanel.UpdateCommonPage(this:GetRoot())
          ChannelsPanel.UpdateTrainValue(this:GetRoot())
        end
      end})
      BF_ChannelsSimulator.BigFoot_432359b9d4de681c30bdba07f8ad2ef3 = button
    end
  end
  if not BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a then
    local button = BFButton.new(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, 60, 25, "预览")
    button:SetPoint("TOPLEFT", BF_ChannelsSimulator.BigFoot_432359b9d4de681c30bdba07f8ad2ef3, "TOPRIGHT", 0, 0)
    button:SetStyle("TOGGLE")
    button:AddListener({OnMouseDown = function()
      -- upvalues: button
      if BF_ChannelsSimulator.emulate then
        if button:GetToggle() then
          BF_ChannelsSimulator.preview = true
          BF_ChannelsSimulator.Clear(this:GetRoot())
          BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38:Disable()
        end
      else
        BF_ChannelsSimulator.preview = false
        BF_ChannelsSimulator.Reset(this:GetRoot())
        BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38:Enable()
      end
    end})
    button:Disable()
    BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a = button
  end
  if not BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1 then
    local button = BFButton.new(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, 60, 25, "重置")
    button:SetPoint("TOPLEFT", BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a, "TOPRIGHT", 0, 0)
    button:Disable()
    button.OnClick = function()
      if BF_ChannelsSimulator.preview then
        BF_ChannelsSimulator.Clear(this:GetRoot())
      else
        BF_ChannelsSimulator.Reset(this:GetRoot())
      end
    end
    BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1 = button
  end
  if not BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38 then
    local button = BFButton.new(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, 60, 25, "学习")
    button:SetPoint("TOPLEFT", BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1, "TOPRIGHT", 10, 0)
    button:Disable()
    button.OnClick = BF_ChannelsSimulator.Apply
    BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38 = button
  end
end

BF_ChannelsSimulator.OnReturnCode = function()
  if BF_ChannelsSimulator.enabled and BF_ChannelsSimulator.start then
    local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
    do
      local BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Station.Lookup("Normal/ChannelsPanel")
      for i,BigFoot_8d0febf2348ea712b2b375ae95601d5f in ipairs(BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8) do
        if BigFoot_8d0febf2348ea712b2b375ae95601d5f == arg1 then
          if arg0 then
            table.remove(BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8, i)
            if #BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8 > 0 then
              GetClientPlayer().OpenVenation(BF_ChannelsSimulator.BigFoot_ad0a832947633a236421070639d974f8[1])
            else
              BF_ChannelsSimulator.start = nil
              BF_ChannelsSimulator.UpdateGuidePage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
              BF_ChannelsSimulator.UpdateCommonPage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
              BF_ChannelsSimulator.UpdateTrainValue(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
            end
          else
            local BigFoot_0db5ab7591386d733b59a51d951e85d0 = BigFoot_9c987de176f2b454baede402cee36bfa.GetSkillLevel(arg1)
            local name = Table_GetSkillName(arg1, BigFoot_0db5ab7591386d733b59a51d951e85d0)
            local BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88 = {
{szOption = g_tStrings.STR_HOTKEY_SURE, fnAction = function()
              GetClientPlayer().OpenVenation(arg1)
            end}, 
{szOption = g_tStrings.STR_HOTKEY_CANCEL, fnAction = function()
              -- upvalues: BigFoot_411b8aa6d5954c6020f0b9c9e80e847a
              BF_ChannelsSimulator.start = nil
              BF_ChannelsSimulator.UpdateGuidePage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
              BF_ChannelsSimulator.UpdateCommonPage(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
              BF_ChannelsSimulator.UpdateTrainValue(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
            end}; szMessage = "打通经脉" .. name .. "第" .. BigFoot_0db5ab7591386d733b59a51d951e85d0 + 1 .. "重失败，是否重新打通该经脉？", szName = "BF_ContinueOpenVenationSure", fnAutoClose = function()
              return not IsChannelsPanelOpened()
            end}
            MessageBox(BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88)
          end
      else
        end
      end
    end
  end
end

RegisterEvent("ON_OPEN_VENATION_RETCODE", BF_ChannelsSimulator.OnReturnCode)
BFConfigPanel.RegisterMod("ChannelSimulator", "经脉模拟器", "\\ui\\image\\icon\\skill_jianghu09.tga", "jingmaimoniqi")
BFConfigPanel.RegisterCheckButton("ChannelSimulator", "EnableChannelSimulator", "启用经脉模拟器", true, function(enabled, init)
  BF_ChannelsSimulator.enabled = enabled
  if enabled then
    if IsChannelsPanelOpened() then
      BF_ChannelsSimulator.CreateButtons()
    end
    if BF_ChannelsSimulator.BigFoot_432359b9d4de681c30bdba07f8ad2ef3 then
      BF_ChannelsSimulator.BigFoot_432359b9d4de681c30bdba07f8ad2ef3:Show()
    end
    if BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a then
      BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a:Show()
    end
    if BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1 then
      BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1:Show()
    end
    if BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38 then
      BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38:Show()
    end
    if not BF_ChannelsSimulator._OnLButtonClick then
      BF_ChannelsSimulator._OnLButtonClick = ChannelsPanel.OnLButtonClick
      ChannelsPanel.OnLButtonClick = BF_ChannelsSimulator.OnLButtonClick
    end
    if not BF_ChannelsSimulator._OnRButtonClick then
      BF_ChannelsSimulator._OnRButtonClick = ChannelsPanel.OnRButtonClick
      ChannelsPanel.OnRButtonClick = BF_ChannelsSimulator.OnRButtonClick
    end
    if not BF_ChannelsSimulator._OpenChannelsPanel then
      BF_ChannelsSimulator._OpenChannelsPanel = OpenChannelsPanel
      OpenChannelsPanel = BF_ChannelsSimulator.OpenChannelsPanel
    end
    if not BF_ChannelsSimulator._UpdateGuidePage then
      BF_ChannelsSimulator._UpdateGuidePage = ChannelsPanel.UpdateGuidePage
      ChannelsPanel.UpdateGuidePage = BF_ChannelsSimulator.UpdateGuidePage
    end
    if not BF_ChannelsSimulator._UpdateCommonPage then
      BF_ChannelsSimulator._UpdateCommonPage = ChannelsPanel.UpdateCommonPage
      ChannelsPanel.UpdateCommonPage = BF_ChannelsSimulator.UpdateCommonPage
    end
    if not BF_ChannelsSimulator._UpdateTrainValue then
      BF_ChannelsSimulator._UpdateTrainValue = ChannelsPanel.UpdateTrainValue
      ChannelsPanel.UpdateTrainValue = BF_ChannelsSimulator.UpdateTrainValue
    end
    if not BF_ChannelsSimulator._OnMouseEnter then
      BF_ChannelsSimulator._OnMouseEnter = ChannelsPanel.OnMouseEnter
      ChannelsPanel.OnMouseEnter = BF_ChannelsSimulator.OnMouseEnter
    end
  else
    if BF_ChannelsSimulator.BigFoot_432359b9d4de681c30bdba07f8ad2ef3 then
      BF_ChannelsSimulator.BigFoot_432359b9d4de681c30bdba07f8ad2ef3:Hide()
    end
    if BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a then
      BF_ChannelsSimulator.BigFoot_cc95505d1b9fb118937d0b08b0d0462a:Hide()
    end
    if BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1 then
      BF_ChannelsSimulator.BigFoot_62cac0e69ed8e4f3e8257194bf2c55d1:Hide()
    end
    if BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38 then
      BF_ChannelsSimulator.BigFoot_3f7a5499342dbf21365f50c4bdde5f38:Hide()
    end
    if BF_ChannelsSimulator._OnLButtonClick then
      ChannelsPanel.OnLButtonClick = BF_ChannelsSimulator._OnLButtonClick
      BF_ChannelsSimulator._OnLButtonClick = nil
    end
    if BF_ChannelsSimulator._OnRButtonClick then
      ChannelsPanel.OnRButtonClick = BF_ChannelsSimulator.OnRButtonClick
      BF_ChannelsSimulator._OnRButtonClick = nil
    end
    if BF_ChannelsSimulator._OpenChannelsPanel then
      OpenChannelsPanel = BF_ChannelsSimulator._OpenChannelsPanel
      BF_ChannelsSimulator._OpenChannelsPanel = nil
    end
    if BF_ChannelsSimulator._UpdateGuidePage then
      ChannelsPanel.UpdateGuidePage = BF_ChannelsSimulator._UpdateGuidePage
      BF_ChannelsSimulator._UpdateGuidePage = nil
    end
    if BF_ChannelsSimulator._UpdateCommonPage then
      ChannelsPanel.UpdateCommonPage = BF_ChannelsSimulator._UpdateCommonPage
      BF_ChannelsSimulator._UpdateCommonPage = nil
    end
    if BF_ChannelsSimulator._UpdateTrainValue then
      ChannelsPanel.UpdateTrainValue = BF_ChannelsSimulator._UpdateTrainValue
      BF_ChannelsSimulator._UpdateTrainValue = nil
    end
  end
  if BF_ChannelsSimulator._OnMouseEnter then
    ChannelsPanel.OnMouseEnter = BF_ChannelsSimulator._OnMouseEnter
    BF_ChannelsSimulator._OnMouseEnter = nil
  end
end
)

