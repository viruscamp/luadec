-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: -f 13 todo\InfoBox.luac 

DecompiledFunction_13 = function()
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
