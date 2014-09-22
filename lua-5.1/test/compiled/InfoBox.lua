-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: todo\InfoBox.luac 

InfoBox_Coordinate = {}
InfoBox_Coordinate.BigFoot_0863dc7b3a0e559f0cc8a802e89ee059 = {}
InfoBox_Coordinate.OnFrameCreate = function()
  local BigFoot_de4d341f1279ea0bbee20cd491069886 = this:Lookup("", "")
  if not BigFoot_de4d341f1279ea0bbee20cd491069886 then
    Output("no handle")
  end
  local BigFoot_74117ff6c6dd6182561de09fa1f743f3 = BigFoot_de4d341f1279ea0bbee20cd491069886:Lookup("Text_Coordinate_Text")
  this.BigFoot_99eed1ff9f687c051a0219c86c0ed9c6 = BigFoot_74117ff6c6dd6182561de09fa1f743f3
  BigFoot.RegisterFrame("position", "InfoBox_Coordinate", this)
end

InfoBox_Coordinate.OnFrameBreathe = function()
  if this.BigFoot_99eed1ff9f687c051a0219c86c0ed9c6 then
    local BigFoot_b254e387cf58e982ba24fcb3e8a63995, BigFoot_a0f453fd098c0b0fda780f69cda6ffbf = InfoBox_Coordinate.GetPlayerMapPosition()
    if BigFoot_b254e387cf58e982ba24fcb3e8a63995 and BigFoot_a0f453fd098c0b0fda780f69cda6ffbf then
      BigFoot_b254e387cf58e982ba24fcb3e8a63995 = math.floor(BigFoot_b254e387cf58e982ba24fcb3e8a63995 * 10) / 10
      BigFoot_a0f453fd098c0b0fda780f69cda6ffbf = math.floor(BigFoot_a0f453fd098c0b0fda780f69cda6ffbf * 10) / 10
      this.BigFoot_99eed1ff9f687c051a0219c86c0ed9c6:SetText(string.format("坐标：(%.1f, %3.1f)", BigFoot_b254e387cf58e982ba24fcb3e8a63995, BigFoot_a0f453fd098c0b0fda780f69cda6ffbf))
    end
  end
end

InfoBox_Coordinate.GetPlayerMapPosition = function()
  local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
  if BigFoot_9c987de176f2b454baede402cee36bfa then
    local BigFoot_d8acf8a12c595dfa19affa62a5ca832a = BigFoot_9c987de176f2b454baede402cee36bfa.GetScene()
    local BigFoot_1f621b534590757d9eeeb8252d387132 = BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwMapID
    local BigFoot_b254e387cf58e982ba24fcb3e8a63995, BigFoot_a0f453fd098c0b0fda780f69cda6ffbf, BigFoot_c62298b93a3e336cb2dce2ecaaa7c723 = Scene_GameWorldPositionToScenePosition(BigFoot_9c987de176f2b454baede402cee36bfa.nX, BigFoot_9c987de176f2b454baede402cee36bfa.nY, BigFoot_9c987de176f2b454baede402cee36bfa.nZ, 0)
    if not InfoBox_Coordinate.BigFoot_0863dc7b3a0e559f0cc8a802e89ee059[BigFoot_1f621b534590757d9eeeb8252d387132] then
      MiddleMap.InitMiddleMapInfo(BigFoot_1f621b534590757d9eeeb8252d387132)
      InfoBox_Coordinate.BigFoot_0863dc7b3a0e559f0cc8a802e89ee059[BigFoot_1f621b534590757d9eeeb8252d387132] = {MiddleMap.aInfo[BigFoot_1f621b534590757d9eeeb8252d387132][0].scale, MiddleMap.aInfo[BigFoot_1f621b534590757d9eeeb8252d387132][0].startx, MiddleMap.aInfo[BigFoot_1f621b534590757d9eeeb8252d387132][0].starty}
    end
    BigFoot_b254e387cf58e982ba24fcb3e8a63995 = (BigFoot_9c987de176f2b454baede402cee36bfa.nX - InfoBox_Coordinate.BigFoot_0863dc7b3a0e559f0cc8a802e89ee059[BigFoot_1f621b534590757d9eeeb8252d387132][2]) * InfoBox_Coordinate.BigFoot_0863dc7b3a0e559f0cc8a802e89ee059[BigFoot_1f621b534590757d9eeeb8252d387132][1] / 1024 * 100
    BigFoot_a0f453fd098c0b0fda780f69cda6ffbf = 100 - (BigFoot_9c987de176f2b454baede402cee36bfa.nY - InfoBox_Coordinate.BigFoot_0863dc7b3a0e559f0cc8a802e89ee059[BigFoot_1f621b534590757d9eeeb8252d387132][3]) * InfoBox_Coordinate.BigFoot_0863dc7b3a0e559f0cc8a802e89ee059[BigFoot_1f621b534590757d9eeeb8252d387132][1] / 896 * 100
    return BigFoot_b254e387cf58e982ba24fcb3e8a63995, BigFoot_a0f453fd098c0b0fda780f69cda6ffbf
  end
end

InfoBox_Money = {}
InfoBox_Money.OnFrameCreate = function()
  local BigFoot_aada3e71b74d40089d65da08a219752d = this:Lookup("", "")
  local BigFoot_d583b9c1ae67201869a71ba820811037 = BigFoot_aada3e71b74d40089d65da08a219752d:Lookup("Text_Money_Gold")
  local BigFoot_3677d409f6c174a1682145d8233508cf = BigFoot_aada3e71b74d40089d65da08a219752d:Lookup("Text_Money_Silver")
  local BigFoot_6be91c4225719a10d71c2b312539cff4 = BigFoot_aada3e71b74d40089d65da08a219752d:Lookup("Text_Money_Copper")
  this.BigFoot_57eb98f095d8ec0ba5a82505e4146693 = BigFoot_d583b9c1ae67201869a71ba820811037
  this.BigFoot_eff85e9367cf584cee5f5f15217bb0ab = BigFoot_3677d409f6c174a1682145d8233508cf
  this.BigFoot_055916812000ee57ba9b0e8c03cd3fca = BigFoot_6be91c4225719a10d71c2b312539cff4
  BigFoot.RegisterFrame("position", "InfoBox_Money", this)
end

InfoBox_Money.OnFrameBreathe = function()
  if this.BigFoot_57eb98f095d8ec0ba5a82505e4146693 and this.BigFoot_eff85e9367cf584cee5f5f15217bb0ab and this.BigFoot_055916812000ee57ba9b0e8c03cd3fca then
    local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
    if BigFoot_9c987de176f2b454baede402cee36bfa then
      local BigFoot_22757db962500df3e5f8bfed4be92671 = BigFoot_9c987de176f2b454baede402cee36bfa.GetMoney()
      local BigFoot_4df2bf4d3a644bf06784b29adf8d55a1, BigFoot_b033c39a31a3b56a9eabda6ee51d3555, BigFoot_6e1999455bc6f475ac84e81b887457e8 = MoneyToGoldSilverAndCopper(BigFoot_22757db962500df3e5f8bfed4be92671)
      this.BigFoot_57eb98f095d8ec0ba5a82505e4146693:SetText(BigFoot_4df2bf4d3a644bf06784b29adf8d55a1)
      this.BigFoot_eff85e9367cf584cee5f5f15217bb0ab:SetText(BigFoot_b033c39a31a3b56a9eabda6ee51d3555)
      this.BigFoot_055916812000ee57ba9b0e8c03cd3fca:SetText(BigFoot_6e1999455bc6f475ac84e81b887457e8)
    end
  end
end

InfoBox_Latency = {}
InfoBox_Latency.OnFrameCreate = function()
  local BigFoot_054ea70c612700c7624e7e6f7e33dfaf = this:Lookup("", "")
  local BigFoot_4a7c40951d7317a7256c8400e9f54d0c = BigFoot_054ea70c612700c7624e7e6f7e33dfaf:Lookup("Text_Latency_Text")
  this.BigFoot_1ec77ded1507d66ae96235380f042d6e = BigFoot_4a7c40951d7317a7256c8400e9f54d0c
  this.BigFoot_da4b94f92d67ca9ccecb24bec1db6e2b = 0
  BigFoot.RegisterFrame("position", "InfoBox_Latency", this)
end

InfoBox_Latency.OnFrameBreathe = function()
  if this.BigFoot_1ec77ded1507d66ae96235380f042d6e and GetTime() - this.BigFoot_da4b94f92d67ca9ccecb24bec1db6e2b >= 1000 then
    this.BigFoot_da4b94f92d67ca9ccecb24bec1db6e2b = GetTime()
    local BigFoot_672c276da91758ee4a19855e74c1c298 = GetPingValue()
    local BigFoot_3b5d909ab4c66934b05cf3d64e8869fe = math.floor(BigFoot_672c276da91758ee4a19855e74c1c298 / 2)
    this.BigFoot_1ec77ded1507d66ae96235380f042d6e:SetText(string.format("延迟：%d ms", BigFoot_3b5d909ab4c66934b05cf3d64e8869fe))
  end
end

InfoBox_Time = {}
InfoBox_Time.OnFrameCreate = function()
  local BigFoot_a92b8319e91ac09d7c6636753f08ac22 = this:Lookup("", "")
  local BigFoot_93538ae56fc2da3a279348daf09cae4b = BigFoot_a92b8319e91ac09d7c6636753f08ac22:Lookup("Text_Time_Text")
  this.BigFoot_16fbfa51fad8297d120937caf1e21477 = BigFoot_93538ae56fc2da3a279348daf09cae4b
  BigFoot.RegisterFrame("position", "InfoBox_Time", this)
end

InfoBox_Time.OnFrameBreathe = function()
  if this.BigFoot_16fbfa51fad8297d120937caf1e21477 then
    local BigFoot_5f383072a061a86d8cc9832ff484baa2 = GetCurrentTime()
    local BigFoot_6cad7a2aeb24618da0283adb2fd6d830 = TimeToDate(BigFoot_5f383072a061a86d8cc9832ff484baa2)
    this.BigFoot_16fbfa51fad8297d120937caf1e21477:SetText(string.format("时间：%02d:%02d:%02d", BigFoot_6cad7a2aeb24618da0283adb2fd6d830.hour, BigFoot_6cad7a2aeb24618da0283adb2fd6d830.minute, BigFoot_6cad7a2aeb24618da0283adb2fd6d830.second))
  end
end

InfoBox_FPS = {}
InfoBox_FPS.OnFrameCreate = function()
  local BigFoot_3d33e154ef3536c0941242e01feec5c5 = this:Lookup("", "")
  local BigFoot_237a5bc11b91db8da60c195ccd3e1dec = BigFoot_3d33e154ef3536c0941242e01feec5c5:Lookup("Text_FPS_Text")
  this.BigFoot_c94ea18e44d4b9da2e7d3ce0f4255e7d = BigFoot_237a5bc11b91db8da60c195ccd3e1dec
  BigFoot.RegisterFrame("position", "InfoBox_FPS", this)
end

InfoBox_FPS.OnFrameBreathe = function()
  if this.BigFoot_c94ea18e44d4b9da2e7d3ce0f4255e7d then
    local BigFoot_b26be9c7efbbb19a4e8a93e1dc4e6dd5 = GetFPS()
    this.BigFoot_c94ea18e44d4b9da2e7d3ce0f4255e7d:SetText(string.format("FPS：%d 帧/秒", BigFoot_b26be9c7efbbb19a4e8a93e1dc4e6dd5))
  end
end

InfoBox_Distance = {}
InfoBox_Distance.OnFrameCreate = function()
  local BigFoot_6bea4233ae966a12801660665ffb52f7 = this:Lookup("", "")
  local BigFoot_c2ac525ec6ac9e83e7245f0cb7a0e09a = BigFoot_6bea4233ae966a12801660665ffb52f7:Lookup("Text_Distance_Text")
  this.BigFoot_6d208a0fc5e3d675c37ab8d29dff0f2b = BigFoot_c2ac525ec6ac9e83e7245f0cb7a0e09a
  BigFoot.RegisterFrame("position", "InfoBox_Distance", this)
  InfoBox_Distance.BigFoot_646db4f803da0e6216236b552c4d9021 = GetSkill(13, 1)
  InfoBox_Distance.BigFoot_2631aeee980c9204e30791ec90dc204b = false
  InfoBox_Distance.BigFoot_fde30cf2fbd9bf45e8e2b5214ba024e3 = GetSkill(34, 1)
  InfoBox_Distance.BigFoot_d44023da1591ee79927269b226e3e08d = false
end

InfoBox_Distance.OnFrameBreathe = function()
  if this.BigFoot_6d208a0fc5e3d675c37ab8d29dff0f2b then
    local BigFoot_9c987de176f2b454baede402cee36bfa = GetClientPlayer()
    if not BigFoot_9c987de176f2b454baede402cee36bfa then
      return 
    end
    local BigFoot_a989a1829848b98a3554eaa01b0cc5b8 = GetTargetHandle(BigFoot_9c987de176f2b454baede402cee36bfa.GetTarget())
    local BigFoot_d8acf8a12c595dfa19affa62a5ca832a = BigFoot_9c987de176f2b454baede402cee36bfa.GetScene()
    if BigFoot_a989a1829848b98a3554eaa01b0cc5b8 and BigFoot_a989a1829848b98a3554eaa01b0cc5b8.dwID == BigFoot_9c987de176f2b454baede402cee36bfa.dwID then
      this.BigFoot_6d208a0fc5e3d675c37ab8d29dff0f2b:SetText("目标是自己")
    elseif BigFoot_a989a1829848b98a3554eaa01b0cc5b8 then
      local BigFoot_9d548ce4ff7f2f5b43fcc076699df7e6 = math.sqrt((BigFoot_9c987de176f2b454baede402cee36bfa.nX - BigFoot_a989a1829848b98a3554eaa01b0cc5b8.nX) * (BigFoot_9c987de176f2b454baede402cee36bfa.nX - BigFoot_a989a1829848b98a3554eaa01b0cc5b8.nX) + (BigFoot_9c987de176f2b454baede402cee36bfa.nY - BigFoot_a989a1829848b98a3554eaa01b0cc5b8.nY) * (BigFoot_9c987de176f2b454baede402cee36bfa.nY - BigFoot_a989a1829848b98a3554eaa01b0cc5b8.nY))
      do
         -- DECOMPILER ERROR: unhandled construct in 'if'

        if InfoBox_Distance.BigFoot_646db4f803da0e6216236b552c4d9021.UITestCast(BigFoot_9c987de176f2b454baede402cee36bfa.dwID) and InfoBox_Distance.BigFoot_2631aeee980c9204e30791ec90dc204b == false then
          local BigFoot_ce999b1d5f05e4be08a672d0134a7bda = BigFoot_9d548ce4ff7f2f5b43fcc076699df7e6 - InfoBox_Distance.BigFoot_646db4f803da0e6216236b552c4d9021.nMaxRadius - BigFoot_9c987de176f2b454baede402cee36bfa.nTouchRange
          if BigFoot_ce999b1d5f05e4be08a672d0134a7bda > 0 then
            if not InfoBox_Config.str then
              InfoBox_Config.str = {}
            end
            if not InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] then
              InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] = BigFoot_ce999b1d5f05e4be08a672d0134a7bda
            else
              if InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] > 2 then
                InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] = BigFoot_ce999b1d5f05e4be08a672d0134a7bda
              else
                if InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] < BigFoot_ce999b1d5f05e4be08a672d0134a7bda then
                  InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] = BigFoot_ce999b1d5f05e4be08a672d0134a7bda
                end
              end
            end
          end
          InfoBox_Distance.BigFoot_2631aeee980c9204e30791ec90dc204b = true
        end
        do return end
        InfoBox_Distance.BigFoot_2631aeee980c9204e30791ec90dc204b = false
      end
      do
         -- DECOMPILER ERROR: unhandled construct in 'if'

        if InfoBox_Distance.BigFoot_fde30cf2fbd9bf45e8e2b5214ba024e3.UITestCast(BigFoot_9c987de176f2b454baede402cee36bfa.dwID) and InfoBox_Distance.BigFoot_d44023da1591ee79927269b226e3e08d == false then
          local BigFoot_ce999b1d5f05e4be08a672d0134a7bda = BigFoot_9d548ce4ff7f2f5b43fcc076699df7e6 - InfoBox_Distance.BigFoot_fde30cf2fbd9bf45e8e2b5214ba024e3.nMaxRadius - BigFoot_9c987de176f2b454baede402cee36bfa.nTouchRange
          if BigFoot_ce999b1d5f05e4be08a672d0134a7bda > 0 then
            if not InfoBox_Config.str then
              InfoBox_Config.str = {}
            end
            if not InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] then
              InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] = BigFoot_ce999b1d5f05e4be08a672d0134a7bda
            else
              if InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] > 2 then
                InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] = BigFoot_ce999b1d5f05e4be08a672d0134a7bda
              else
                if InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] < BigFoot_ce999b1d5f05e4be08a672d0134a7bda then
                  InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] = BigFoot_ce999b1d5f05e4be08a672d0134a7bda
                end
              end
            end
          end
          InfoBox_Distance.BigFoot_d44023da1591ee79927269b226e3e08d = true
        end
        do return end
        InfoBox_Distance.BigFoot_d44023da1591ee79927269b226e3e08d = false
      end
      local BigFoot_e6955c64cf39bdb23dc86de1a9ec2117 = nil
      if InfoBox_Config.str and InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID] then
        BigFoot_e6955c64cf39bdb23dc86de1a9ec2117 = string.format("距离：%d尺内", (BigFoot_9d548ce4ff7f2f5b43fcc076699df7e6 - InfoBox_Config.str[BigFoot_d8acf8a12c595dfa19affa62a5ca832a.dwID]) / GLOBAL.CELL_LENGTH * GLOBAL.LOGICAL_CELL_CM_LENGTH / 100 + 1)
      else
        BigFoot_e6955c64cf39bdb23dc86de1a9ec2117 = string.format("距离：%d尺内", BigFoot_9d548ce4ff7f2f5b43fcc076699df7e6 / GLOBAL.CELL_LENGTH * GLOBAL.LOGICAL_CELL_CM_LENGTH / 100 + 1)
      end
      this.BigFoot_6d208a0fc5e3d675c37ab8d29dff0f2b:SetText(BigFoot_e6955c64cf39bdb23dc86de1a9ec2117)
    else
      this.BigFoot_6d208a0fc5e3d675c37ab8d29dff0f2b:SetText("没有目标")
    end
  end
end

InfoBox_Config = {version = 1.1}
InfoBox_Coordinate.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Wnd.OpenWindow("Interface\\BF_InfoBox\\InfoBox_Coordinate.ini", "InfoBox_Coordinate")
InfoBox_Money.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Wnd.OpenWindow("Interface\\BF_InfoBox\\InfoBox_Money.ini", "InfoBox_Money")
InfoBox_Latency.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Wnd.OpenWindow("Interface\\BF_InfoBox\\InfoBox_Latency.ini", "InfoBox_Latency")
InfoBox_Time.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Wnd.OpenWindow("Interface\\BF_InfoBox\\InfoBox_Time.ini", "InfoBox_Time")
InfoBox_FPS.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Wnd.OpenWindow("Interface\\BF_InfoBox\\InfoBox_FPS.ini", "InfoBox_FPS")
InfoBox_Distance.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = Wnd.OpenWindow("Interface\\BF_InfoBox\\InfoBox_Distance.ini", "InfoBox_Distance")
RegisterCustomData("Global\\InfoBox_Config")
InfoBox = {}
RegisterEvent("CUSTOM_DATA_LOADED", function()
  if arg0 ~= "Global" then
    return 
  end
  if not InfoBox_Config.userplace then
    InfoBox_Distance.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetAbsPos(1020, 30)
    InfoBox_Time.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetAbsPos(1180, 30)
    InfoBox_Coordinate.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetAbsPos(1340, 30)
    InfoBox_Money.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetAbsPos(1020, 64)
    InfoBox_Latency.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetAbsPos(1180, 64)
    InfoBox_FPS.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetAbsPos(1340, 64)
    InfoBox_Config.userplace = true
  end
end
)
BFConfigPanel.RegisterMod("InfoBox", "信息盒", "\\ui\\image\\icon\\extend10.tga", "xinxihe")
BFConfigPanel.RegisterCheckButton("InfoBox", "ShowCoordinatev2", "显示坐标", true, function(l_15_0)
  if l_15_0 then
    InfoBox_Coordinate.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Show()
  else
    InfoBox_Coordinate.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Hide()
  end
end
)
BFConfigPanel.RegisterCheckButton("InfoBox", "ShowMoneyv2", "显示金钱", false, function(l_16_0)
  if l_16_0 then
    InfoBox_Money.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Show()
  else
    InfoBox_Money.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Hide()
  end
end
)
BFConfigPanel.RegisterCheckButton("InfoBox", "ShowLatencyv2", "显示网络延迟", false, function(l_17_0)
  if l_17_0 then
    InfoBox_Latency.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Show()
  else
    InfoBox_Latency.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Hide()
  end
end
)
BFConfigPanel.RegisterCheckButton("InfoBox", "ShowTimev2", "显示时间", true, function(l_18_0)
  if l_18_0 then
    InfoBox_Time.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Show()
  else
    InfoBox_Time.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Hide()
  end
end
)
BFConfigPanel.RegisterCheckButton("InfoBox", "ShowFPSv2", "显示FPS", false, function(l_19_0)
  if l_19_0 then
    InfoBox_FPS.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Show()
  else
    InfoBox_FPS.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Hide()
  end
end
)
BFConfigPanel.RegisterCheckButton("InfoBox", "ShowDistancev2", "显示目标距离", true, function(l_20_0)
  if l_20_0 then
    InfoBox_Distance.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Show()
  else
    InfoBox_Distance.BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:Hide()
  end
end
)

