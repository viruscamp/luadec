-- Decompiled using luadec 2.1 UNICODE by sztupy (http://winmo.sztupy.hu) and viruscamp 
-- Command line was: xxq.luac 

AllFormulas[4070000] = {}
AllFormulas[4070000].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070000].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来1"
end
}}}
AllFormulas[4070001] = {}
AllFormulas[4070001].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070001].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来2"
end
}}}
AllFormulas[4070002] = {}
AllFormulas[4070002].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070002].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来3"
end
}}}
AllFormulas[4070003] = {}
AllFormulas[4070003].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070003].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你看我跑的多欢"
end
}}}
AllFormulas[4070004] = {}
AllFormulas[4070004].Condition = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4070005] = {}
AllFormulas[4070005].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070005].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "老师，你真给力 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070006] = {}
AllFormulas[4070006].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070006].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "徒弟，你真给力 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070007] = {}
AllFormulas[4070007].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070007].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哥们，你真给力 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070008] = {}
AllFormulas[4070008].Condition = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070008].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "亲爱的，你真给力 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070009] = {}
AllFormulas[4070009].Condition = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end

AllFormulas[4070010] = {}
AllFormulas[4070010].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070011] = {}
AllFormulas[4070011].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070011].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070012] = {}
AllFormulas[4070012].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070013] = {}
AllFormulas[4070013].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070014] = {}
AllFormulas[4070014].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4070014].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070015] = {}
AllFormulas[4070015].Condition = function(self)
  return true
end

AllFormulas[4070015].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人我升到了 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 级"
end
}}}
AllFormulas[4070016] = {}
AllFormulas[4070016].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070017] = {}
AllFormulas[4070017].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能#G"
end
, [3] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [4] = function(self)
  return "#Y好牛逼啊"
end
}}}
AllFormulas[4070018] = {}
AllFormulas[4070018].Condition = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end

AllFormulas[4070018].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " ， 名字 "
end
, [5] = function(self)
  return self.m_pCurEventParam[2]
end
, [6] = function(self)
  return " , hp = "
end
, [7] = function(self)
  return self.m_pCurEventParam[3]
end
, [8] = function(self)
  return ", curFull = "
end
, [9] = function(self)
  return self.m_pCurEventParam[4]
end
, [10] = function(self)
  return ", Full= "
end
, [11] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4070019] = {}
AllFormulas[4070019].Condition = function(self)
  return self.m_pCurEventParam[3] == 0
end

AllFormulas[4070019].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " ， 名字 "
end
, [5] = function(self)
  return self.m_pCurEventParam[2]
end
, [6] = function(self)
  return " , hp = "
end
, [7] = function(self)
  return self.m_pCurEventParam[3]
end
, [8] = function(self)
  return ", curFull = "
end
, [9] = function(self)
  return self.m_pCurEventParam[4]
end
, [10] = function(self)
  return ", Full= "
end
, [11] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4070021] = {}
AllFormulas[4070021].Condition = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end

AllFormulas[4070021].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "紫装你好 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070022] = {}
AllFormulas[4070022].Condition = function(self)
  return true
end

AllFormulas[4070022].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "恭喜主人升到 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 级"
end
}}}
AllFormulas[4070023] = {}
AllFormulas[4070023].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070023].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人， "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "的店 "
end
, [5] = function(self)
  return self.m_pCurEventParam[2]
end
, [6] = function(self)
  return " 不错嘛"
end
}}}
AllFormulas[4070024] = {}
AllFormulas[4070024].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070024].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
}}}
AllFormulas[4070025] = {}
AllFormulas[4070025].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070026] = {}
AllFormulas[4070026].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070027] = {}
AllFormulas[4070027].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070028] = {}
AllFormulas[4070028].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070029] = {}
AllFormulas[4070029].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4070029].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 好牛逼啊"
end
}}}
AllFormulas[4070030] = {}
AllFormulas[4070030].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end

AllFormulas[4070031] = {}
AllFormulas[4070031].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070031].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你完成了 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 任务 "
end
, [5] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4070032] = {}
AllFormulas[4070032].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070032].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人 Id 为 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 的 "
end
, [5] = function(self)
  return self.m_pCurEventParam[2]
end
, [6] = function(self)
  return " 找你"
end
}}}
AllFormulas[4070033] = {}
AllFormulas[4070033].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4070034] = {}
AllFormulas[4070034].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4070036] = {}
AllFormulas[4070036].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end

AllFormulas[4070037] = {}
AllFormulas[4070037].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end

AllFormulas[4070038] = {}
AllFormulas[4070038].Condition = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end

AllFormulas[4070039] = {}
AllFormulas[4070039].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end

AllFormulas[4070040] = {}
AllFormulas[4070040].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end

AllFormulas[4070041] = {}
AllFormulas[4070041].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end

AllFormulas[4070042] = {}
AllFormulas[4070042].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end

AllFormulas[4070043] = {}
AllFormulas[4070043].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end

AllFormulas[4070044] = {}
AllFormulas[4070044].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end

AllFormulas[4070045] = {}
AllFormulas[4070045].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end

AllFormulas[4070046] = {}
AllFormulas[4070046].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end

AllFormulas[4070047] = {}
AllFormulas[4070047].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end

AllFormulas[4070048] = {}
AllFormulas[4070048].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end

AllFormulas[4070049] = {}
AllFormulas[4070049].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end

AllFormulas[4070050] = {}
AllFormulas[4070050].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end

AllFormulas[4070051] = {}
AllFormulas[4070051].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end

AllFormulas[4070054] = {}
AllFormulas[4070054].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070055] = {}
AllFormulas[4070055].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070056] = {}
AllFormulas[4070056].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070057] = {}
AllFormulas[4070057].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070058] = {}
AllFormulas[4070058].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070100] = {}
AllFormulas[4070100].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070100].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，小鸡在此！#51"
end
}}}
AllFormulas[4070101] = {}
AllFormulas[4070101].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070101].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
}}}
AllFormulas[4070102] = {}
AllFormulas[4070102].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070102].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
}}}
AllFormulas[4070103] = {}
AllFormulas[4070103].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070103].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
}}}
AllFormulas[4070104] = {}
AllFormulas[4070104].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4070104].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，那个#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
}}}
AllFormulas[4070105] = {}
AllFormulas[4070105].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070105].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
}}}
AllFormulas[4070106] = {}
AllFormulas[4070106].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070106].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的徒弟#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
}}}
AllFormulas[4070107] = {}
AllFormulas[4070107].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070107].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
}}}
AllFormulas[4070108] = {}
AllFormulas[4070108].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4070108].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4070109] = {}
AllFormulas[4070109].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4070109].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4070110] = {}
AllFormulas[4070110].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4070110].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y来了，主人小心啊！#47"
end
}}}
AllFormulas[4070111] = {}
AllFormulas[4070111].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070111].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
}}}
AllFormulas[4070112] = {}
AllFormulas[4070112].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070112].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "吃我一扇，我要把你这个#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y扇跑！#78"
end
}}}
AllFormulas[4070113] = {}
AllFormulas[4070113].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070113].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
}}}
AllFormulas[4070114] = {}
AllFormulas[4070114].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070114].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，小鸡会想念你的……#14"
end
}}}
AllFormulas[4070115] = {}
AllFormulas[4070115].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4070115].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人要跟#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
}}}
AllFormulas[4070116] = {}
AllFormulas[4070116].Condition = function(self)
  return true
end

AllFormulas[4070116].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "小鸡我升到了#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end
}}}
AllFormulas[4070117] = {}
AllFormulas[4070117].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070117].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end
}}}
AllFormulas[4070118] = {}
AllFormulas[4070118].Condition = function(self)
  return true
end

AllFormulas[4070118].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好帅的一招#G"
end
, [3] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [4] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4070119] = {}
AllFormulas[4070119].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4070119].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[2]
end
, [4] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
}}}
AllFormulas[4070120] = {}
AllFormulas[4070120].Condition = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end

AllFormulas[4070120].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[2]
end
, [4] = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end
}}}
AllFormulas[4070121] = {}
AllFormulas[4070121].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070121].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
}}}
AllFormulas[4070122] = {}
AllFormulas[4070122].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4070122].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
}}}
AllFormulas[4070123] = {}
AllFormulas[4070123].Condition = function(self)
  return true
end

AllFormulas[4070123].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人升到#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
}}}
AllFormulas[4070124] = {}
AllFormulas[4070124].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070124].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
}}}
AllFormulas[4070125] = {}
AllFormulas[4070125].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070125].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
}}}
AllFormulas[4070126] = {}
AllFormulas[4070126].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070126].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
}}}
AllFormulas[4070127] = {}
AllFormulas[4070127].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070127].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
}}}
AllFormulas[4070128] = {}
AllFormulas[4070128].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070128].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
}}}
AllFormulas[4070129] = {}
AllFormulas[4070129].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4070129].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
}}}
AllFormulas[4070130] = {}
AllFormulas[4070130].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4070130].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的#G"
end
, [3] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [4] = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end
}}}
AllFormulas[4070131] = {}
AllFormulas[4070131].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end

AllFormulas[4070131].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人穿这么少，不会冻着么？#55"
end
}}}
AllFormulas[4070132] = {}
AllFormulas[4070132].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070132].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end
}}}
AllFormulas[4070133] = {}
AllFormulas[4070133].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070133].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end
}}}
AllFormulas[4070134] = {}
AllFormulas[4070134].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4070134].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end
}}}
AllFormulas[4070135] = {}
AllFormulas[4070135].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4070135].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end
}}}
AllFormulas[4070136] = {}
AllFormulas[4070136].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4070136].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人升的不错啊！#40"
end
}}}
AllFormulas[4070137] = {}
AllFormulas[4070137].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end

AllFormulas[4070137].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人升的好棒啊！#86"
end
}}}
AllFormulas[4070138] = {}
AllFormulas[4070138].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4070138].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end
}}}
AllFormulas[4070139] = {}
AllFormulas[4070139].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4070139].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end
}}}
AllFormulas[4070140] = {}
AllFormulas[4070140].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4070140].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你也好，叽！#62"
end
}}}
AllFormulas[4070141] = {}
AllFormulas[4070141].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4070141].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人做什么事都客客气气的！#56"
end
}}}
AllFormulas[4070142] = {}
AllFormulas[4070142].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4070142].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end
}}}
AllFormulas[4070143] = {}
AllFormulas[4070143].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end

AllFormulas[4070143].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end
}}}
AllFormulas[4070144] = {}
AllFormulas[4070144].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4070144].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的伞伞比我的大！#52"
end
}}}
AllFormulas[4070145] = {}
AllFormulas[4070145].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4070145].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人锄地我浇水！#59"
end
}}}
AllFormulas[4070146] = {}
AllFormulas[4070146].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4070146].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人浇水我锄地！#46"
end
}}}
AllFormulas[4070147] = {}
AllFormulas[4070147].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4070147].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
}}}
AllFormulas[4070148] = {}
AllFormulas[4070148].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4070148].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人抱抱！#17"
end
}}}
AllFormulas[4070149] = {}
AllFormulas[4070149].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4070149].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end
}}}
AllFormulas[4070150] = {}
AllFormulas[4070150].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4070150].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end
}}}
AllFormulas[4070151] = {}
AllFormulas[4070151].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4070151].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end
}}}
AllFormulas[4070152] = {}
AllFormulas[4070152].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4070152].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end
}}}
AllFormulas[4070153] = {}
AllFormulas[4070153].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070153].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
}}}
AllFormulas[4070154] = {}
AllFormulas[4070154].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070154].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end
}}}
AllFormulas[4070155] = {}
AllFormulas[4070155].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070155].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end
}}}
AllFormulas[4070156] = {}
AllFormulas[4070156].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070156].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end
}}}
AllFormulas[4070157] = {}
AllFormulas[4070157].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070157].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
}}}
AllFormulas[4070200] = {}
AllFormulas[4070200].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070200].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
}}}
AllFormulas[4070201] = {}
AllFormulas[4070201].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070201].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
}}}
AllFormulas[4070202] = {}
AllFormulas[4070202].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070202].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
}}}
AllFormulas[4070203] = {}
AllFormulas[4070203].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070203].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
}}}
AllFormulas[4070204] = {}
AllFormulas[4070204].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4070204].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，俺们一起杀了#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
}}}
AllFormulas[4070205] = {}
AllFormulas[4070205].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070205].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
}}}
AllFormulas[4070206] = {}
AllFormulas[4070206].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070206].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哟，师侄#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
}}}
AllFormulas[4070207] = {}
AllFormulas[4070207].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070207].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end
}}}
AllFormulas[4070208] = {}
AllFormulas[4070208].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4070208].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4070209] = {}
AllFormulas[4070209].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4070209].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4070210] = {}
AllFormulas[4070210].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4070210].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "杀啊！先灭了#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y！#140"
end
}}}
AllFormulas[4070211] = {}
AllFormulas[4070211].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070211].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
}}}
AllFormulas[4070212] = {}
AllFormulas[4070212].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070212].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
}}}
AllFormulas[4070213] = {}
AllFormulas[4070213].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070213].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
}}}
AllFormulas[4070214] = {}
AllFormulas[4070214].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070214].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
}}}
AllFormulas[4070215] = {}
AllFormulas[4070215].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4070215].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
}}}
AllFormulas[4070216] = {}
AllFormulas[4070216].Condition = function(self)
  return true
end

AllFormulas[4070216].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
}}}
AllFormulas[4070217] = {}
AllFormulas[4070217].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070217].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
}}}
AllFormulas[4070218] = {}
AllFormulas[4070218].Condition = function(self)
  return true
end

AllFormulas[4070218].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
}}}
AllFormulas[4070219] = {}
AllFormulas[4070219].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4070219].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "别管队里的#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[2]
end
, [4] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
}}}
AllFormulas[4070220] = {}
AllFormulas[4070220].Condition = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end

AllFormulas[4070220].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "队里的#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[2]
end
, [4] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
}}}
AllFormulas[4070221] = {}
AllFormulas[4070221].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070221].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
}}}
AllFormulas[4070222] = {}
AllFormulas[4070222].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4070222].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "有好东西，大哥快抢！#18"
end
}}}
AllFormulas[4070223] = {}
AllFormulas[4070223].Condition = function(self)
  return true
end

AllFormulas[4070223].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end
}}}
AllFormulas[4070224] = {}
AllFormulas[4070224].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070224].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end
}}}
AllFormulas[4070225] = {}
AllFormulas[4070225].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070225].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end
}}}
AllFormulas[4070226] = {}
AllFormulas[4070226].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070226].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end
}}}
AllFormulas[4070227] = {}
AllFormulas[4070227].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070227].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end
}}}
AllFormulas[4070228] = {}
AllFormulas[4070228].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070228].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end
}}}
AllFormulas[4070229] = {}
AllFormulas[4070229].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4070229].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "还偷啥，直接抢啊！#21"
end
}}}
AllFormulas[4070230] = {}
AllFormulas[4070230].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4070230].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end
}}}
AllFormulas[4070231] = {}
AllFormulas[4070231].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end

AllFormulas[4070231].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end
}}}
AllFormulas[4070232] = {}
AllFormulas[4070232].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070232].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end
}}}
AllFormulas[4070233] = {}
AllFormulas[4070233].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070233].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[2]
end
, [4] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
}}}
AllFormulas[4070234] = {}
AllFormulas[4070234].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4070234].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
}}}
AllFormulas[4070235] = {}
AllFormulas[4070235].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4070235].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
}}}
AllFormulas[4070236] = {}
AllFormulas[4070236].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4070236].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升的不行啊！#64"
end
}}}
AllFormulas[4070237] = {}
AllFormulas[4070237].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end

AllFormulas[4070237].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这样升才给力嘛！#145"
end
}}}
AllFormulas[4070238] = {}
AllFormulas[4070238].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4070238].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升成这样怎么杀人啊！#15"
end
}}}
AllFormulas[4070239] = {}
AllFormulas[4070239].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4070239].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
}}}
AllFormulas[4070240] = {}
AllFormulas[4070240].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4070240].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥好，大哥打怪去！#51"
end
}}}
AllFormulas[4070241] = {}
AllFormulas[4070241].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4070241].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你干吗呢？#2"
end
}}}
AllFormulas[4070242] = {}
AllFormulas[4070242].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4070242].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
}}}
AllFormulas[4070243] = {}
AllFormulas[4070243].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end

AllFormulas[4070243].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
}}}
AllFormulas[4070244] = {}
AllFormulas[4070244].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4070244].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
}}}
AllFormulas[4070245] = {}
AllFormulas[4070245].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4070245].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
}}}
AllFormulas[4070246] = {}
AllFormulas[4070246].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4070246].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "淹死他，狠狠的浇！#102"
end
}}}
AllFormulas[4070247] = {}
AllFormulas[4070247].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4070247].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "扫帚杀人不好使吧？#119"
end
}}}
AllFormulas[4070248] = {}
AllFormulas[4070248].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4070248].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
}}}
AllFormulas[4070249] = {}
AllFormulas[4070249].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4070249].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
}}}
AllFormulas[4070250] = {}
AllFormulas[4070250].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4070250].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
}}}
AllFormulas[4070251] = {}
AllFormulas[4070251].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4070251].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
}}}
AllFormulas[4070252] = {}
AllFormulas[4070252].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4070252].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070253] = {}
AllFormulas[4070253].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070253].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来1"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070254] = {}
AllFormulas[4070254].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070254].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来2"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070255] = {}
AllFormulas[4070255].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070255].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来3"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070256] = {}
AllFormulas[4070256].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070256].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你看我跑的多欢"
end
, [2] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4070257] = {}
AllFormulas[4070257].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070257].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "老师，你真给力 "
end
}}}
AllFormulas[4070300] = {}
AllFormulas[4070300].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070300].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070301] = {}
AllFormulas[4070301].Condition = function(self)
  return "徒弟，你真给力 "
end

AllFormulas[4070301].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070302] = {}
AllFormulas[4070302].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070302].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哥们，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070303] = {}
AllFormulas[4070303].Condition = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070303].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "亲爱的，你真给力 "
end
}}}
AllFormulas[4070304] = {}
AllFormulas[4070304].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070304].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
, [2] = function(self)
  return Rand(0.003)
end
, [3] = function(self)
  return Rand(0.003)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070305] = {}
AllFormulas[4070305].Condition = function(self)
  return "打死你  "
end

AllFormulas[4070305].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return Rand(0.003)
end
, [3] = function(self)
  return Rand(0.003)
end
, [4] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4070306] = {}
AllFormulas[4070306].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070306].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return true
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070307] = {}
AllFormulas[4070307].Condition = function(self)
  return "主人我升到了 "
end

AllFormulas[4070307].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 级"
end
}}}
AllFormulas[4070308] = {}
AllFormulas[4070308].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070308].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能#G"
end
}}}
AllFormulas[4070309] = {}
AllFormulas[4070309].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4070309].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y好牛逼啊"
end
, [2] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
}}}
AllFormulas[4070310] = {}
AllFormulas[4070310].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070310].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
, [3] = function(self)
  return " ， 名字 "
end
, [4] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4070311] = {}
AllFormulas[4070311].Condition = function(self)
  return " , hp = "
end

AllFormulas[4070311].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4070312] = {}
AllFormulas[4070312].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4070312].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
, [3] = function(self)
  return self.m_pCurEventParam[3] == 0
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070313] = {}
AllFormulas[4070313].Condition = function(self)
  return "主人，你的队友 "
end

AllFormulas[4070313].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " ， 名字 "
end
}}}
AllFormulas[4070314] = {}
AllFormulas[4070314].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070314].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " , hp = "
end
, [2] = function(self)
  return self.m_pCurEventParam[3]
end
}}}
AllFormulas[4070315] = {}
AllFormulas[4070315].Condition = function(self)
  return ", curFull = "
end

AllFormulas[4070315].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[4]
end
, [2] = function(self)
  return ", Full= "
end
, [3] = function(self)
  return self.m_pCurEventParam[5]
end
, [4] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4070316] = {}
AllFormulas[4070316].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070316].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "紫装你好 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070317] = {}
AllFormulas[4070317].Condition = function(self)
  return true
end

AllFormulas[4070317].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "恭喜主人升到 "
end
}}}
AllFormulas[4070318] = {}
AllFormulas[4070318].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4070318].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070319] = {}
AllFormulas[4070319].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070319].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人， "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return "的店 "
end
, [4] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4070320] = {}
AllFormulas[4070320].Condition = function(self)
  return " 不错嘛"
end

AllFormulas[4070320].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070321] = {}
AllFormulas[4070321].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070321].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070322] = {}
AllFormulas[4070322].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4070322].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 好牛逼啊"
end
}}}
AllFormulas[4070323] = {}
AllFormulas[4070323].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end

AllFormulas[4070323].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070324] = {}
AllFormulas[4070324].Condition = function(self)
  return "主人你完成了 "
end

AllFormulas[4070324].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 任务 "
end
}}}
AllFormulas[4070325] = {}
AllFormulas[4070325].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070325].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070326] = {}
AllFormulas[4070326].Condition = function(self)
  return "主人 Id 为 "
end

AllFormulas[4070326].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 的 "
end
}}}
AllFormulas[4070327] = {}
AllFormulas[4070327].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070327].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 找你"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4070328] = {}
AllFormulas[4070328].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4070328].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
}}}
AllFormulas[4070329] = {}
AllFormulas[4070329].Condition = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end

AllFormulas[4070329].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
}}}
AllFormulas[4070330] = {}
AllFormulas[4070330].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end

AllFormulas[4070330].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
}}}
AllFormulas[4070331] = {}
AllFormulas[4070331].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end

AllFormulas[4070331].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
}}}
AllFormulas[4070332] = {}
AllFormulas[4070332].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end

AllFormulas[4070332].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
}}}
AllFormulas[4070333] = {}
AllFormulas[4070333].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end

AllFormulas[4070333].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070334] = {}
AllFormulas[4070334].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070334].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070335] = {}
AllFormulas[4070335].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070335].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070336] = {}
AllFormulas[4070336].Condition = function(self)
  return "主人主人，小鸡在此！#51"
end

AllFormulas[4070336].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070337] = {}
AllFormulas[4070337].Condition = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end

AllFormulas[4070337].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070338] = {}
AllFormulas[4070338].Condition = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end

AllFormulas[4070338].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070339] = {}
AllFormulas[4070339].Condition = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end

AllFormulas[4070339].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070340] = {}
AllFormulas[4070340].Condition = function(self)
  return "主人主人，那个#G"
end

AllFormulas[4070340].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
}}}
AllFormulas[4070341] = {}
AllFormulas[4070341].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070341].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
}}}
AllFormulas[4070342] = {}
AllFormulas[4070342].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070342].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的徒弟#G"
end
}}}
AllFormulas[4070343] = {}
AllFormulas[4070343].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070343].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070344] = {}
AllFormulas[4070344].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070344].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4070345] = {}
AllFormulas[4070345].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070345].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4070346] = {}
AllFormulas[4070346].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070346].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4070347] = {}
AllFormulas[4070347].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070347].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070348] = {}
AllFormulas[4070348].Condition = function(self)
  return "#Y来了，主人小心啊！#47"
end

AllFormulas[4070348].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070349] = {}
AllFormulas[4070349].Condition = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end

AllFormulas[4070349].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070350] = {}
AllFormulas[4070350].Condition = function(self)
  return "吃我一扇，我要把你这个#G"
end

AllFormulas[4070350].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y扇跑！#78"
end
}}}
AllFormulas[4070351] = {}
AllFormulas[4070351].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070351].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
}}}
AllFormulas[4070352] = {}
AllFormulas[4070352].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070352].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，小鸡会想念你的……#14"
end
}}}
AllFormulas[4070353] = {}
AllFormulas[4070353].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4070353].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人要跟#G"
end
}}}
AllFormulas[4070354] = {}
AllFormulas[4070354].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070354].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4070355] = {}
AllFormulas[4070355].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070355].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡我升到了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070356] = {}
AllFormulas[4070356].Condition = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end

AllFormulas[4070356].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070357] = {}
AllFormulas[4070357].Condition = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end

AllFormulas[4070357].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070400] = {}
AllFormulas[4070400].Condition = function(self)
  return "好帅的一招#G"
end

AllFormulas[4070400].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4070401] = {}
AllFormulas[4070401].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4070401].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4070402] = {}
AllFormulas[4070402].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070402].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4070403] = {}
AllFormulas[4070403].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070403].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4070404] = {}
AllFormulas[4070404].Condition = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end

AllFormulas[4070404].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
, [4] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
}}}
AllFormulas[4070405] = {}
AllFormulas[4070405].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070405].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4070406] = {}
AllFormulas[4070406].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070406].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升到#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070407] = {}
AllFormulas[4070407].Condition = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end

AllFormulas[4070407].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070408] = {}
AllFormulas[4070408].Condition = function(self)
  return "#G"
end

AllFormulas[4070408].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070409] = {}
AllFormulas[4070409].Condition = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end

AllFormulas[4070409].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070410] = {}
AllFormulas[4070410].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070410].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
}}}
AllFormulas[4070411] = {}
AllFormulas[4070411].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4070411].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
}}}
AllFormulas[4070412] = {}
AllFormulas[4070412].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4070412].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的#G"
end
, [3] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [4] = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end
}}}
AllFormulas[4070413] = {}
AllFormulas[4070413].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end

AllFormulas[4070413].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人穿这么少，不会冻着么？#55"
end
}}}
AllFormulas[4070414] = {}
AllFormulas[4070414].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070414].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end
}}}
AllFormulas[4070415] = {}
AllFormulas[4070415].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070415].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end
, [3] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070416] = {}
AllFormulas[4070416].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4070416].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070417] = {}
AllFormulas[4070417].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4070417].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070418] = {}
AllFormulas[4070418].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4070418].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070419] = {}
AllFormulas[4070419].Condition = function(self)
  return "主人升的好棒啊！#86"
end

AllFormulas[4070419].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
}}}
AllFormulas[4070420] = {}
AllFormulas[4070420].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070420].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人你也好，叽！#62"
end
}}}
AllFormulas[4070421] = {}
AllFormulas[4070421].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4070421].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人做什么事都客客气气的！#56"
end
}}}
AllFormulas[4070422] = {}
AllFormulas[4070422].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4070422].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end
}}}
AllFormulas[4070423] = {}
AllFormulas[4070423].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end

AllFormulas[4070423].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end
}}}
AllFormulas[4070424] = {}
AllFormulas[4070424].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4070424].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的伞伞比我的大！#52"
end
}}}
AllFormulas[4070425] = {}
AllFormulas[4070425].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4070425].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人锄地我浇水！#59"
end
}}}
AllFormulas[4070426] = {}
AllFormulas[4070426].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4070426].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人浇水我锄地！#46"
end
}}}
AllFormulas[4070427] = {}
AllFormulas[4070427].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4070427].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
}}}
AllFormulas[4070428] = {}
AllFormulas[4070428].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4070428].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人抱抱！#17"
end
}}}
AllFormulas[4070429] = {}
AllFormulas[4070429].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4070429].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end
}}}
AllFormulas[4070430] = {}
AllFormulas[4070430].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4070430].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end
}}}
AllFormulas[4070431] = {}
AllFormulas[4070431].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4070431].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end
}}}
AllFormulas[4070432] = {}
AllFormulas[4070432].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4070432].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end
}}}
AllFormulas[4070433] = {}
AllFormulas[4070433].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070433].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
}}}
AllFormulas[4070434] = {}
AllFormulas[4070434].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070434].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end
}}}
AllFormulas[4070435] = {}
AllFormulas[4070435].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070435].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end
}}}
AllFormulas[4070436] = {}
AllFormulas[4070436].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070436].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end
}}}
AllFormulas[4070437] = {}
AllFormulas[4070437].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070437].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
}}}
AllFormulas[4070438] = {}
AllFormulas[4070438].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070438].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
}}}
AllFormulas[4070439] = {}
AllFormulas[4070439].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070439].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
}}}
AllFormulas[4070440] = {}
AllFormulas[4070440].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070440].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
}}}
AllFormulas[4070441] = {}
AllFormulas[4070441].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4070441].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
}}}
AllFormulas[4070442] = {}
AllFormulas[4070442].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4070442].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，俺们一起杀了#G"
end
}}}
AllFormulas[4070443] = {}
AllFormulas[4070443].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070443].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070444] = {}
AllFormulas[4070444].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070444].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070445] = {}
AllFormulas[4070445].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070445].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哟，师侄#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070446] = {}
AllFormulas[4070446].Condition = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end

AllFormulas[4070446].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070447] = {}
AllFormulas[4070447].Condition = function(self)
  return "大哥，#G"
end

AllFormulas[4070447].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end
}}}
AllFormulas[4070448] = {}
AllFormulas[4070448].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4070448].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4070449] = {}
AllFormulas[4070449].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4070449].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4070450] = {}
AllFormulas[4070450].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4070450].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "杀啊！先灭了#G"
end
}}}
AllFormulas[4070451] = {}
AllFormulas[4070451].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070451].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y！#140"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070452] = {}
AllFormulas[4070452].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070452].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070453] = {}
AllFormulas[4070453].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070453].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070454] = {}
AllFormulas[4070454].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070454].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070455] = {}
AllFormulas[4070455].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070455].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4070456] = {}
AllFormulas[4070456].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070456].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070457] = {}
AllFormulas[4070457].Condition = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end

AllFormulas[4070457].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070500] = {}
AllFormulas[4070500].Condition = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end

AllFormulas[4070500].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070501] = {}
AllFormulas[4070501].Condition = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end

AllFormulas[4070501].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070502] = {}
AllFormulas[4070502].Condition = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end

AllFormulas[4070502].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070503] = {}
AllFormulas[4070503].Condition = function(self)
  return "别管队里的#G"
end

AllFormulas[4070503].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
}}}
AllFormulas[4070504] = {}
AllFormulas[4070504].Condition = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end

AllFormulas[4070504].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "队里的#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[2]
end
, [4] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
}}}
AllFormulas[4070505] = {}
AllFormulas[4070505].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070505].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
, [3] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070506] = {}
AllFormulas[4070506].Condition = function(self)
  return "有好东西，大哥快抢！#18"
end

AllFormulas[4070506].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070507] = {}
AllFormulas[4070507].Condition = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end

AllFormulas[4070507].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end
, [4] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070508] = {}
AllFormulas[4070508].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070508].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070509] = {}
AllFormulas[4070509].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070509].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070510] = {}
AllFormulas[4070510].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070510].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end
}}}
AllFormulas[4070511] = {}
AllFormulas[4070511].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4070511].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "还偷啥，直接抢啊！#21"
end
}}}
AllFormulas[4070512] = {}
AllFormulas[4070512].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4070512].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070513] = {}
AllFormulas[4070513].Condition = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end

AllFormulas[4070513].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070514] = {}
AllFormulas[4070514].Condition = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end

AllFormulas[4070514].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070515] = {}
AllFormulas[4070515].Condition = function(self)
  return "这#G"
end

AllFormulas[4070515].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
, [3] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070516] = {}
AllFormulas[4070516].Condition = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end

AllFormulas[4070516].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070517] = {}
AllFormulas[4070517].Condition = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end

AllFormulas[4070517].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070518] = {}
AllFormulas[4070518].Condition = function(self)
  return "升的不行啊！#64"
end

AllFormulas[4070518].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070519] = {}
AllFormulas[4070519].Condition = function(self)
  return "这样升才给力嘛！#145"
end

AllFormulas[4070519].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "升成这样怎么杀人啊！#15"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
}}}
AllFormulas[4070520] = {}
AllFormulas[4070520].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070520].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
}}}
AllFormulas[4070521] = {}
AllFormulas[4070521].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070521].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥好，大哥打怪去！#51"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
}}}
AllFormulas[4070522] = {}
AllFormulas[4070522].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070522].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你干吗呢？#2"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
}}}
AllFormulas[4070523] = {}
AllFormulas[4070523].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070523].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
}}}
AllFormulas[4070524] = {}
AllFormulas[4070524].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070524].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
}}}
AllFormulas[4070525] = {}
AllFormulas[4070525].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070525].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
}}}
AllFormulas[4070526] = {}
AllFormulas[4070526].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070526].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
}}}
AllFormulas[4070527] = {}
AllFormulas[4070527].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070527].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "淹死他，狠狠的浇！#102"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
}}}
AllFormulas[4070528] = {}
AllFormulas[4070528].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070528].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "扫帚杀人不好使吧？#119"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
}}}
AllFormulas[4070529] = {}
AllFormulas[4070529].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070529].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
}}}
AllFormulas[4070530] = {}
AllFormulas[4070530].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070530].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
}}}
AllFormulas[4070531] = {}
AllFormulas[4070531].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070531].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
}}}
AllFormulas[4070532] = {}
AllFormulas[4070532].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070532].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
}}}
AllFormulas[4070533] = {}
AllFormulas[4070533].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070533].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "召唤出来1"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070534] = {}
AllFormulas[4070534].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070534].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来2"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070535] = {}
AllFormulas[4070535].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070535].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来3"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070536] = {}
AllFormulas[4070536].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070536].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你看我跑的多欢"
end
, [2] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4070537] = {}
AllFormulas[4070537].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070537].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "老师，你真给力 "
end
}}}
AllFormulas[4070538] = {}
AllFormulas[4070538].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070538].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070539] = {}
AllFormulas[4070539].Condition = function(self)
  return "徒弟，你真给力 "
end

AllFormulas[4070539].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070540] = {}
AllFormulas[4070540].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070540].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哥们，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070541] = {}
AllFormulas[4070541].Condition = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070541].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "亲爱的，你真给力 "
end
}}}
AllFormulas[4070542] = {}
AllFormulas[4070542].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070542].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070543] = {}
AllFormulas[4070543].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070543].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4070544] = {}
AllFormulas[4070544].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070544].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070545] = {}
AllFormulas[4070545].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4070545].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4070546] = {}
AllFormulas[4070546].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070546].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070547] = {}
AllFormulas[4070547].Condition = function(self)
  return "主人我升到了 "
end

AllFormulas[4070547].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 级"
end
}}}
AllFormulas[4070548] = {}
AllFormulas[4070548].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070548].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能#G"
end
}}}
AllFormulas[4070549] = {}
AllFormulas[4070549].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4070549].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y好牛逼啊"
end
, [2] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
}}}
AllFormulas[4070550] = {}
AllFormulas[4070550].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070550].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070551] = {}
AllFormulas[4070551].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4070551].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4070552] = {}
AllFormulas[4070552].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4070552].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4070553] = {}
AllFormulas[4070553].Condition = function(self)
  return ", Full= "
end

AllFormulas[4070553].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == 0
end
}}}
AllFormulas[4070554] = {}
AllFormulas[4070554].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070554].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070555] = {}
AllFormulas[4070555].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4070555].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4070556] = {}
AllFormulas[4070556].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4070556].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4070557] = {}
AllFormulas[4070557].Condition = function(self)
  return ", Full= "
end

AllFormulas[4070557].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4070600] = {}
AllFormulas[4070600].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070600].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "紫装你好 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070601] = {}
AllFormulas[4070601].Condition = function(self)
  return true
end

AllFormulas[4070601].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "恭喜主人升到 "
end
}}}
AllFormulas[4070602] = {}
AllFormulas[4070602].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4070602].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070603] = {}
AllFormulas[4070603].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070603].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人， "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070604] = {}
AllFormulas[4070604].Condition = function(self)
  return "的店 "
end

AllFormulas[4070604].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " 不错嘛"
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070605] = {}
AllFormulas[4070605].Condition = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end

AllFormulas[4070605].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070606] = {}
AllFormulas[4070606].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070606].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.1)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人，你的技能 "
end
}}}
AllFormulas[4070607] = {}
AllFormulas[4070607].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4070607].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 好牛逼啊"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
}}}
AllFormulas[4070608] = {}
AllFormulas[4070608].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070608].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你完成了 "
end
}}}
AllFormulas[4070609] = {}
AllFormulas[4070609].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4070609].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 任务 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4070610] = {}
AllFormulas[4070610].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070610].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人 Id 为 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 的 "
end
}}}
AllFormulas[4070611] = {}
AllFormulas[4070611].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070611].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 找你"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4070612] = {}
AllFormulas[4070612].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4070612].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
}}}
AllFormulas[4070613] = {}
AllFormulas[4070613].Condition = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end

AllFormulas[4070613].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end
}}}
AllFormulas[4070614] = {}
AllFormulas[4070614].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end

AllFormulas[4070614].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end
}}}
AllFormulas[4070615] = {}
AllFormulas[4070615].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end

AllFormulas[4070615].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end
}}}
AllFormulas[4070616] = {}
AllFormulas[4070616].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end

AllFormulas[4070616].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070617] = {}
AllFormulas[4070617].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070617].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070618] = {}
AllFormulas[4070618].Condition = function(self)
  return "主人主人，小鸡在此！#51"
end

AllFormulas[4070618].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070619] = {}
AllFormulas[4070619].Condition = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end

AllFormulas[4070619].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070620] = {}
AllFormulas[4070620].Condition = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end

AllFormulas[4070620].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070621] = {}
AllFormulas[4070621].Condition = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end

AllFormulas[4070621].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070622] = {}
AllFormulas[4070622].Condition = function(self)
  return "主人主人，那个#G"
end

AllFormulas[4070622].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
}}}
AllFormulas[4070623] = {}
AllFormulas[4070623].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070623].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
}}}
AllFormulas[4070624] = {}
AllFormulas[4070624].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070624].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的徒弟#G"
end
}}}
AllFormulas[4070625] = {}
AllFormulas[4070625].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070625].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070626] = {}
AllFormulas[4070626].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070626].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4070627] = {}
AllFormulas[4070627].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070627].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4070628] = {}
AllFormulas[4070628].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070628].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4070629] = {}
AllFormulas[4070629].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070629].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070630] = {}
AllFormulas[4070630].Condition = function(self)
  return "#Y来了，主人小心啊！#47"
end

AllFormulas[4070630].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070631] = {}
AllFormulas[4070631].Condition = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end

AllFormulas[4070631].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070632] = {}
AllFormulas[4070632].Condition = function(self)
  return "吃我一扇，我要把你这个#G"
end

AllFormulas[4070632].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y扇跑！#78"
end
}}}
AllFormulas[4070633] = {}
AllFormulas[4070633].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070633].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
}}}
AllFormulas[4070634] = {}
AllFormulas[4070634].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070634].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，小鸡会想念你的……#14"
end
}}}
AllFormulas[4070635] = {}
AllFormulas[4070635].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4070635].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人要跟#G"
end
}}}
AllFormulas[4070636] = {}
AllFormulas[4070636].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070636].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4070637] = {}
AllFormulas[4070637].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070637].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡我升到了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070638] = {}
AllFormulas[4070638].Condition = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end

AllFormulas[4070638].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070639] = {}
AllFormulas[4070639].Condition = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end

AllFormulas[4070639].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070640] = {}
AllFormulas[4070640].Condition = function(self)
  return "好帅的一招#G"
end

AllFormulas[4070640].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4070641] = {}
AllFormulas[4070641].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4070641].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4070642] = {}
AllFormulas[4070642].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070642].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4070643] = {}
AllFormulas[4070643].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070643].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4070644] = {}
AllFormulas[4070644].Condition = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end

AllFormulas[4070644].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070645] = {}
AllFormulas[4070645].Condition = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end

AllFormulas[4070645].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070646] = {}
AllFormulas[4070646].Condition = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end

AllFormulas[4070646].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070647] = {}
AllFormulas[4070647].Condition = function(self)
  return "主人升到#G"
end

AllFormulas[4070647].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
}}}
AllFormulas[4070648] = {}
AllFormulas[4070648].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070648].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4070649] = {}
AllFormulas[4070649].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070649].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070650] = {}
AllFormulas[4070650].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070650].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070651] = {}
AllFormulas[4070651].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070651].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070652] = {}
AllFormulas[4070652].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070652].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070653] = {}
AllFormulas[4070653].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070653].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
}}}
AllFormulas[4070654] = {}
AllFormulas[4070654].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070654].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4070655] = {}
AllFormulas[4070655].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070655].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4070656] = {}
AllFormulas[4070656].Condition = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end

AllFormulas[4070656].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070657] = {}
AllFormulas[4070657].Condition = function(self)
  return "主人穿这么少，不会冻着么？#55"
end

AllFormulas[4070657].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070700] = {}
AllFormulas[4070700].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4070700].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070701] = {}
AllFormulas[4070701].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4070701].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070702] = {}
AllFormulas[4070702].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4070702].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070703] = {}
AllFormulas[4070703].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4070703].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070704] = {}
AllFormulas[4070704].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4070704].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人升的好棒啊！#86"
end
, [4] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
}}}
AllFormulas[4070705] = {}
AllFormulas[4070705].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070705].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end
}}}
AllFormulas[4070706] = {}
AllFormulas[4070706].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4070706].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你也好，叽！#62"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070707] = {}
AllFormulas[4070707].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4070707].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070708] = {}
AllFormulas[4070708].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4070708].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070709] = {}
AllFormulas[4070709].Condition = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end

AllFormulas[4070709].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070710] = {}
AllFormulas[4070710].Condition = function(self)
  return "主人的伞伞比我的大！#52"
end

AllFormulas[4070710].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人锄地我浇水！#59"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
}}}
AllFormulas[4070711] = {}
AllFormulas[4070711].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070711].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人浇水我锄地！#46"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
}}}
AllFormulas[4070712] = {}
AllFormulas[4070712].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070712].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
}}}
AllFormulas[4070713] = {}
AllFormulas[4070713].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070713].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人抱抱！#17"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
}}}
AllFormulas[4070714] = {}
AllFormulas[4070714].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070714].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
}}}
AllFormulas[4070715] = {}
AllFormulas[4070715].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070715].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end
}}}
AllFormulas[4070716] = {}
AllFormulas[4070716].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4070716].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end
}}}
AllFormulas[4070717] = {}
AllFormulas[4070717].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070717].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070718] = {}
AllFormulas[4070718].Condition = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end

AllFormulas[4070718].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070719] = {}
AllFormulas[4070719].Condition = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end

AllFormulas[4070719].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070720] = {}
AllFormulas[4070720].Condition = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end

AllFormulas[4070720].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070721] = {}
AllFormulas[4070721].Condition = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end

AllFormulas[4070721].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070722] = {}
AllFormulas[4070722].Condition = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end

AllFormulas[4070722].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070723] = {}
AllFormulas[4070723].Condition = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end

AllFormulas[4070723].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070724] = {}
AllFormulas[4070724].Condition = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end

AllFormulas[4070724].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070725] = {}
AllFormulas[4070725].Condition = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end

AllFormulas[4070725].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070726] = {}
AllFormulas[4070726].Condition = function(self)
  return "大哥，俺们一起杀了#G"
end

AllFormulas[4070726].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
}}}
AllFormulas[4070727] = {}
AllFormulas[4070727].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070727].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
}}}
AllFormulas[4070728] = {}
AllFormulas[4070728].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070728].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哟，师侄#G"
end
}}}
AllFormulas[4070729] = {}
AllFormulas[4070729].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070729].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070730] = {}
AllFormulas[4070730].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070730].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070731] = {}
AllFormulas[4070731].Condition = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end

AllFormulas[4070731].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070732] = {}
AllFormulas[4070732].Condition = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end

AllFormulas[4070732].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070733] = {}
AllFormulas[4070733].Condition = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end

AllFormulas[4070733].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "杀啊！先灭了#G"
end
, [4] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070734] = {}
AllFormulas[4070734].Condition = function(self)
  return "#Y！#140"
end

AllFormulas[4070734].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070735] = {}
AllFormulas[4070735].Condition = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end

AllFormulas[4070735].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070736] = {}
AllFormulas[4070736].Condition = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end

AllFormulas[4070736].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070737] = {}
AllFormulas[4070737].Condition = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end

AllFormulas[4070737].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070738] = {}
AllFormulas[4070738].Condition = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end

AllFormulas[4070738].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070739] = {}
AllFormulas[4070739].Condition = function(self)
  return "#G"
end

AllFormulas[4070739].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
}}}
AllFormulas[4070740] = {}
AllFormulas[4070740].Condition = function(self)
  return true
end

AllFormulas[4070740].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
}}}
AllFormulas[4070741] = {}
AllFormulas[4070741].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070741].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
}}}
AllFormulas[4070742] = {}
AllFormulas[4070742].Condition = function(self)
  return true
end

AllFormulas[4070742].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
}}}
AllFormulas[4070743] = {}
AllFormulas[4070743].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4070743].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "别管队里的#G"
end
}}}
AllFormulas[4070744] = {}
AllFormulas[4070744].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070744].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4070745] = {}
AllFormulas[4070745].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070745].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4070746] = {}
AllFormulas[4070746].Condition = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end

AllFormulas[4070746].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070747] = {}
AllFormulas[4070747].Condition = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end

AllFormulas[4070747].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070748] = {}
AllFormulas[4070748].Condition = function(self)
  return "有好东西，大哥快抢！#18"
end

AllFormulas[4070748].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070749] = {}
AllFormulas[4070749].Condition = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end

AllFormulas[4070749].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070750] = {}
AllFormulas[4070750].Condition = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end

AllFormulas[4070750].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070751] = {}
AllFormulas[4070751].Condition = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end

AllFormulas[4070751].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070752] = {}
AllFormulas[4070752].Condition = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end

AllFormulas[4070752].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070753] = {}
AllFormulas[4070753].Condition = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end

AllFormulas[4070753].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070754] = {}
AllFormulas[4070754].Condition = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end

AllFormulas[4070754].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070755] = {}
AllFormulas[4070755].Condition = function(self)
  return "还偷啥，直接抢啊！#21"
end

AllFormulas[4070755].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070756] = {}
AllFormulas[4070756].Condition = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end

AllFormulas[4070756].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070757] = {}
AllFormulas[4070757].Condition = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end

AllFormulas[4070757].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070800] = {}
AllFormulas[4070800].Condition = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end

AllFormulas[4070800].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070801] = {}
AllFormulas[4070801].Condition = function(self)
  return "这#G"
end

AllFormulas[4070801].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
}}}
AllFormulas[4070802] = {}
AllFormulas[4070802].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4070802].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
}}}
AllFormulas[4070803] = {}
AllFormulas[4070803].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4070803].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
}}}
AllFormulas[4070804] = {}
AllFormulas[4070804].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4070804].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升的不行啊！#64"
end
, [3] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070805] = {}
AllFormulas[4070805].Condition = function(self)
  return "这样升才给力嘛！#145"
end

AllFormulas[4070805].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "升成这样怎么杀人啊！#15"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
}}}
AllFormulas[4070806] = {}
AllFormulas[4070806].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070806].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
}}}
AllFormulas[4070807] = {}
AllFormulas[4070807].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070807].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥好，大哥打怪去！#51"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
}}}
AllFormulas[4070808] = {}
AllFormulas[4070808].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070808].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你干吗呢？#2"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
}}}
AllFormulas[4070809] = {}
AllFormulas[4070809].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070809].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
}}}
AllFormulas[4070810] = {}
AllFormulas[4070810].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070810].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
}}}
AllFormulas[4070811] = {}
AllFormulas[4070811].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4070811].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
}}}
AllFormulas[4070812] = {}
AllFormulas[4070812].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4070812].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "淹死他，狠狠的浇！#102"
end
}}}
AllFormulas[4070813] = {}
AllFormulas[4070813].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4070813].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "扫帚杀人不好使吧？#119"
end
}}}
AllFormulas[4070814] = {}
AllFormulas[4070814].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4070814].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
}}}
AllFormulas[4070815] = {}
AllFormulas[4070815].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4070815].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070816] = {}
AllFormulas[4070816].Condition = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end

AllFormulas[4070816].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070817] = {}
AllFormulas[4070817].Condition = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end

AllFormulas[4070817].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070818] = {}
AllFormulas[4070818].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070818].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来1"
end
}}}
AllFormulas[4070819] = {}
AllFormulas[4070819].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070819].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来2"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070820] = {}
AllFormulas[4070820].Condition = function(self)
  return "召唤出来3"
end

AllFormulas[4070820].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人你看我跑的多欢"
end
, [4] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4070821] = {}
AllFormulas[4070821].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070821].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "老师，你真给力 "
end
}}}
AllFormulas[4070822] = {}
AllFormulas[4070822].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070822].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070823] = {}
AllFormulas[4070823].Condition = function(self)
  return "徒弟，你真给力 "
end

AllFormulas[4070823].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070824] = {}
AllFormulas[4070824].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070824].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哥们，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070825] = {}
AllFormulas[4070825].Condition = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4070825].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "亲爱的，你真给力 "
end
}}}
AllFormulas[4070826] = {}
AllFormulas[4070826].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070826].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070827] = {}
AllFormulas[4070827].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070827].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4070828] = {}
AllFormulas[4070828].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070828].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4070829] = {}
AllFormulas[4070829].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4070829].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4070830] = {}
AllFormulas[4070830].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070830].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070831] = {}
AllFormulas[4070831].Condition = function(self)
  return "主人我升到了 "
end

AllFormulas[4070831].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 级"
end
}}}
AllFormulas[4070832] = {}
AllFormulas[4070832].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070832].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能#G"
end
}}}
AllFormulas[4070833] = {}
AllFormulas[4070833].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4070833].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y好牛逼啊"
end
, [2] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
}}}
AllFormulas[4070834] = {}
AllFormulas[4070834].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070834].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070835] = {}
AllFormulas[4070835].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4070835].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4070836] = {}
AllFormulas[4070836].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4070836].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4070837] = {}
AllFormulas[4070837].Condition = function(self)
  return ", Full= "
end

AllFormulas[4070837].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == 0
end
}}}
AllFormulas[4070838] = {}
AllFormulas[4070838].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070838].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070839] = {}
AllFormulas[4070839].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4070839].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4070840] = {}
AllFormulas[4070840].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4070840].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4070841] = {}
AllFormulas[4070841].Condition = function(self)
  return ", Full= "
end

AllFormulas[4070841].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4070842] = {}
AllFormulas[4070842].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070842].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "紫装你好 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070843] = {}
AllFormulas[4070843].Condition = function(self)
  return true
end

AllFormulas[4070843].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "恭喜主人升到 "
end
}}}
AllFormulas[4070844] = {}
AllFormulas[4070844].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4070844].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070845] = {}
AllFormulas[4070845].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070845].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人， "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070846] = {}
AllFormulas[4070846].Condition = function(self)
  return "的店 "
end

AllFormulas[4070846].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " 不错嘛"
end
}}}
AllFormulas[4070847] = {}
AllFormulas[4070847].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070847].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
}}}
AllFormulas[4070848] = {}
AllFormulas[4070848].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4070848].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070849] = {}
AllFormulas[4070849].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070849].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070850] = {}
AllFormulas[4070850].Condition = function(self)
  return "主人，你的技能 "
end

AllFormulas[4070850].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 好牛逼啊"
end
}}}
AllFormulas[4070851] = {}
AllFormulas[4070851].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end

AllFormulas[4070851].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070852] = {}
AllFormulas[4070852].Condition = function(self)
  return "主人你完成了 "
end

AllFormulas[4070852].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 任务 "
end
}}}
AllFormulas[4070853] = {}
AllFormulas[4070853].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070853].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070854] = {}
AllFormulas[4070854].Condition = function(self)
  return "主人 Id 为 "
end

AllFormulas[4070854].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 的 "
end
}}}
AllFormulas[4070855] = {}
AllFormulas[4070855].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070855].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 找你"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4070856] = {}
AllFormulas[4070856].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4070856].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
}}}
AllFormulas[4070857] = {}
AllFormulas[4070857].Condition = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end

AllFormulas[4070857].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
}}}
AllFormulas[4070900] = {}
AllFormulas[4070900].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end

AllFormulas[4070900].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
}}}
AllFormulas[4070901] = {}
AllFormulas[4070901].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end

AllFormulas[4070901].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
}}}
AllFormulas[4070902] = {}
AllFormulas[4070902].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end

AllFormulas[4070902].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
}}}
AllFormulas[4070903] = {}
AllFormulas[4070903].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end

AllFormulas[4070903].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070904] = {}
AllFormulas[4070904].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070904].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070905] = {}
AllFormulas[4070905].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070905].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，小鸡在此！#51"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4070906] = {}
AllFormulas[4070906].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070906].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4070907] = {}
AllFormulas[4070907].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070907].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4070908] = {}
AllFormulas[4070908].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070908].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
, [2] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4070909] = {}
AllFormulas[4070909].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070909].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，那个#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070910] = {}
AllFormulas[4070910].Condition = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end

AllFormulas[4070910].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
, [4] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4070911] = {}
AllFormulas[4070911].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070911].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的徒弟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4070912] = {}
AllFormulas[4070912].Condition = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end

AllFormulas[4070912].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4070913] = {}
AllFormulas[4070913].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070913].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4070914] = {}
AllFormulas[4070914].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070914].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4070915] = {}
AllFormulas[4070915].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070915].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return "#Y来了，主人小心啊！#47"
end
, [4] = function(self)
  return Rand(0.003)
end
}}, 
[2] = {[1] = 10, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
}}}
AllFormulas[4070916] = {}
AllFormulas[4070916].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4070916].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "吃我一扇，我要把你这个#G"
end
}}}
AllFormulas[4070917] = {}
AllFormulas[4070917].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070917].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y扇跑！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
}}, 
[3] = {[1] = 8, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070918] = {}
AllFormulas[4070918].Condition = function(self)
  return "主人，小鸡会想念你的……#14"
end

AllFormulas[4070918].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function(self)
  return "主人要跟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}, 
[3] = {[1] = 5, 
[2] = {[1] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4070919] = {}
AllFormulas[4070919].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070919].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡我升到了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4070920] = {}
AllFormulas[4070920].Condition = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end

AllFormulas[4070920].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070921] = {}
AllFormulas[4070921].Condition = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end

AllFormulas[4070921].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function(self)
  return "好帅的一招#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4070922] = {}
AllFormulas[4070922].Condition = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end

AllFormulas[4070922].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070923] = {}
AllFormulas[4070923].Condition = function(self)
  return "主人，你的队友#G"
end

AllFormulas[4070923].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
}}}
AllFormulas[4070924] = {}
AllFormulas[4070924].Condition = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end

AllFormulas[4070924].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4070925] = {}
AllFormulas[4070925].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4070925].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end
, [2] = function(self)
  return Rand(0.003)
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
}}}
AllFormulas[4070926] = {}
AllFormulas[4070926].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4070926].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
}}, 
[2] = {[1] = 2, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070927] = {}
AllFormulas[4070927].Condition = function(self)
  return "主人升到#G"
end

AllFormulas[4070927].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
}}}
AllFormulas[4070928] = {}
AllFormulas[4070928].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4070928].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4070929] = {}
AllFormulas[4070929].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4070929].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4070930] = {}
AllFormulas[4070930].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070930].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070931] = {}
AllFormulas[4070931].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070931].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070932] = {}
AllFormulas[4070932].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070932].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4070933] = {}
AllFormulas[4070933].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070933].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
}}}
AllFormulas[4070934] = {}
AllFormulas[4070934].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070934].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4070935] = {}
AllFormulas[4070935].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070935].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4070936] = {}
AllFormulas[4070936].Condition = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end

AllFormulas[4070936].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070937] = {}
AllFormulas[4070937].Condition = function(self)
  return "主人穿这么少，不会冻着么？#55"
end

AllFormulas[4070937].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070938] = {}
AllFormulas[4070938].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4070938].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070939] = {}
AllFormulas[4070939].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4070939].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070940] = {}
AllFormulas[4070940].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4070940].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070941] = {}
AllFormulas[4070941].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4070941].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070942] = {}
AllFormulas[4070942].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4070942].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070943] = {}
AllFormulas[4070943].Condition = function(self)
  return "主人升的好棒啊！#86"
end

AllFormulas[4070943].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070944] = {}
AllFormulas[4070944].Condition = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end

AllFormulas[4070944].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070945] = {}
AllFormulas[4070945].Condition = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end

AllFormulas[4070945].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070946] = {}
AllFormulas[4070946].Condition = function(self)
  return "主人你也好，叽！#62"
end

AllFormulas[4070946].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070947] = {}
AllFormulas[4070947].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4070947].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070948] = {}
AllFormulas[4070948].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4070948].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070949] = {}
AllFormulas[4070949].Condition = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end

AllFormulas[4070949].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070950] = {}
AllFormulas[4070950].Condition = function(self)
  return "主人的伞伞比我的大！#52"
end

AllFormulas[4070950].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070951] = {}
AllFormulas[4070951].Condition = function(self)
  return "主人锄地我浇水！#59"
end

AllFormulas[4070951].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070952] = {}
AllFormulas[4070952].Condition = function(self)
  return "主人浇水我锄地！#46"
end

AllFormulas[4070952].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070953] = {}
AllFormulas[4070953].Condition = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end

AllFormulas[4070953].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070954] = {}
AllFormulas[4070954].Condition = function(self)
  return "主人抱抱！#17"
end

AllFormulas[4070954].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070955] = {}
AllFormulas[4070955].Condition = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end

AllFormulas[4070955].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4070956] = {}
AllFormulas[4070956].Condition = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end

AllFormulas[4070956].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
}}}
AllFormulas[4070957] = {}
AllFormulas[4070957].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4070957].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071000] = {}
AllFormulas[4071000].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071000].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071001] = {}
AllFormulas[4071001].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071001].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071002] = {}
AllFormulas[4071002].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071002].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071003] = {}
AllFormulas[4071003].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071003].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071004] = {}
AllFormulas[4071004].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071004].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
}}}
AllFormulas[4071005] = {}
AllFormulas[4071005].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4071005].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
, [3] = function(self)
  return Rand(0.0001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071006] = {}
AllFormulas[4071006].Condition = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end

AllFormulas[4071006].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071007] = {}
AllFormulas[4071007].Condition = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end

AllFormulas[4071007].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071008] = {}
AllFormulas[4071008].Condition = function(self)
  return "大哥，俺们一起杀了#G"
end

AllFormulas[4071008].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
}}}
AllFormulas[4071009] = {}
AllFormulas[4071009].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071009].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
}}}
AllFormulas[4071010] = {}
AllFormulas[4071010].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071010].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哟，师侄#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
}}}
AllFormulas[4071011] = {}
AllFormulas[4071011].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071011].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，#G"
end
}}}
AllFormulas[4071012] = {}
AllFormulas[4071012].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071012].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4071013] = {}
AllFormulas[4071013].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071013].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4071014] = {}
AllFormulas[4071014].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071014].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4071015] = {}
AllFormulas[4071015].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071015].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "杀啊！先灭了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return "#Y！#140"
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071016] = {}
AllFormulas[4071016].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071016].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071017] = {}
AllFormulas[4071017].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071017].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071018] = {}
AllFormulas[4071018].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071018].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071019] = {}
AllFormulas[4071019].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071019].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "#G"
end
}}}
AllFormulas[4071020] = {}
AllFormulas[4071020].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071020].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
, [2] = function(self)
  return true
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
}}}
AllFormulas[4071021] = {}
AllFormulas[4071021].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071021].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
}}}
AllFormulas[4071022] = {}
AllFormulas[4071022].Condition = function(self)
  return true
end

AllFormulas[4071022].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
}}}
AllFormulas[4071023] = {}
AllFormulas[4071023].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4071023].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "别管队里的#G"
end
}}}
AllFormulas[4071024] = {}
AllFormulas[4071024].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071024].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4071025] = {}
AllFormulas[4071025].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071025].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071026] = {}
AllFormulas[4071026].Condition = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end

AllFormulas[4071026].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071027] = {}
AllFormulas[4071027].Condition = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end

AllFormulas[4071027].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071028] = {}
AllFormulas[4071028].Condition = function(self)
  return "有好东西，大哥快抢！#18"
end

AllFormulas[4071028].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071029] = {}
AllFormulas[4071029].Condition = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end

AllFormulas[4071029].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071030] = {}
AllFormulas[4071030].Condition = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end

AllFormulas[4071030].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071031] = {}
AllFormulas[4071031].Condition = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end

AllFormulas[4071031].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071032] = {}
AllFormulas[4071032].Condition = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end

AllFormulas[4071032].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071033] = {}
AllFormulas[4071033].Condition = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end

AllFormulas[4071033].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071034] = {}
AllFormulas[4071034].Condition = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end

AllFormulas[4071034].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071035] = {}
AllFormulas[4071035].Condition = function(self)
  return "还偷啥，直接抢啊！#21"
end

AllFormulas[4071035].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071036] = {}
AllFormulas[4071036].Condition = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end

AllFormulas[4071036].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071037] = {}
AllFormulas[4071037].Condition = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end

AllFormulas[4071037].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071038] = {}
AllFormulas[4071038].Condition = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end

AllFormulas[4071038].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071039] = {}
AllFormulas[4071039].Condition = function(self)
  return "这#G"
end

AllFormulas[4071039].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
}}}
AllFormulas[4071040] = {}
AllFormulas[4071040].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4071040].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
}}}
AllFormulas[4071041] = {}
AllFormulas[4071041].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4071041].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
}}}
AllFormulas[4071042] = {}
AllFormulas[4071042].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4071042].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升的不行啊！#64"
end
}}}
AllFormulas[4071043] = {}
AllFormulas[4071043].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end

AllFormulas[4071043].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这样升才给力嘛！#145"
end
}}}
AllFormulas[4071044] = {}
AllFormulas[4071044].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4071044].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升成这样怎么杀人啊！#15"
end
}}}
AllFormulas[4071045] = {}
AllFormulas[4071045].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4071045].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
}}}
AllFormulas[4071046] = {}
AllFormulas[4071046].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4071046].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥好，大哥打怪去！#51"
end
}}}
AllFormulas[4071047] = {}
AllFormulas[4071047].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4071047].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你干吗呢？#2"
end
}}}
AllFormulas[4071048] = {}
AllFormulas[4071048].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4071048].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
}}}
AllFormulas[4071049] = {}
AllFormulas[4071049].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end

AllFormulas[4071049].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
}}}
AllFormulas[4071050] = {}
AllFormulas[4071050].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4071050].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
}}}
AllFormulas[4071051] = {}
AllFormulas[4071051].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4071051].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
}}}
AllFormulas[4071052] = {}
AllFormulas[4071052].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4071052].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "淹死他，狠狠的浇！#102"
end
}}}
AllFormulas[4071053] = {}
AllFormulas[4071053].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4071053].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "扫帚杀人不好使吧？#119"
end
}}}
AllFormulas[4071054] = {}
AllFormulas[4071054].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4071054].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
}}}
AllFormulas[4071055] = {}
AllFormulas[4071055].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4071055].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
}}}
AllFormulas[4071056] = {}
AllFormulas[4071056].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4071056].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
}}}
AllFormulas[4071057] = {}
AllFormulas[4071057].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4071057].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
}}}
AllFormulas[4071100] = {}
AllFormulas[4071100].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4071100].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071101] = {}
AllFormulas[4071101].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071101].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来1"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071102] = {}
AllFormulas[4071102].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071102].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来2"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071103] = {}
AllFormulas[4071103].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071103].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来3"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071104] = {}
AllFormulas[4071104].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071104].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你看我跑的多欢"
end
, [2] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [3] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071105] = {}
AllFormulas[4071105].Condition = function(self)
  return "老师，你真给力 "
end

AllFormulas[4071105].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071106] = {}
AllFormulas[4071106].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071106].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "徒弟，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071107] = {}
AllFormulas[4071107].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071107].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哥们，你真给力 "
end
}}}
AllFormulas[4071108] = {}
AllFormulas[4071108].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071108].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071109] = {}
AllFormulas[4071109].Condition = function(self)
  return "亲爱的，你真给力 "
end

AllFormulas[4071109].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
}}}
AllFormulas[4071110] = {}
AllFormulas[4071110].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071110].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "打死你  "
end
, [4] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071111] = {}
AllFormulas[4071111].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071111].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4071112] = {}
AllFormulas[4071112].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071112].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071113] = {}
AllFormulas[4071113].Condition = function(self)
  return true
end

AllFormulas[4071113].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人我升到了 "
end
}}}
AllFormulas[4071114] = {}
AllFormulas[4071114].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071114].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071115] = {}
AllFormulas[4071115].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071115].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的技能#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [3] = function(self)
  return "#Y好牛逼啊"
end
, [4] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
}}}
AllFormulas[4071116] = {}
AllFormulas[4071116].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071116].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071117] = {}
AllFormulas[4071117].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4071117].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4071118] = {}
AllFormulas[4071118].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4071118].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4071119] = {}
AllFormulas[4071119].Condition = function(self)
  return ", Full= "
end

AllFormulas[4071119].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == 0
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人，你的队友 "
end
}}}
AllFormulas[4071120] = {}
AllFormulas[4071120].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071120].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " ， 名字 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071121] = {}
AllFormulas[4071121].Condition = function(self)
  return " , hp = "
end

AllFormulas[4071121].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4071122] = {}
AllFormulas[4071122].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4071122].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4071123] = {}
AllFormulas[4071123].Condition = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end

AllFormulas[4071123].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "紫装你好 "
end
}}}
AllFormulas[4071124] = {}
AllFormulas[4071124].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071124].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071125] = {}
AllFormulas[4071125].Condition = function(self)
  return "恭喜主人升到 "
end

AllFormulas[4071125].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 级"
end
}}}
AllFormulas[4071126] = {}
AllFormulas[4071126].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071126].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人， "
end
}}}
AllFormulas[4071127] = {}
AllFormulas[4071127].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071127].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "的店 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071128] = {}
AllFormulas[4071128].Condition = function(self)
  return " 不错嘛"
end

AllFormulas[4071128].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071129] = {}
AllFormulas[4071129].Condition = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end

AllFormulas[4071129].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071130] = {}
AllFormulas[4071130].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071130].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4071131] = {}
AllFormulas[4071131].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071131].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的技能 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071132] = {}
AllFormulas[4071132].Condition = function(self)
  return " 好牛逼啊"
end

AllFormulas[4071132].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071133] = {}
AllFormulas[4071133].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071133].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你完成了 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071134] = {}
AllFormulas[4071134].Condition = function(self)
  return " 任务 "
end

AllFormulas[4071134].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071135] = {}
AllFormulas[4071135].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071135].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人 Id 为 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071136] = {}
AllFormulas[4071136].Condition = function(self)
  return " 的 "
end

AllFormulas[4071136].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " 找你"
end
}}}
AllFormulas[4071137] = {}
AllFormulas[4071137].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4071137].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end
}}}
AllFormulas[4071138] = {}
AllFormulas[4071138].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end

AllFormulas[4071138].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end
}}}
AllFormulas[4071139] = {}
AllFormulas[4071139].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end

AllFormulas[4071139].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end
}}}
AllFormulas[4071140] = {}
AllFormulas[4071140].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end

AllFormulas[4071140].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end
}}}
AllFormulas[4071141] = {}
AllFormulas[4071141].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end

AllFormulas[4071141].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
}}}
AllFormulas[4071142] = {}
AllFormulas[4071142].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end

AllFormulas[4071142].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end
}}}
AllFormulas[4071143] = {}
AllFormulas[4071143].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071143].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071144] = {}
AllFormulas[4071144].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071144].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071145] = {}
AllFormulas[4071145].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071145].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，小鸡在此！#51"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071146] = {}
AllFormulas[4071146].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071146].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071147] = {}
AllFormulas[4071147].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071147].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071148] = {}
AllFormulas[4071148].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071148].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
, [2] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4071149] = {}
AllFormulas[4071149].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071149].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，那个#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071150] = {}
AllFormulas[4071150].Condition = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end

AllFormulas[4071150].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071151] = {}
AllFormulas[4071151].Condition = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end

AllFormulas[4071151].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071152] = {}
AllFormulas[4071152].Condition = function(self)
  return "主人，你的徒弟#G"
end

AllFormulas[4071152].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
}}}
AllFormulas[4071153] = {}
AllFormulas[4071153].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071153].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
}}}
AllFormulas[4071154] = {}
AllFormulas[4071154].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4071154].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4071155] = {}
AllFormulas[4071155].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4071155].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4071156] = {}
AllFormulas[4071156].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4071156].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4071157] = {}
AllFormulas[4071157].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071157].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，主人小心啊！#47"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071200] = {}
AllFormulas[4071200].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071200].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071201] = {}
AllFormulas[4071201].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071201].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "吃我一扇，我要把你这个#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071202] = {}
AllFormulas[4071202].Condition = function(self)
  return "#Y扇跑！#78"
end

AllFormulas[4071202].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071203] = {}
AllFormulas[4071203].Condition = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end

AllFormulas[4071203].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071204] = {}
AllFormulas[4071204].Condition = function(self)
  return "主人，小鸡会想念你的……#14"
end

AllFormulas[4071204].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071205] = {}
AllFormulas[4071205].Condition = function(self)
  return "主人要跟#G"
end

AllFormulas[4071205].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
}}}
AllFormulas[4071206] = {}
AllFormulas[4071206].Condition = function(self)
  return true
end

AllFormulas[4071206].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "小鸡我升到了#G"
end
}}}
AllFormulas[4071207] = {}
AllFormulas[4071207].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071207].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071208] = {}
AllFormulas[4071208].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071208].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071209] = {}
AllFormulas[4071209].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071209].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "好帅的一招#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4071210] = {}
AllFormulas[4071210].Condition = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end

AllFormulas[4071210].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人，你的队友#G"
end
, [4] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071211] = {}
AllFormulas[4071211].Condition = function(self)
  return "#Y受伤了，好可怜呢。#14"
end

AllFormulas[4071211].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071212] = {}
AllFormulas[4071212].Condition = function(self)
  return "主人，你的队友#G"
end

AllFormulas[4071212].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end
}}}
AllFormulas[4071213] = {}
AllFormulas[4071213].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071213].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
}}}
AllFormulas[4071214] = {}
AllFormulas[4071214].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4071214].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
}}}
AllFormulas[4071215] = {}
AllFormulas[4071215].Condition = function(self)
  return true
end

AllFormulas[4071215].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人升到#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
}}}
AllFormulas[4071216] = {}
AllFormulas[4071216].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071216].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4071217] = {}
AllFormulas[4071217].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071217].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071218] = {}
AllFormulas[4071218].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071218].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071219] = {}
AllFormulas[4071219].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071219].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071220] = {}
AllFormulas[4071220].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071220].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071221] = {}
AllFormulas[4071221].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071221].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
}}}
AllFormulas[4071222] = {}
AllFormulas[4071222].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071222].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4071223] = {}
AllFormulas[4071223].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071223].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4071224] = {}
AllFormulas[4071224].Condition = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end

AllFormulas[4071224].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071225] = {}
AllFormulas[4071225].Condition = function(self)
  return "主人穿这么少，不会冻着么？#55"
end

AllFormulas[4071225].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071226] = {}
AllFormulas[4071226].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4071226].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071227] = {}
AllFormulas[4071227].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4071227].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071228] = {}
AllFormulas[4071228].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4071228].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071229] = {}
AllFormulas[4071229].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4071229].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071230] = {}
AllFormulas[4071230].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4071230].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071231] = {}
AllFormulas[4071231].Condition = function(self)
  return "主人升的好棒啊！#86"
end

AllFormulas[4071231].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071232] = {}
AllFormulas[4071232].Condition = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end

AllFormulas[4071232].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071233] = {}
AllFormulas[4071233].Condition = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end

AllFormulas[4071233].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071234] = {}
AllFormulas[4071234].Condition = function(self)
  return "主人你也好，叽！#62"
end

AllFormulas[4071234].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071235] = {}
AllFormulas[4071235].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4071235].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071236] = {}
AllFormulas[4071236].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4071236].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071237] = {}
AllFormulas[4071237].Condition = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end

AllFormulas[4071237].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071238] = {}
AllFormulas[4071238].Condition = function(self)
  return "主人的伞伞比我的大！#52"
end

AllFormulas[4071238].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071239] = {}
AllFormulas[4071239].Condition = function(self)
  return "主人锄地我浇水！#59"
end

AllFormulas[4071239].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071240] = {}
AllFormulas[4071240].Condition = function(self)
  return "主人浇水我锄地！#46"
end

AllFormulas[4071240].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071241] = {}
AllFormulas[4071241].Condition = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end

AllFormulas[4071241].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071242] = {}
AllFormulas[4071242].Condition = function(self)
  return "主人抱抱！#17"
end

AllFormulas[4071242].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071243] = {}
AllFormulas[4071243].Condition = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end

AllFormulas[4071243].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071244] = {}
AllFormulas[4071244].Condition = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end

AllFormulas[4071244].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071245] = {}
AllFormulas[4071245].Condition = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end

AllFormulas[4071245].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071246] = {}
AllFormulas[4071246].Condition = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end

AllFormulas[4071246].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071247] = {}
AllFormulas[4071247].Condition = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end

AllFormulas[4071247].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071248] = {}
AllFormulas[4071248].Condition = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end

AllFormulas[4071248].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071249] = {}
AllFormulas[4071249].Condition = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end

AllFormulas[4071249].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071250] = {}
AllFormulas[4071250].Condition = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end

AllFormulas[4071250].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071251] = {}
AllFormulas[4071251].Condition = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end

AllFormulas[4071251].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071252] = {}
AllFormulas[4071252].Condition = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end

AllFormulas[4071252].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071253] = {}
AllFormulas[4071253].Condition = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end

AllFormulas[4071253].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071254] = {}
AllFormulas[4071254].Condition = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end

AllFormulas[4071254].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071255] = {}
AllFormulas[4071255].Condition = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end

AllFormulas[4071255].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071256] = {}
AllFormulas[4071256].Condition = function(self)
  return "大哥，俺们一起杀了#G"
end

AllFormulas[4071256].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
}}}
AllFormulas[4071257] = {}
AllFormulas[4071257].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071257].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
}}}
AllFormulas[4071300] = {}
AllFormulas[4071300].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071300].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哟，师侄#G"
end
}}}
AllFormulas[4071301] = {}
AllFormulas[4071301].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071301].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071302] = {}
AllFormulas[4071302].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071302].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071303] = {}
AllFormulas[4071303].Condition = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end

AllFormulas[4071303].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071304] = {}
AllFormulas[4071304].Condition = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end

AllFormulas[4071304].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [4] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4071305] = {}
AllFormulas[4071305].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071305].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "杀啊！先灭了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071306] = {}
AllFormulas[4071306].Condition = function(self)
  return "#Y！#140"
end

AllFormulas[4071306].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071307] = {}
AllFormulas[4071307].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071307].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071308] = {}
AllFormulas[4071308].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071308].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071309] = {}
AllFormulas[4071309].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071309].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4071310] = {}
AllFormulas[4071310].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071310].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
, [4] = function(self)
  return true
end
}}}
AllFormulas[4071311] = {}
AllFormulas[4071311].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071311].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071312] = {}
AllFormulas[4071312].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071312].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071313] = {}
AllFormulas[4071313].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071313].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
}}}
AllFormulas[4071314] = {}
AllFormulas[4071314].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071314].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "别管队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071315] = {}
AllFormulas[4071315].Condition = function(self)
  return "#Y，俺们先一起杀过去！#90"
end

AllFormulas[4071315].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071316] = {}
AllFormulas[4071316].Condition = function(self)
  return "队里的#G"
end

AllFormulas[4071316].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
}}}
AllFormulas[4071317] = {}
AllFormulas[4071317].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071317].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
}}}
AllFormulas[4071318] = {}
AllFormulas[4071318].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4071318].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "有好东西，大哥快抢！#18"
end
}}}
AllFormulas[4071319] = {}
AllFormulas[4071319].Condition = function(self)
  return true
end

AllFormulas[4071319].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071320] = {}
AllFormulas[4071320].Condition = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end

AllFormulas[4071320].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071321] = {}
AllFormulas[4071321].Condition = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end

AllFormulas[4071321].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071322] = {}
AllFormulas[4071322].Condition = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end

AllFormulas[4071322].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071323] = {}
AllFormulas[4071323].Condition = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end

AllFormulas[4071323].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071324] = {}
AllFormulas[4071324].Condition = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end

AllFormulas[4071324].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071325] = {}
AllFormulas[4071325].Condition = function(self)
  return "还偷啥，直接抢啊！#21"
end

AllFormulas[4071325].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071326] = {}
AllFormulas[4071326].Condition = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end

AllFormulas[4071326].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071327] = {}
AllFormulas[4071327].Condition = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end

AllFormulas[4071327].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071328] = {}
AllFormulas[4071328].Condition = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end

AllFormulas[4071328].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071329] = {}
AllFormulas[4071329].Condition = function(self)
  return "这#G"
end

AllFormulas[4071329].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
}}}
AllFormulas[4071330] = {}
AllFormulas[4071330].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4071330].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
}}}
AllFormulas[4071331] = {}
AllFormulas[4071331].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4071331].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
}}}
AllFormulas[4071332] = {}
AllFormulas[4071332].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4071332].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升的不行啊！#64"
end
}}}
AllFormulas[4071333] = {}
AllFormulas[4071333].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end

AllFormulas[4071333].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这样升才给力嘛！#145"
end
}}}
AllFormulas[4071334] = {}
AllFormulas[4071334].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4071334].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升成这样怎么杀人啊！#15"
end
}}}
AllFormulas[4071335] = {}
AllFormulas[4071335].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4071335].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
}}}
AllFormulas[4071336] = {}
AllFormulas[4071336].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4071336].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥好，大哥打怪去！#51"
end
}}}
AllFormulas[4071337] = {}
AllFormulas[4071337].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4071337].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你干吗呢？#2"
end
}}}
AllFormulas[4071338] = {}
AllFormulas[4071338].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4071338].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
}}}
AllFormulas[4071339] = {}
AllFormulas[4071339].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end

AllFormulas[4071339].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
}}}
AllFormulas[4071340] = {}
AllFormulas[4071340].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4071340].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
}}}
AllFormulas[4071341] = {}
AllFormulas[4071341].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4071341].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
}}}
AllFormulas[4071342] = {}
AllFormulas[4071342].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4071342].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "淹死他，狠狠的浇！#102"
end
}}}
AllFormulas[4071343] = {}
AllFormulas[4071343].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4071343].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "扫帚杀人不好使吧？#119"
end
}}}
AllFormulas[4071344] = {}
AllFormulas[4071344].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4071344].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
}}}
AllFormulas[4071345] = {}
AllFormulas[4071345].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4071345].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
}}}
AllFormulas[4071346] = {}
AllFormulas[4071346].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4071346].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
}}}
AllFormulas[4071347] = {}
AllFormulas[4071347].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4071347].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
}}}
AllFormulas[4071348] = {}
AllFormulas[4071348].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4071348].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071349] = {}
AllFormulas[4071349].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071349].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来1"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071350] = {}
AllFormulas[4071350].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071350].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来2"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071351] = {}
AllFormulas[4071351].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071351].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来3"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071352] = {}
AllFormulas[4071352].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071352].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你看我跑的多欢"
end
, [2] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4071353] = {}
AllFormulas[4071353].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071353].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "老师，你真给力 "
end
}}}
AllFormulas[4071354] = {}
AllFormulas[4071354].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071354].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071355] = {}
AllFormulas[4071355].Condition = function(self)
  return "徒弟，你真给力 "
end

AllFormulas[4071355].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071356] = {}
AllFormulas[4071356].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071356].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哥们，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071357] = {}
AllFormulas[4071357].Condition = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071357].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "亲爱的，你真给力 "
end
}}}
AllFormulas[4071400] = {}
AllFormulas[4071400].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071400].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071401] = {}
AllFormulas[4071401].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071401].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4071402] = {}
AllFormulas[4071402].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071402].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071403] = {}
AllFormulas[4071403].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4071403].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4071404] = {}
AllFormulas[4071404].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071404].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人我升到了 "
end
, [4] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071405] = {}
AllFormulas[4071405].Condition = function(self)
  return " 级"
end

AllFormulas[4071405].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071406] = {}
AllFormulas[4071406].Condition = function(self)
  return "主人，你的技能#G"
end

AllFormulas[4071406].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y好牛逼啊"
end
}}}
AllFormulas[4071407] = {}
AllFormulas[4071407].Condition = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end

AllFormulas[4071407].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
}}}
AllFormulas[4071408] = {}
AllFormulas[4071408].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071408].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " ， 名字 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071409] = {}
AllFormulas[4071409].Condition = function(self)
  return " , hp = "
end

AllFormulas[4071409].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4071410] = {}
AllFormulas[4071410].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4071410].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
, [3] = function(self)
  return self.m_pCurEventParam[3] == 0
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071411] = {}
AllFormulas[4071411].Condition = function(self)
  return "主人，你的队友 "
end

AllFormulas[4071411].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " ， 名字 "
end
}}}
AllFormulas[4071412] = {}
AllFormulas[4071412].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071412].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " , hp = "
end
, [2] = function(self)
  return self.m_pCurEventParam[3]
end
}}}
AllFormulas[4071413] = {}
AllFormulas[4071413].Condition = function(self)
  return ", curFull = "
end

AllFormulas[4071413].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[4]
end
, [2] = function(self)
  return ", Full= "
end
}}}
AllFormulas[4071414] = {}
AllFormulas[4071414].Condition = function(self)
  return self.m_pCurEventParam[5]
end

AllFormulas[4071414].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071415] = {}
AllFormulas[4071415].Condition = function(self)
  return "紫装你好 "
end

AllFormulas[4071415].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return true
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "恭喜主人升到 "
end
}}}
AllFormulas[4071416] = {}
AllFormulas[4071416].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071416].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071417] = {}
AllFormulas[4071417].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071417].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人， "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071418] = {}
AllFormulas[4071418].Condition = function(self)
  return "的店 "
end

AllFormulas[4071418].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " 不错嘛"
end
}}}
AllFormulas[4071419] = {}
AllFormulas[4071419].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071419].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071420] = {}
AllFormulas[4071420].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071420].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.1)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人，你的技能 "
end
}}}
AllFormulas[4071421] = {}
AllFormulas[4071421].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071421].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 好牛逼啊"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
}}}
AllFormulas[4071422] = {}
AllFormulas[4071422].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071422].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你完成了 "
end
}}}
AllFormulas[4071423] = {}
AllFormulas[4071423].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071423].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 任务 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071424] = {}
AllFormulas[4071424].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071424].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人 Id 为 "
end
}}}
AllFormulas[4071425] = {}
AllFormulas[4071425].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071425].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 的 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071426] = {}
AllFormulas[4071426].Condition = function(self)
  return " 找你"
end

AllFormulas[4071426].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4071427] = {}
AllFormulas[4071427].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end

AllFormulas[4071427].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end
}}}
AllFormulas[4071428] = {}
AllFormulas[4071428].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end

AllFormulas[4071428].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end
}}}
AllFormulas[4071429] = {}
AllFormulas[4071429].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end

AllFormulas[4071429].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end
}}}
AllFormulas[4071430] = {}
AllFormulas[4071430].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end

AllFormulas[4071430].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end
}}}
AllFormulas[4071431] = {}
AllFormulas[4071431].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end

AllFormulas[4071431].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end
}}}
AllFormulas[4071432] = {}
AllFormulas[4071432].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end

AllFormulas[4071432].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071433] = {}
AllFormulas[4071433].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071433].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071434] = {}
AllFormulas[4071434].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071434].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，小鸡在此！#51"
end
}}}
AllFormulas[4071435] = {}
AllFormulas[4071435].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4071435].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
}}}
AllFormulas[4071436] = {}
AllFormulas[4071436].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4071436].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
}}}
AllFormulas[4071437] = {}
AllFormulas[4071437].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4071437].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
}}}
AllFormulas[4071438] = {}
AllFormulas[4071438].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4071438].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，那个#G"
end
}}}
AllFormulas[4071439] = {}
AllFormulas[4071439].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071439].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071440] = {}
AllFormulas[4071440].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071440].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071441] = {}
AllFormulas[4071441].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071441].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的徒弟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071442] = {}
AllFormulas[4071442].Condition = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end

AllFormulas[4071442].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071443] = {}
AllFormulas[4071443].Condition = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end

AllFormulas[4071443].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071444] = {}
AllFormulas[4071444].Condition = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end

AllFormulas[4071444].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071445] = {}
AllFormulas[4071445].Condition = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end

AllFormulas[4071445].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071446] = {}
AllFormulas[4071446].Condition = function(self)
  return "#G"
end

AllFormulas[4071446].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y来了，主人小心啊！#47"
end
}}}
AllFormulas[4071447] = {}
AllFormulas[4071447].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071447].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
}}}
AllFormulas[4071448] = {}
AllFormulas[4071448].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071448].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "吃我一扇，我要把你这个#G"
end
}}}
AllFormulas[4071449] = {}
AllFormulas[4071449].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071449].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y扇跑！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071450] = {}
AllFormulas[4071450].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071450].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071451] = {}
AllFormulas[4071451].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071451].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，小鸡会想念你的……#14"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4071452] = {}
AllFormulas[4071452].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071452].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人要跟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071453] = {}
AllFormulas[4071453].Condition = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end

AllFormulas[4071453].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071454] = {}
AllFormulas[4071454].Condition = function(self)
  return "小鸡我升到了#G"
end

AllFormulas[4071454].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end
}}}
AllFormulas[4071455] = {}
AllFormulas[4071455].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071455].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end
}}}
AllFormulas[4071456] = {}
AllFormulas[4071456].Condition = function(self)
  return true
end

AllFormulas[4071456].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好帅的一招#G"
end
}}}
AllFormulas[4071457] = {}
AllFormulas[4071457].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4071457].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
}}}
AllFormulas[4071500] = {}
AllFormulas[4071500].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071500].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071501] = {}
AllFormulas[4071501].Condition = function(self)
  return "#Y受伤了，好可怜呢。#14"
end

AllFormulas[4071501].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071502] = {}
AllFormulas[4071502].Condition = function(self)
  return "主人，你的队友#G"
end

AllFormulas[4071502].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end
}}}
AllFormulas[4071503] = {}
AllFormulas[4071503].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071503].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
}}}
AllFormulas[4071504] = {}
AllFormulas[4071504].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4071504].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
, [3] = function(self)
  return true
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071505] = {}
AllFormulas[4071505].Condition = function(self)
  return "主人升到#G"
end

AllFormulas[4071505].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071506] = {}
AllFormulas[4071506].Condition = function(self)
  return "#G"
end

AllFormulas[4071506].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071507] = {}
AllFormulas[4071507].Condition = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end

AllFormulas[4071507].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071508] = {}
AllFormulas[4071508].Condition = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end

AllFormulas[4071508].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071509] = {}
AllFormulas[4071509].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071509].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
}}}
AllFormulas[4071510] = {}
AllFormulas[4071510].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4071510].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的#G"
end
, [3] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [4] = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end
}}}
AllFormulas[4071511] = {}
AllFormulas[4071511].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end

AllFormulas[4071511].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人穿这么少，不会冻着么？#55"
end
}}}
AllFormulas[4071512] = {}
AllFormulas[4071512].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071512].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071513] = {}
AllFormulas[4071513].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4071513].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071514] = {}
AllFormulas[4071514].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4071514].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end
, [2] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
}}}
AllFormulas[4071515] = {}
AllFormulas[4071515].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071515].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的不错啊！#40"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人升的好棒啊！#86"
end
}}, 
[2] = {[1] = 5, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071516] = {}
AllFormulas[4071516].Condition = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end

AllFormulas[4071516].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071517] = {}
AllFormulas[4071517].Condition = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end

AllFormulas[4071517].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071518] = {}
AllFormulas[4071518].Condition = function(self)
  return "主人你也好，叽！#62"
end

AllFormulas[4071518].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071519] = {}
AllFormulas[4071519].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4071519].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
}}}
AllFormulas[4071520] = {}
AllFormulas[4071520].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071520].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人的伞伞比我的大！#52"
end
}}}
AllFormulas[4071521] = {}
AllFormulas[4071521].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4071521].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人锄地我浇水！#59"
end
}}}
AllFormulas[4071522] = {}
AllFormulas[4071522].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4071522].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人浇水我锄地！#46"
end
}}}
AllFormulas[4071523] = {}
AllFormulas[4071523].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4071523].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
}}}
AllFormulas[4071524] = {}
AllFormulas[4071524].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4071524].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人抱抱！#17"
end
}}}
AllFormulas[4071525] = {}
AllFormulas[4071525].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4071525].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end
}}}
AllFormulas[4071526] = {}
AllFormulas[4071526].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4071526].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end
}}}
AllFormulas[4071527] = {}
AllFormulas[4071527].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4071527].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end
}}}
AllFormulas[4071528] = {}
AllFormulas[4071528].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4071528].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end
}}}
AllFormulas[4071529] = {}
AllFormulas[4071529].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071529].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
}}}
AllFormulas[4071530] = {}
AllFormulas[4071530].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071530].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end
}}}
AllFormulas[4071531] = {}
AllFormulas[4071531].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071531].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end
}}}
AllFormulas[4071532] = {}
AllFormulas[4071532].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071532].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end
}}}
AllFormulas[4071533] = {}
AllFormulas[4071533].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071533].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
}}}
AllFormulas[4071534] = {}
AllFormulas[4071534].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071534].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
}}}
AllFormulas[4071535] = {}
AllFormulas[4071535].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4071535].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
}}}
AllFormulas[4071536] = {}
AllFormulas[4071536].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4071536].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
}}}
AllFormulas[4071537] = {}
AllFormulas[4071537].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4071537].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
}}}
AllFormulas[4071538] = {}
AllFormulas[4071538].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4071538].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，俺们一起杀了#G"
end
}}}
AllFormulas[4071539] = {}
AllFormulas[4071539].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071539].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071540] = {}
AllFormulas[4071540].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071540].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071541] = {}
AllFormulas[4071541].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071541].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哟，师侄#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071542] = {}
AllFormulas[4071542].Condition = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end

AllFormulas[4071542].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071543] = {}
AllFormulas[4071543].Condition = function(self)
  return "大哥，#G"
end

AllFormulas[4071543].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end
}}}
AllFormulas[4071544] = {}
AllFormulas[4071544].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4071544].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4071545] = {}
AllFormulas[4071545].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4071545].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4071546] = {}
AllFormulas[4071546].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4071546].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "杀啊！先灭了#G"
end
}}}
AllFormulas[4071547] = {}
AllFormulas[4071547].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071547].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y！#140"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071548] = {}
AllFormulas[4071548].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071548].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071549] = {}
AllFormulas[4071549].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071549].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071550] = {}
AllFormulas[4071550].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071550].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071551] = {}
AllFormulas[4071551].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071551].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4071552] = {}
AllFormulas[4071552].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071552].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071553] = {}
AllFormulas[4071553].Condition = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end

AllFormulas[4071553].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071554] = {}
AllFormulas[4071554].Condition = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end

AllFormulas[4071554].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071555] = {}
AllFormulas[4071555].Condition = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end

AllFormulas[4071555].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071556] = {}
AllFormulas[4071556].Condition = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end

AllFormulas[4071556].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071557] = {}
AllFormulas[4071557].Condition = function(self)
  return "别管队里的#G"
end

AllFormulas[4071557].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
}}}
AllFormulas[4071600] = {}
AllFormulas[4071600].Condition = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end

AllFormulas[4071600].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "队里的#G"
end
}}}
AllFormulas[4071601] = {}
AllFormulas[4071601].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071601].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071602] = {}
AllFormulas[4071602].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071602].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
, [2] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
}}}
AllFormulas[4071603] = {}
AllFormulas[4071603].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071603].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "有好东西，大哥快抢！#18"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071604] = {}
AllFormulas[4071604].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071604].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071605] = {}
AllFormulas[4071605].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071605].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071606] = {}
AllFormulas[4071606].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071606].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end
}}}
AllFormulas[4071607] = {}
AllFormulas[4071607].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071607].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end
}}}
AllFormulas[4071608] = {}
AllFormulas[4071608].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071608].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end
, [3] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071609] = {}
AllFormulas[4071609].Condition = function(self)
  return "还偷啥，直接抢啊！#21"
end

AllFormulas[4071609].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
}}}
AllFormulas[4071610] = {}
AllFormulas[4071610].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071610].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end
}}}
AllFormulas[4071611] = {}
AllFormulas[4071611].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071611].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这#G"
end
}}}
AllFormulas[4071612] = {}
AllFormulas[4071612].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071612].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4071613] = {}
AllFormulas[4071613].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071613].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4071614] = {}
AllFormulas[4071614].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071614].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
, [2] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
}}}
AllFormulas[4071615] = {}
AllFormulas[4071615].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071615].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "升的不行啊！#64"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "这样升才给力嘛！#145"
end
}}}
AllFormulas[4071616] = {}
AllFormulas[4071616].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4071616].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升成这样怎么杀人啊！#15"
end
}}}
AllFormulas[4071617] = {}
AllFormulas[4071617].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4071617].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
}}}
AllFormulas[4071618] = {}
AllFormulas[4071618].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4071618].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥好，大哥打怪去！#51"
end
}}}
AllFormulas[4071619] = {}
AllFormulas[4071619].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4071619].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你干吗呢？#2"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071620] = {}
AllFormulas[4071620].Condition = function(self)
  return "甭睡了，快起来刷怪！#46"
end

AllFormulas[4071620].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
}}}
AllFormulas[4071621] = {}
AllFormulas[4071621].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071621].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
}}}
AllFormulas[4071622] = {}
AllFormulas[4071622].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071622].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
}}}
AllFormulas[4071623] = {}
AllFormulas[4071623].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071623].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "淹死他，狠狠的浇！#102"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
}}}
AllFormulas[4071624] = {}
AllFormulas[4071624].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071624].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "扫帚杀人不好使吧？#119"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
}}}
AllFormulas[4071625] = {}
AllFormulas[4071625].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071625].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
}}}
AllFormulas[4071626] = {}
AllFormulas[4071626].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071626].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
}}}
AllFormulas[4071627] = {}
AllFormulas[4071627].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071627].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
}}}
AllFormulas[4071628] = {}
AllFormulas[4071628].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071628].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
}}}
AllFormulas[4071629] = {}
AllFormulas[4071629].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071629].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071630] = {}
AllFormulas[4071630].Condition = function(self)
  return "召唤出来1"
end

AllFormulas[4071630].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071631] = {}
AllFormulas[4071631].Condition = function(self)
  return "召唤出来2"
end

AllFormulas[4071631].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071632] = {}
AllFormulas[4071632].Condition = function(self)
  return "召唤出来3"
end

AllFormulas[4071632].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071633] = {}
AllFormulas[4071633].Condition = function(self)
  return "主人你看我跑的多欢"
end

AllFormulas[4071633].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071634] = {}
AllFormulas[4071634].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071634].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "老师，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071635] = {}
AllFormulas[4071635].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071635].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "徒弟，你真给力 "
end
}}}
AllFormulas[4071636] = {}
AllFormulas[4071636].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071636].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071637] = {}
AllFormulas[4071637].Condition = function(self)
  return "哥们，你真给力 "
end

AllFormulas[4071637].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071638] = {}
AllFormulas[4071638].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071638].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "亲爱的，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071639] = {}
AllFormulas[4071639].Condition = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end

AllFormulas[4071639].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071640] = {}
AllFormulas[4071640].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071640].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071641] = {}
AllFormulas[4071641].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071641].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}, 
[2] = {[1] = 3, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}, 
[3] = {[1] = 3, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071642] = {}
AllFormulas[4071642].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071642].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人我升到了 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071643] = {}
AllFormulas[4071643].Condition = function(self)
  return " 级"
end

AllFormulas[4071643].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071644] = {}
AllFormulas[4071644].Condition = function(self)
  return "主人，你的技能#G"
end

AllFormulas[4071644].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y好牛逼啊"
end
}}}
AllFormulas[4071645] = {}
AllFormulas[4071645].Condition = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end

AllFormulas[4071645].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
}}}
AllFormulas[4071646] = {}
AllFormulas[4071646].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071646].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " ， 名字 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071647] = {}
AllFormulas[4071647].Condition = function(self)
  return " , hp = "
end

AllFormulas[4071647].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4071648] = {}
AllFormulas[4071648].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4071648].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4071649] = {}
AllFormulas[4071649].Condition = function(self)
  return self.m_pCurEventParam[3] == 0
end

AllFormulas[4071649].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
}}}
AllFormulas[4071650] = {}
AllFormulas[4071650].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071650].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " ， 名字 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071651] = {}
AllFormulas[4071651].Condition = function(self)
  return " , hp = "
end

AllFormulas[4071651].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4071652] = {}
AllFormulas[4071652].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4071652].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4071653] = {}
AllFormulas[4071653].Condition = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end

AllFormulas[4071653].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "紫装你好 "
end
}}}
AllFormulas[4071654] = {}
AllFormulas[4071654].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071654].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071655] = {}
AllFormulas[4071655].Condition = function(self)
  return "恭喜主人升到 "
end

AllFormulas[4071655].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 级"
end
}}}
AllFormulas[4071656] = {}
AllFormulas[4071656].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071656].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人， "
end
}}}
AllFormulas[4071657] = {}
AllFormulas[4071657].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071657].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "的店 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071700] = {}
AllFormulas[4071700].Condition = function(self)
  return " 不错嘛"
end

AllFormulas[4071700].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071701] = {}
AllFormulas[4071701].Condition = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end

AllFormulas[4071701].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071702] = {}
AllFormulas[4071702].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071702].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4071703] = {}
AllFormulas[4071703].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071703].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的技能 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071704] = {}
AllFormulas[4071704].Condition = function(self)
  return " 好牛逼啊"
end

AllFormulas[4071704].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人你完成了 "
end
, [5] = function(self)
  return self.m_pCurEventParam[1]
end
, [6] = function(self)
  return " 任务 "
end
}}}
AllFormulas[4071705] = {}
AllFormulas[4071705].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071705].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人 Id 为 "
end
, [4] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071706] = {}
AllFormulas[4071706].Condition = function(self)
  return " 的 "
end

AllFormulas[4071706].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " 找你"
end
, [3] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [4] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4071707] = {}
AllFormulas[4071707].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end

AllFormulas[4071707].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
}}}
AllFormulas[4071708] = {}
AllFormulas[4071708].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end

AllFormulas[4071708].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
}}}
AllFormulas[4071709] = {}
AllFormulas[4071709].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end

AllFormulas[4071709].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
}}}
AllFormulas[4071710] = {}
AllFormulas[4071710].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end

AllFormulas[4071710].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end
}}}
AllFormulas[4071711] = {}
AllFormulas[4071711].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071711].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071712] = {}
AllFormulas[4071712].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071712].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071713] = {}
AllFormulas[4071713].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071713].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，小鸡在此！#51"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071714] = {}
AllFormulas[4071714].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071714].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071715] = {}
AllFormulas[4071715].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071715].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071716] = {}
AllFormulas[4071716].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071716].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
, [2] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4071717] = {}
AllFormulas[4071717].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071717].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，那个#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071718] = {}
AllFormulas[4071718].Condition = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end

AllFormulas[4071718].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071719] = {}
AllFormulas[4071719].Condition = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end

AllFormulas[4071719].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人，你的徒弟#G"
end
, [4] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071720] = {}
AllFormulas[4071720].Condition = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end

AllFormulas[4071720].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
, [4] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4071721] = {}
AllFormulas[4071721].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071721].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4071722] = {}
AllFormulas[4071722].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071722].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4071723] = {}
AllFormulas[4071723].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071723].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071724] = {}
AllFormulas[4071724].Condition = function(self)
  return "#Y来了，主人小心啊！#47"
end

AllFormulas[4071724].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071725] = {}
AllFormulas[4071725].Condition = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end

AllFormulas[4071725].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071726] = {}
AllFormulas[4071726].Condition = function(self)
  return "吃我一扇，我要把你这个#G"
end

AllFormulas[4071726].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y扇跑！#78"
end
}}}
AllFormulas[4071727] = {}
AllFormulas[4071727].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071727].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
}}}
AllFormulas[4071728] = {}
AllFormulas[4071728].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071728].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，小鸡会想念你的……#14"
end
}}}
AllFormulas[4071729] = {}
AllFormulas[4071729].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4071729].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人要跟#G"
end
}}}
AllFormulas[4071730] = {}
AllFormulas[4071730].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071730].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071731] = {}
AllFormulas[4071731].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071731].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡我升到了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071732] = {}
AllFormulas[4071732].Condition = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end

AllFormulas[4071732].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071733] = {}
AllFormulas[4071733].Condition = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end

AllFormulas[4071733].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071734] = {}
AllFormulas[4071734].Condition = function(self)
  return "好帅的一招#G"
end

AllFormulas[4071734].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4071735] = {}
AllFormulas[4071735].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4071735].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4071736] = {}
AllFormulas[4071736].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071736].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4071737] = {}
AllFormulas[4071737].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071737].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071738] = {}
AllFormulas[4071738].Condition = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end

AllFormulas[4071738].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071739] = {}
AllFormulas[4071739].Condition = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end

AllFormulas[4071739].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071740] = {}
AllFormulas[4071740].Condition = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end

AllFormulas[4071740].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071741] = {}
AllFormulas[4071741].Condition = function(self)
  return "主人升到#G"
end

AllFormulas[4071741].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
}}}
AllFormulas[4071742] = {}
AllFormulas[4071742].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071742].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4071743] = {}
AllFormulas[4071743].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071743].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071744] = {}
AllFormulas[4071744].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071744].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071745] = {}
AllFormulas[4071745].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071745].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071746] = {}
AllFormulas[4071746].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071746].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071747] = {}
AllFormulas[4071747].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071747].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
}}}
AllFormulas[4071748] = {}
AllFormulas[4071748].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071748].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4071749] = {}
AllFormulas[4071749].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071749].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4071750] = {}
AllFormulas[4071750].Condition = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end

AllFormulas[4071750].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071751] = {}
AllFormulas[4071751].Condition = function(self)
  return "主人穿这么少，不会冻着么？#55"
end

AllFormulas[4071751].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071752] = {}
AllFormulas[4071752].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4071752].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071753] = {}
AllFormulas[4071753].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4071753].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071754] = {}
AllFormulas[4071754].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4071754].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071755] = {}
AllFormulas[4071755].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4071755].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071756] = {}
AllFormulas[4071756].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4071756].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071757] = {}
AllFormulas[4071757].Condition = function(self)
  return "主人升的好棒啊！#86"
end

AllFormulas[4071757].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071800] = {}
AllFormulas[4071800].Condition = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end

AllFormulas[4071800].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071801] = {}
AllFormulas[4071801].Condition = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end

AllFormulas[4071801].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071802] = {}
AllFormulas[4071802].Condition = function(self)
  return "主人你也好，叽！#62"
end

AllFormulas[4071802].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071803] = {}
AllFormulas[4071803].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4071803].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071804] = {}
AllFormulas[4071804].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4071804].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
}}}
AllFormulas[4071805] = {}
AllFormulas[4071805].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071805].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的伞伞比我的大！#52"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
}}}
AllFormulas[4071806] = {}
AllFormulas[4071806].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071806].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人锄地我浇水！#59"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人浇水我锄地！#46"
end
}}}
AllFormulas[4071807] = {}
AllFormulas[4071807].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4071807].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
}}}
AllFormulas[4071808] = {}
AllFormulas[4071808].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4071808].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人抱抱！#17"
end
}}}
AllFormulas[4071809] = {}
AllFormulas[4071809].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4071809].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end
}}}
AllFormulas[4071810] = {}
AllFormulas[4071810].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4071810].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071811] = {}
AllFormulas[4071811].Condition = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end

AllFormulas[4071811].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071812] = {}
AllFormulas[4071812].Condition = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end

AllFormulas[4071812].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071813] = {}
AllFormulas[4071813].Condition = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end

AllFormulas[4071813].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071814] = {}
AllFormulas[4071814].Condition = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end

AllFormulas[4071814].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071815] = {}
AllFormulas[4071815].Condition = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end

AllFormulas[4071815].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071816] = {}
AllFormulas[4071816].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071816].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071817] = {}
AllFormulas[4071817].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071817].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071818] = {}
AllFormulas[4071818].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071818].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4071819] = {}
AllFormulas[4071819].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071819].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
, [2] = function(self)
  return Rand(0.0001)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
}}}
AllFormulas[4071820] = {}
AllFormulas[4071820].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4071820].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，俺们一起杀了#G"
end
}}}
AllFormulas[4071821] = {}
AllFormulas[4071821].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071821].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071822] = {}
AllFormulas[4071822].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071822].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071823] = {}
AllFormulas[4071823].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071823].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哟，师侄#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071824] = {}
AllFormulas[4071824].Condition = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end

AllFormulas[4071824].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071825] = {}
AllFormulas[4071825].Condition = function(self)
  return "大哥，#G"
end

AllFormulas[4071825].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end
}}}
AllFormulas[4071826] = {}
AllFormulas[4071826].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4071826].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4071827] = {}
AllFormulas[4071827].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4071827].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4071828] = {}
AllFormulas[4071828].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4071828].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "杀啊！先灭了#G"
end
}}}
AllFormulas[4071829] = {}
AllFormulas[4071829].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4071829].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y！#140"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071830] = {}
AllFormulas[4071830].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071830].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071831] = {}
AllFormulas[4071831].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071831].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071832] = {}
AllFormulas[4071832].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071832].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071833] = {}
AllFormulas[4071833].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071833].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4071834] = {}
AllFormulas[4071834].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071834].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071835] = {}
AllFormulas[4071835].Condition = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end

AllFormulas[4071835].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071836] = {}
AllFormulas[4071836].Condition = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end

AllFormulas[4071836].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071837] = {}
AllFormulas[4071837].Condition = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end

AllFormulas[4071837].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071838] = {}
AllFormulas[4071838].Condition = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end

AllFormulas[4071838].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071839] = {}
AllFormulas[4071839].Condition = function(self)
  return "别管队里的#G"
end

AllFormulas[4071839].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
}}}
AllFormulas[4071840] = {}
AllFormulas[4071840].Condition = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end

AllFormulas[4071840].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "队里的#G"
end
}}}
AllFormulas[4071841] = {}
AllFormulas[4071841].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071841].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071842] = {}
AllFormulas[4071842].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071842].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
, [2] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
}}}
AllFormulas[4071843] = {}
AllFormulas[4071843].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071843].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "有好东西，大哥快抢！#18"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071844] = {}
AllFormulas[4071844].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071844].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071845] = {}
AllFormulas[4071845].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071845].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071846] = {}
AllFormulas[4071846].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071846].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071847] = {}
AllFormulas[4071847].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071847].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071848] = {}
AllFormulas[4071848].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071848].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071849] = {}
AllFormulas[4071849].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071849].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
}}}
AllFormulas[4071850] = {}
AllFormulas[4071850].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071850].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "还偷啥，直接抢啊！#21"
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4071851] = {}
AllFormulas[4071851].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071851].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
}}}
AllFormulas[4071852] = {}
AllFormulas[4071852].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071852].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071853] = {}
AllFormulas[4071853].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071853].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071854] = {}
AllFormulas[4071854].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071854].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071855] = {}
AllFormulas[4071855].Condition = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end

AllFormulas[4071855].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071856] = {}
AllFormulas[4071856].Condition = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end

AllFormulas[4071856].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071857] = {}
AllFormulas[4071857].Condition = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end

AllFormulas[4071857].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071900] = {}
AllFormulas[4071900].Condition = function(self)
  return "升的不行啊！#64"
end

AllFormulas[4071900].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071901] = {}
AllFormulas[4071901].Condition = function(self)
  return "这样升才给力嘛！#145"
end

AllFormulas[4071901].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071902] = {}
AllFormulas[4071902].Condition = function(self)
  return "升成这样怎么杀人啊！#15"
end

AllFormulas[4071902].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071903] = {}
AllFormulas[4071903].Condition = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end

AllFormulas[4071903].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071904] = {}
AllFormulas[4071904].Condition = function(self)
  return "大哥好，大哥打怪去！#51"
end

AllFormulas[4071904].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "大哥你干吗呢？#2"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
}}}
AllFormulas[4071905] = {}
AllFormulas[4071905].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071905].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
}}}
AllFormulas[4071906] = {}
AllFormulas[4071906].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071906].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
, [5] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [6] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071907] = {}
AllFormulas[4071907].Condition = function(self)
  return "大哥这回换锄头砍人了？#144"
end

AllFormulas[4071907].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071908] = {}
AllFormulas[4071908].Condition = function(self)
  return "淹死他，狠狠的浇！#102"
end

AllFormulas[4071908].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071909] = {}
AllFormulas[4071909].Condition = function(self)
  return "扫帚杀人不好使吧？#119"
end

AllFormulas[4071909].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071910] = {}
AllFormulas[4071910].Condition = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end

AllFormulas[4071910].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071911] = {}
AllFormulas[4071911].Condition = function(self)
  return "大哥，你嘟囔啥呢？#132"
end

AllFormulas[4071911].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071912] = {}
AllFormulas[4071912].Condition = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end

AllFormulas[4071912].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071913] = {}
AllFormulas[4071913].Condition = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end

AllFormulas[4071913].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071914] = {}
AllFormulas[4071914].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071914].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来1"
end
}}}
AllFormulas[4071915] = {}
AllFormulas[4071915].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071915].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来2"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071916] = {}
AllFormulas[4071916].Condition = function(self)
  return "召唤出来3"
end

AllFormulas[4071916].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071917] = {}
AllFormulas[4071917].Condition = function(self)
  return "主人你看我跑的多欢"
end

AllFormulas[4071917].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071918] = {}
AllFormulas[4071918].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071918].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "老师，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4071919] = {}
AllFormulas[4071919].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4071919].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "徒弟，你真给力 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4071920] = {}
AllFormulas[4071920].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071920].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哥们，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071921] = {}
AllFormulas[4071921].Condition = function(self)
  return "亲爱的，你真给力 "
end

AllFormulas[4071921].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
}}}
AllFormulas[4071922] = {}
AllFormulas[4071922].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071922].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071923] = {}
AllFormulas[4071923].Condition = function(self)
  return "打死你  "
end

AllFormulas[4071923].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4071924] = {}
AllFormulas[4071924].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4071924].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071925] = {}
AllFormulas[4071925].Condition = function(self)
  return "打死你  "
end

AllFormulas[4071925].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071926] = {}
AllFormulas[4071926].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071926].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人我升到了 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071927] = {}
AllFormulas[4071927].Condition = function(self)
  return " 级"
end

AllFormulas[4071927].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071928] = {}
AllFormulas[4071928].Condition = function(self)
  return "主人，你的技能#G"
end

AllFormulas[4071928].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y好牛逼啊"
end
}}}
AllFormulas[4071929] = {}
AllFormulas[4071929].Condition = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end

AllFormulas[4071929].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
}}}
AllFormulas[4071930] = {}
AllFormulas[4071930].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071930].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " ， 名字 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071931] = {}
AllFormulas[4071931].Condition = function(self)
  return " , hp = "
end

AllFormulas[4071931].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4071932] = {}
AllFormulas[4071932].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4071932].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4071933] = {}
AllFormulas[4071933].Condition = function(self)
  return self.m_pCurEventParam[3] == 0
end

AllFormulas[4071933].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " ， 名字 "
end
}}}
AllFormulas[4071934] = {}
AllFormulas[4071934].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071934].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " , hp = "
end
, [2] = function(self)
  return self.m_pCurEventParam[3]
end
}}}
AllFormulas[4071935] = {}
AllFormulas[4071935].Condition = function(self)
  return ", curFull = "
end

AllFormulas[4071935].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[4]
end
, [2] = function(self)
  return ", Full= "
end
}}}
AllFormulas[4071936] = {}
AllFormulas[4071936].Condition = function(self)
  return self.m_pCurEventParam[5]
end

AllFormulas[4071936].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071937] = {}
AllFormulas[4071937].Condition = function(self)
  return "紫装你好 "
end

AllFormulas[4071937].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4071938] = {}
AllFormulas[4071938].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071938].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "恭喜主人升到 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4071939] = {}
AllFormulas[4071939].Condition = function(self)
  return " 级"
end

AllFormulas[4071939].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4071940] = {}
AllFormulas[4071940].Condition = function(self)
  return "主人， "
end

AllFormulas[4071940].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "的店 "
end
}}}
AllFormulas[4071941] = {}
AllFormulas[4071941].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4071941].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 不错嘛"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071942] = {}
AllFormulas[4071942].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4071942].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4071943] = {}
AllFormulas[4071943].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071943].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071944] = {}
AllFormulas[4071944].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4071944].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能 "
end
}}}
AllFormulas[4071945] = {}
AllFormulas[4071945].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071945].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 好牛逼啊"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
}}}
AllFormulas[4071946] = {}
AllFormulas[4071946].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071946].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你完成了 "
end
}}}
AllFormulas[4071947] = {}
AllFormulas[4071947].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071947].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 任务 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071948] = {}
AllFormulas[4071948].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4071948].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人 Id 为 "
end
}}}
AllFormulas[4071949] = {}
AllFormulas[4071949].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4071949].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 的 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4071950] = {}
AllFormulas[4071950].Condition = function(self)
  return " 找你"
end

AllFormulas[4071950].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4071951] = {}
AllFormulas[4071951].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end

AllFormulas[4071951].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end
}}}
AllFormulas[4071952] = {}
AllFormulas[4071952].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end

AllFormulas[4071952].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end
}}}
AllFormulas[4071953] = {}
AllFormulas[4071953].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end

AllFormulas[4071953].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end
}}}
AllFormulas[4071954] = {}
AllFormulas[4071954].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end

AllFormulas[4071954].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end
}}}
AllFormulas[4071955] = {}
AllFormulas[4071955].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end

AllFormulas[4071955].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end
}}}
AllFormulas[4071956] = {}
AllFormulas[4071956].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end

AllFormulas[4071956].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4071957] = {}
AllFormulas[4071957].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4071957].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072000] = {}
AllFormulas[4072000].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072000].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，小鸡在此！#51"
end
}}}
AllFormulas[4072001] = {}
AllFormulas[4072001].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4072001].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
}}}
AllFormulas[4072002] = {}
AllFormulas[4072002].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4072002].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
}}}
AllFormulas[4072003] = {}
AllFormulas[4072003].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4072003].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
}}}
AllFormulas[4072004] = {}
AllFormulas[4072004].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4072004].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，那个#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
}}}
AllFormulas[4072005] = {}
AllFormulas[4072005].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072005].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
}}}
AllFormulas[4072006] = {}
AllFormulas[4072006].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072006].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的徒弟#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
}}}
AllFormulas[4072007] = {}
AllFormulas[4072007].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072007].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
}}}
AllFormulas[4072008] = {}
AllFormulas[4072008].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4072008].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4072009] = {}
AllFormulas[4072009].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4072009].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4072010] = {}
AllFormulas[4072010].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4072010].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return "#Y来了，主人小心啊！#47"
end
}}}
AllFormulas[4072011] = {}
AllFormulas[4072011].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072011].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
}}}
AllFormulas[4072012] = {}
AllFormulas[4072012].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072012].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "吃我一扇，我要把你这个#G"
end
}}}
AllFormulas[4072013] = {}
AllFormulas[4072013].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072013].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y扇跑！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072014] = {}
AllFormulas[4072014].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072014].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072015] = {}
AllFormulas[4072015].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072015].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，小鸡会想念你的……#14"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人要跟#G"
end
}}}
AllFormulas[4072016] = {}
AllFormulas[4072016].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072016].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072017] = {}
AllFormulas[4072017].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072017].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡我升到了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072018] = {}
AllFormulas[4072018].Condition = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end

AllFormulas[4072018].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072019] = {}
AllFormulas[4072019].Condition = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end

AllFormulas[4072019].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072020] = {}
AllFormulas[4072020].Condition = function(self)
  return "好帅的一招#G"
end

AllFormulas[4072020].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4072021] = {}
AllFormulas[4072021].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4072021].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4072022] = {}
AllFormulas[4072022].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072022].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4072023] = {}
AllFormulas[4072023].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072023].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072024] = {}
AllFormulas[4072024].Condition = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end

AllFormulas[4072024].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072025] = {}
AllFormulas[4072025].Condition = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end

AllFormulas[4072025].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072026] = {}
AllFormulas[4072026].Condition = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end

AllFormulas[4072026].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072027] = {}
AllFormulas[4072027].Condition = function(self)
  return "主人升到#G"
end

AllFormulas[4072027].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
}}}
AllFormulas[4072028] = {}
AllFormulas[4072028].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072028].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4072029] = {}
AllFormulas[4072029].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072029].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072030] = {}
AllFormulas[4072030].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072030].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072031] = {}
AllFormulas[4072031].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072031].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072032] = {}
AllFormulas[4072032].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072032].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072033] = {}
AllFormulas[4072033].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072033].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
}}}
AllFormulas[4072034] = {}
AllFormulas[4072034].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072034].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4072035] = {}
AllFormulas[4072035].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072035].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4072036] = {}
AllFormulas[4072036].Condition = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end

AllFormulas[4072036].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072037] = {}
AllFormulas[4072037].Condition = function(self)
  return "主人穿这么少，不会冻着么？#55"
end

AllFormulas[4072037].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072038] = {}
AllFormulas[4072038].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4072038].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072039] = {}
AllFormulas[4072039].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4072039].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072040] = {}
AllFormulas[4072040].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4072040].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072041] = {}
AllFormulas[4072041].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4072041].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072042] = {}
AllFormulas[4072042].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4072042].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072043] = {}
AllFormulas[4072043].Condition = function(self)
  return "主人升的好棒啊！#86"
end

AllFormulas[4072043].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072044] = {}
AllFormulas[4072044].Condition = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end

AllFormulas[4072044].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072045] = {}
AllFormulas[4072045].Condition = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end

AllFormulas[4072045].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072046] = {}
AllFormulas[4072046].Condition = function(self)
  return "主人你也好，叽！#62"
end

AllFormulas[4072046].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072047] = {}
AllFormulas[4072047].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4072047].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072048] = {}
AllFormulas[4072048].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4072048].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072049] = {}
AllFormulas[4072049].Condition = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end

AllFormulas[4072049].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072050] = {}
AllFormulas[4072050].Condition = function(self)
  return "主人的伞伞比我的大！#52"
end

AllFormulas[4072050].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072051] = {}
AllFormulas[4072051].Condition = function(self)
  return "主人锄地我浇水！#59"
end

AllFormulas[4072051].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072052] = {}
AllFormulas[4072052].Condition = function(self)
  return "主人浇水我锄地！#46"
end

AllFormulas[4072052].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072053] = {}
AllFormulas[4072053].Condition = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end

AllFormulas[4072053].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072054] = {}
AllFormulas[4072054].Condition = function(self)
  return "主人抱抱！#17"
end

AllFormulas[4072054].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072055] = {}
AllFormulas[4072055].Condition = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end

AllFormulas[4072055].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072056] = {}
AllFormulas[4072056].Condition = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end

AllFormulas[4072056].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072057] = {}
AllFormulas[4072057].Condition = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end

AllFormulas[4072057].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072100] = {}
AllFormulas[4072100].Condition = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end

AllFormulas[4072100].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072101] = {}
AllFormulas[4072101].Condition = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end

AllFormulas[4072101].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072102] = {}
AllFormulas[4072102].Condition = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end

AllFormulas[4072102].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072103] = {}
AllFormulas[4072103].Condition = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end

AllFormulas[4072103].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072104] = {}
AllFormulas[4072104].Condition = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end

AllFormulas[4072104].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072105] = {}
AllFormulas[4072105].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072105].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4072106] = {}
AllFormulas[4072106].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072106].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
, [2] = function(self)
  return Rand(0.0001)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
}}}
AllFormulas[4072107] = {}
AllFormulas[4072107].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4072107].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
}}}
AllFormulas[4072108] = {}
AllFormulas[4072108].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4072108].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，俺们一起杀了#G"
end
}}}
AllFormulas[4072109] = {}
AllFormulas[4072109].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072109].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072110] = {}
AllFormulas[4072110].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072110].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072111] = {}
AllFormulas[4072111].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072111].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哟，师侄#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072112] = {}
AllFormulas[4072112].Condition = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end

AllFormulas[4072112].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072113] = {}
AllFormulas[4072113].Condition = function(self)
  return "大哥，#G"
end

AllFormulas[4072113].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end
}}}
AllFormulas[4072114] = {}
AllFormulas[4072114].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4072114].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
}}}
AllFormulas[4072115] = {}
AllFormulas[4072115].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4072115].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [3] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072116] = {}
AllFormulas[4072116].Condition = function(self)
  return "杀啊！先灭了#G"
end

AllFormulas[4072116].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y！#140"
end
}}}
AllFormulas[4072117] = {}
AllFormulas[4072117].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072117].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
}}}
AllFormulas[4072118] = {}
AllFormulas[4072118].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072118].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
}}}
AllFormulas[4072119] = {}
AllFormulas[4072119].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072119].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
, [3] = function(self)
  return Rand(0.003)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072120] = {}
AllFormulas[4072120].Condition = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end

AllFormulas[4072120].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072121] = {}
AllFormulas[4072121].Condition = function(self)
  return "#G"
end

AllFormulas[4072121].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
}}}
AllFormulas[4072122] = {}
AllFormulas[4072122].Condition = function(self)
  return true
end

AllFormulas[4072122].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
}}}
AllFormulas[4072123] = {}
AllFormulas[4072123].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072123].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
}}}
AllFormulas[4072124] = {}
AllFormulas[4072124].Condition = function(self)
  return true
end

AllFormulas[4072124].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
}}}
AllFormulas[4072125] = {}
AllFormulas[4072125].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4072125].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "别管队里的#G"
end
}}}
AllFormulas[4072126] = {}
AllFormulas[4072126].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072126].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4072127] = {}
AllFormulas[4072127].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072127].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072128] = {}
AllFormulas[4072128].Condition = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end

AllFormulas[4072128].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072129] = {}
AllFormulas[4072129].Condition = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end

AllFormulas[4072129].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072130] = {}
AllFormulas[4072130].Condition = function(self)
  return "有好东西，大哥快抢！#18"
end

AllFormulas[4072130].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072131] = {}
AllFormulas[4072131].Condition = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end

AllFormulas[4072131].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072132] = {}
AllFormulas[4072132].Condition = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end

AllFormulas[4072132].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072133] = {}
AllFormulas[4072133].Condition = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end

AllFormulas[4072133].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072134] = {}
AllFormulas[4072134].Condition = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end

AllFormulas[4072134].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072135] = {}
AllFormulas[4072135].Condition = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end

AllFormulas[4072135].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072136] = {}
AllFormulas[4072136].Condition = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end

AllFormulas[4072136].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072137] = {}
AllFormulas[4072137].Condition = function(self)
  return "还偷啥，直接抢啊！#21"
end

AllFormulas[4072137].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072138] = {}
AllFormulas[4072138].Condition = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end

AllFormulas[4072138].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072139] = {}
AllFormulas[4072139].Condition = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end

AllFormulas[4072139].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072140] = {}
AllFormulas[4072140].Condition = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end

AllFormulas[4072140].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072141] = {}
AllFormulas[4072141].Condition = function(self)
  return "这#G"
end

AllFormulas[4072141].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
}}}
AllFormulas[4072142] = {}
AllFormulas[4072142].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4072142].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
}}}
AllFormulas[4072143] = {}
AllFormulas[4072143].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4072143].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
}}}
AllFormulas[4072144] = {}
AllFormulas[4072144].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4072144].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升的不行啊！#64"
end
}}}
AllFormulas[4072145] = {}
AllFormulas[4072145].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end

AllFormulas[4072145].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这样升才给力嘛！#145"
end
}}}
AllFormulas[4072146] = {}
AllFormulas[4072146].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4072146].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升成这样怎么杀人啊！#15"
end
}}}
AllFormulas[4072147] = {}
AllFormulas[4072147].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4072147].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
}}}
AllFormulas[4072148] = {}
AllFormulas[4072148].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4072148].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥好，大哥打怪去！#51"
end
}}}
AllFormulas[4072149] = {}
AllFormulas[4072149].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4072149].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你干吗呢？#2"
end
}}}
AllFormulas[4072150] = {}
AllFormulas[4072150].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4072150].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
}}}
AllFormulas[4072151] = {}
AllFormulas[4072151].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end

AllFormulas[4072151].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
}}}
AllFormulas[4072152] = {}
AllFormulas[4072152].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4072152].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
}}}
AllFormulas[4072153] = {}
AllFormulas[4072153].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4072153].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
}}}
AllFormulas[4072154] = {}
AllFormulas[4072154].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4072154].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "淹死他，狠狠的浇！#102"
end
}}}
AllFormulas[4072155] = {}
AllFormulas[4072155].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4072155].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "扫帚杀人不好使吧？#119"
end
}}}
AllFormulas[4072156] = {}
AllFormulas[4072156].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4072156].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
}}}
AllFormulas[4072157] = {}
AllFormulas[4072157].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4072157].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
}}}
AllFormulas[4072200] = {}
AllFormulas[4072200].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4072200].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
}}}
AllFormulas[4072201] = {}
AllFormulas[4072201].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4072201].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
}}}
AllFormulas[4072202] = {}
AllFormulas[4072202].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4072202].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072203] = {}
AllFormulas[4072203].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072203].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来1"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072204] = {}
AllFormulas[4072204].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072204].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来2"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "召唤出来3"
end
}}}
AllFormulas[4072205] = {}
AllFormulas[4072205].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072205].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你看我跑的多欢"
end
}}}
AllFormulas[4072206] = {}
AllFormulas[4072206].Condition = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4072206].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "老师，你真给力 "
end
, [4] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072207] = {}
AllFormulas[4072207].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072207].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "徒弟，你真给力 "
end
}}}
AllFormulas[4072208] = {}
AllFormulas[4072208].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072208].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072209] = {}
AllFormulas[4072209].Condition = function(self)
  return "哥们，你真给力 "
end

AllFormulas[4072209].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072210] = {}
AllFormulas[4072210].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072210].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "亲爱的，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072211] = {}
AllFormulas[4072211].Condition = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end

AllFormulas[4072211].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072212] = {}
AllFormulas[4072212].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072212].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072213] = {}
AllFormulas[4072213].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072213].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4072214] = {}
AllFormulas[4072214].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072214].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072215] = {}
AllFormulas[4072215].Condition = function(self)
  return true
end

AllFormulas[4072215].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人我升到了 "
end
}}}
AllFormulas[4072216] = {}
AllFormulas[4072216].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072216].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072217] = {}
AllFormulas[4072217].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072217].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的技能#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4072218] = {}
AllFormulas[4072218].Condition = function(self)
  return "#Y好牛逼啊"
end

AllFormulas[4072218].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072219] = {}
AllFormulas[4072219].Condition = function(self)
  return "主人，你的队友 "
end

AllFormulas[4072219].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " ， 名字 "
end
, [3] = function(self)
  return self.m_pCurEventParam[2]
end
, [4] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4072220] = {}
AllFormulas[4072220].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4072220].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4072221] = {}
AllFormulas[4072221].Condition = function(self)
  return ", Full= "
end

AllFormulas[4072221].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == 0
end
}}}
AllFormulas[4072222] = {}
AllFormulas[4072222].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072222].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072223] = {}
AllFormulas[4072223].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4072223].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4072224] = {}
AllFormulas[4072224].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4072224].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4072225] = {}
AllFormulas[4072225].Condition = function(self)
  return ", Full= "
end

AllFormulas[4072225].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4072226] = {}
AllFormulas[4072226].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072226].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "紫装你好 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072227] = {}
AllFormulas[4072227].Condition = function(self)
  return true
end

AllFormulas[4072227].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "恭喜主人升到 "
end
}}}
AllFormulas[4072228] = {}
AllFormulas[4072228].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072228].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072229] = {}
AllFormulas[4072229].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072229].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人， "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072230] = {}
AllFormulas[4072230].Condition = function(self)
  return "的店 "
end

AllFormulas[4072230].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " 不错嘛"
end
}}}
AllFormulas[4072231] = {}
AllFormulas[4072231].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072231].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
}}}
AllFormulas[4072232] = {}
AllFormulas[4072232].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072232].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072233] = {}
AllFormulas[4072233].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072233].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072234] = {}
AllFormulas[4072234].Condition = function(self)
  return "主人，你的技能 "
end

AllFormulas[4072234].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 好牛逼啊"
end
}}}
AllFormulas[4072235] = {}
AllFormulas[4072235].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end

AllFormulas[4072235].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072236] = {}
AllFormulas[4072236].Condition = function(self)
  return "主人你完成了 "
end

AllFormulas[4072236].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 任务 "
end
}}}
AllFormulas[4072237] = {}
AllFormulas[4072237].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072237].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072238] = {}
AllFormulas[4072238].Condition = function(self)
  return "主人 Id 为 "
end

AllFormulas[4072238].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 的 "
end
}}}
AllFormulas[4072239] = {}
AllFormulas[4072239].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072239].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 找你"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4072240] = {}
AllFormulas[4072240].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4072240].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
}}}
AllFormulas[4072241] = {}
AllFormulas[4072241].Condition = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end

AllFormulas[4072241].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
}}}
AllFormulas[4072242] = {}
AllFormulas[4072242].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end

AllFormulas[4072242].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
}}}
AllFormulas[4072243] = {}
AllFormulas[4072243].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end

AllFormulas[4072243].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
}}}
AllFormulas[4072244] = {}
AllFormulas[4072244].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end

AllFormulas[4072244].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
}}}
AllFormulas[4072245] = {}
AllFormulas[4072245].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end

AllFormulas[4072245].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072246] = {}
AllFormulas[4072246].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072246].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072247] = {}
AllFormulas[4072247].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072247].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072248] = {}
AllFormulas[4072248].Condition = function(self)
  return "主人主人，小鸡在此！#51"
end

AllFormulas[4072248].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072249] = {}
AllFormulas[4072249].Condition = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end

AllFormulas[4072249].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072250] = {}
AllFormulas[4072250].Condition = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end

AllFormulas[4072250].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072251] = {}
AllFormulas[4072251].Condition = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end

AllFormulas[4072251].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072252] = {}
AllFormulas[4072252].Condition = function(self)
  return "主人主人，那个#G"
end

AllFormulas[4072252].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
}}}
AllFormulas[4072253] = {}
AllFormulas[4072253].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072253].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
}}}
AllFormulas[4072254] = {}
AllFormulas[4072254].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072254].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的徒弟#G"
end
}}}
AllFormulas[4072255] = {}
AllFormulas[4072255].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072255].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072256] = {}
AllFormulas[4072256].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072256].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4072257] = {}
AllFormulas[4072257].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072257].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4072300] = {}
AllFormulas[4072300].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072300].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4072301] = {}
AllFormulas[4072301].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072301].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072302] = {}
AllFormulas[4072302].Condition = function(self)
  return "#Y来了，主人小心啊！#47"
end

AllFormulas[4072302].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072303] = {}
AllFormulas[4072303].Condition = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end

AllFormulas[4072303].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072304] = {}
AllFormulas[4072304].Condition = function(self)
  return "吃我一扇，我要把你这个#G"
end

AllFormulas[4072304].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y扇跑！#78"
end
, [3] = function(self)
  return Rand(0.003)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072305] = {}
AllFormulas[4072305].Condition = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end

AllFormulas[4072305].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人，小鸡会想念你的……#14"
end
, [4] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4072306] = {}
AllFormulas[4072306].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072306].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人要跟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072307] = {}
AllFormulas[4072307].Condition = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end

AllFormulas[4072307].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072308] = {}
AllFormulas[4072308].Condition = function(self)
  return "小鸡我升到了#G"
end

AllFormulas[4072308].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end
}}}
AllFormulas[4072309] = {}
AllFormulas[4072309].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072309].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end
}}}
AllFormulas[4072310] = {}
AllFormulas[4072310].Condition = function(self)
  return true
end

AllFormulas[4072310].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好帅的一招#G"
end
, [3] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [4] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4072311] = {}
AllFormulas[4072311].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4072311].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4072312] = {}
AllFormulas[4072312].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072312].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4072313] = {}
AllFormulas[4072313].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072313].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072314] = {}
AllFormulas[4072314].Condition = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end

AllFormulas[4072314].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072315] = {}
AllFormulas[4072315].Condition = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end

AllFormulas[4072315].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
, [4] = function(self)
  return true
end
}}}
AllFormulas[4072316] = {}
AllFormulas[4072316].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072316].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升到#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072317] = {}
AllFormulas[4072317].Condition = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end

AllFormulas[4072317].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072318] = {}
AllFormulas[4072318].Condition = function(self)
  return "#G"
end

AllFormulas[4072318].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
}}}
AllFormulas[4072319] = {}
AllFormulas[4072319].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072319].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
}}}
AllFormulas[4072320] = {}
AllFormulas[4072320].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072320].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
}}}
AllFormulas[4072321] = {}
AllFormulas[4072321].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072321].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
}}}
AllFormulas[4072322] = {}
AllFormulas[4072322].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072322].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
}}}
AllFormulas[4072323] = {}
AllFormulas[4072323].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4072323].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
}}}
AllFormulas[4072324] = {}
AllFormulas[4072324].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4072324].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的#G"
end
}}}
AllFormulas[4072325] = {}
AllFormulas[4072325].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4072325].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
}}}
AllFormulas[4072326] = {}
AllFormulas[4072326].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072326].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人穿这么少，不会冻着么？#55"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072327] = {}
AllFormulas[4072327].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072327].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072328] = {}
AllFormulas[4072328].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072328].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4072329] = {}
AllFormulas[4072329].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072329].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4072330] = {}
AllFormulas[4072330].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072330].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end
, [2] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
}}}
AllFormulas[4072331] = {}
AllFormulas[4072331].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072331].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的不错啊！#40"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
}}}
AllFormulas[4072332] = {}
AllFormulas[4072332].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072332].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的好棒啊！#86"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
}}}
AllFormulas[4072333] = {}
AllFormulas[4072333].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072333].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
}}}
AllFormulas[4072334] = {}
AllFormulas[4072334].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072334].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
}}}
AllFormulas[4072335] = {}
AllFormulas[4072335].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072335].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你也好，叽！#62"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
}}}
AllFormulas[4072336] = {}
AllFormulas[4072336].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072336].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人做什么事都客客气气的！#56"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
}}}
AllFormulas[4072337] = {}
AllFormulas[4072337].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072337].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
}}}
AllFormulas[4072338] = {}
AllFormulas[4072338].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072338].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
}}}
AllFormulas[4072339] = {}
AllFormulas[4072339].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072339].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的伞伞比我的大！#52"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
}}}
AllFormulas[4072340] = {}
AllFormulas[4072340].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072340].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人锄地我浇水！#59"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
}}}
AllFormulas[4072341] = {}
AllFormulas[4072341].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072341].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人浇水我锄地！#46"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
}}}
AllFormulas[4072342] = {}
AllFormulas[4072342].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072342].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
}}}
AllFormulas[4072343] = {}
AllFormulas[4072343].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072343].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人抱抱！#17"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
}}}
AllFormulas[4072344] = {}
AllFormulas[4072344].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072344].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
}}}
AllFormulas[4072345] = {}
AllFormulas[4072345].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072345].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
}}}
AllFormulas[4072346] = {}
AllFormulas[4072346].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072346].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
}}}
AllFormulas[4072347] = {}
AllFormulas[4072347].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072347].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072348] = {}
AllFormulas[4072348].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072348].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072349] = {}
AllFormulas[4072349].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072349].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072350] = {}
AllFormulas[4072350].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072350].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072351] = {}
AllFormulas[4072351].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072351].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072352] = {}
AllFormulas[4072352].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072352].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072353] = {}
AllFormulas[4072353].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072353].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4072354] = {}
AllFormulas[4072354].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072354].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4072355] = {}
AllFormulas[4072355].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072355].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4072356] = {}
AllFormulas[4072356].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072356].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
, [2] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4072357] = {}
AllFormulas[4072357].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072357].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，俺们一起杀了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072400] = {}
AllFormulas[4072400].Condition = function(self)
  return "#Y那家伙，爆他装备！#113"
end

AllFormulas[4072400].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072401] = {}
AllFormulas[4072401].Condition = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end

AllFormulas[4072401].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072402] = {}
AllFormulas[4072402].Condition = function(self)
  return "哟，师侄#G"
end

AllFormulas[4072402].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
}}}
AllFormulas[4072403] = {}
AllFormulas[4072403].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072403].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，#G"
end
}}}
AllFormulas[4072404] = {}
AllFormulas[4072404].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072404].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4072405] = {}
AllFormulas[4072405].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072405].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4072406] = {}
AllFormulas[4072406].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072406].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4072407] = {}
AllFormulas[4072407].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072407].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "杀啊！先灭了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072408] = {}
AllFormulas[4072408].Condition = function(self)
  return "#Y！#140"
end

AllFormulas[4072408].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072409] = {}
AllFormulas[4072409].Condition = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end

AllFormulas[4072409].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072410] = {}
AllFormulas[4072410].Condition = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end

AllFormulas[4072410].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072411] = {}
AllFormulas[4072411].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072411].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4072412] = {}
AllFormulas[4072412].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072412].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072413] = {}
AllFormulas[4072413].Condition = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end

AllFormulas[4072413].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072414] = {}
AllFormulas[4072414].Condition = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end

AllFormulas[4072414].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072415] = {}
AllFormulas[4072415].Condition = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end

AllFormulas[4072415].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
, [4] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
}}}
AllFormulas[4072416] = {}
AllFormulas[4072416].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072416].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "别管队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072417] = {}
AllFormulas[4072417].Condition = function(self)
  return "#Y，俺们先一起杀过去！#90"
end

AllFormulas[4072417].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072418] = {}
AllFormulas[4072418].Condition = function(self)
  return "队里的#G"
end

AllFormulas[4072418].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
}}}
AllFormulas[4072419] = {}
AllFormulas[4072419].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072419].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
}}}
AllFormulas[4072420] = {}
AllFormulas[4072420].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4072420].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "有好东西，大哥快抢！#18"
end
}}}
AllFormulas[4072421] = {}
AllFormulas[4072421].Condition = function(self)
  return true
end

AllFormulas[4072421].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end
}}}
AllFormulas[4072422] = {}
AllFormulas[4072422].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072422].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end
}}}
AllFormulas[4072423] = {}
AllFormulas[4072423].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072423].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end
}}}
AllFormulas[4072424] = {}
AllFormulas[4072424].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072424].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end
}}}
AllFormulas[4072425] = {}
AllFormulas[4072425].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072425].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end
}}}
AllFormulas[4072426] = {}
AllFormulas[4072426].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072426].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end
}}}
AllFormulas[4072427] = {}
AllFormulas[4072427].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4072427].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "还偷啥，直接抢啊！#21"
end
}}}
AllFormulas[4072428] = {}
AllFormulas[4072428].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4072428].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end
}}}
AllFormulas[4072429] = {}
AllFormulas[4072429].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end

AllFormulas[4072429].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end
}}}
AllFormulas[4072430] = {}
AllFormulas[4072430].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072430].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end
}}}
AllFormulas[4072431] = {}
AllFormulas[4072431].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072431].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这#G"
end
}}}
AllFormulas[4072432] = {}
AllFormulas[4072432].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072432].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4072433] = {}
AllFormulas[4072433].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072433].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4072434] = {}
AllFormulas[4072434].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072434].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
, [2] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
}}}
AllFormulas[4072435] = {}
AllFormulas[4072435].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072435].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "升的不行啊！#64"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
}}}
AllFormulas[4072436] = {}
AllFormulas[4072436].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072436].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这样升才给力嘛！#145"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
}}}
AllFormulas[4072437] = {}
AllFormulas[4072437].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072437].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "升成这样怎么杀人啊！#15"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
}}}
AllFormulas[4072438] = {}
AllFormulas[4072438].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072438].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
}}}
AllFormulas[4072439] = {}
AllFormulas[4072439].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072439].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥好，大哥打怪去！#51"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
}}}
AllFormulas[4072440] = {}
AllFormulas[4072440].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072440].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你干吗呢？#2"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
}}}
AllFormulas[4072441] = {}
AllFormulas[4072441].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072441].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
}}}
AllFormulas[4072442] = {}
AllFormulas[4072442].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072442].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
}}}
AllFormulas[4072443] = {}
AllFormulas[4072443].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072443].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
}}}
AllFormulas[4072444] = {}
AllFormulas[4072444].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072444].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
}}}
AllFormulas[4072445] = {}
AllFormulas[4072445].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072445].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "淹死他，狠狠的浇！#102"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
}}}
AllFormulas[4072446] = {}
AllFormulas[4072446].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072446].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "扫帚杀人不好使吧？#119"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
}}}
AllFormulas[4072447] = {}
AllFormulas[4072447].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072447].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
}}}
AllFormulas[4072448] = {}
AllFormulas[4072448].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072448].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
}}}
AllFormulas[4072449] = {}
AllFormulas[4072449].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072449].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
}}}
AllFormulas[4072450] = {}
AllFormulas[4072450].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072450].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
}}}
AllFormulas[4072451] = {}
AllFormulas[4072451].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072451].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072452] = {}
AllFormulas[4072452].Condition = function(self)
  return "召唤出来1"
end

AllFormulas[4072452].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072453] = {}
AllFormulas[4072453].Condition = function(self)
  return "召唤出来2"
end

AllFormulas[4072453].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072454] = {}
AllFormulas[4072454].Condition = function(self)
  return "召唤出来3"
end

AllFormulas[4072454].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072455] = {}
AllFormulas[4072455].Condition = function(self)
  return "主人你看我跑的多欢"
end

AllFormulas[4072455].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072456] = {}
AllFormulas[4072456].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072456].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "老师，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072457] = {}
AllFormulas[4072457].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072457].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "徒弟，你真给力 "
end
}}}
AllFormulas[4072500] = {}
AllFormulas[4072500].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072500].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072501] = {}
AllFormulas[4072501].Condition = function(self)
  return "哥们，你真给力 "
end

AllFormulas[4072501].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072502] = {}
AllFormulas[4072502].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072502].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "亲爱的，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072503] = {}
AllFormulas[4072503].Condition = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end

AllFormulas[4072503].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072504] = {}
AllFormulas[4072504].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072504].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return Rand(0.003)
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072505] = {}
AllFormulas[4072505].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4072505].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [4] = function(self)
  return true
end
}}}
AllFormulas[4072506] = {}
AllFormulas[4072506].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072506].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人我升到了 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
, [3] = function(self)
  return " 级"
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072507] = {}
AllFormulas[4072507].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072507].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的技能#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [3] = function(self)
  return "#Y好牛逼啊"
end
, [4] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
}}}
AllFormulas[4072508] = {}
AllFormulas[4072508].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072508].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
, [3] = function(self)
  return " ， 名字 "
end
, [4] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072509] = {}
AllFormulas[4072509].Condition = function(self)
  return " , hp = "
end

AllFormulas[4072509].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
, [3] = function(self)
  return self.m_pCurEventParam[4]
end
, [4] = function(self)
  return ", Full= "
end
}}}
AllFormulas[4072510] = {}
AllFormulas[4072510].Condition = function(self)
  return self.m_pCurEventParam[5]
end

AllFormulas[4072510].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == 0
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人，你的队友 "
end
, [4] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072511] = {}
AllFormulas[4072511].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4072511].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4072512] = {}
AllFormulas[4072512].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4072512].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4072513] = {}
AllFormulas[4072513].Condition = function(self)
  return ", Full= "
end

AllFormulas[4072513].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4072514] = {}
AllFormulas[4072514].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072514].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "紫装你好 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072515] = {}
AllFormulas[4072515].Condition = function(self)
  return true
end

AllFormulas[4072515].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "恭喜主人升到 "
end
, [3] = function(self)
  return self.m_pCurEventParam[1]
end
, [4] = function(self)
  return " 级"
end
}}}
AllFormulas[4072516] = {}
AllFormulas[4072516].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072516].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人， "
end
}}}
AllFormulas[4072517] = {}
AllFormulas[4072517].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072517].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "的店 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072518] = {}
AllFormulas[4072518].Condition = function(self)
  return " 不错嘛"
end

AllFormulas[4072518].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072519] = {}
AllFormulas[4072519].Condition = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end

AllFormulas[4072519].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072520] = {}
AllFormulas[4072520].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4072520].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能 "
end
}}}
AllFormulas[4072521] = {}
AllFormulas[4072521].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072521].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 好牛逼啊"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
}}}
AllFormulas[4072522] = {}
AllFormulas[4072522].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072522].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你完成了 "
end
}}}
AllFormulas[4072523] = {}
AllFormulas[4072523].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072523].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 任务 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072524] = {}
AllFormulas[4072524].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072524].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人 Id 为 "
end
}}}
AllFormulas[4072525] = {}
AllFormulas[4072525].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072525].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 的 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072526] = {}
AllFormulas[4072526].Condition = function(self)
  return " 找你"
end

AllFormulas[4072526].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4072527] = {}
AllFormulas[4072527].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end

AllFormulas[4072527].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end
}}}
AllFormulas[4072528] = {}
AllFormulas[4072528].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end

AllFormulas[4072528].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end
}}}
AllFormulas[4072529] = {}
AllFormulas[4072529].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end

AllFormulas[4072529].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end
}}}
AllFormulas[4072530] = {}
AllFormulas[4072530].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end

AllFormulas[4072530].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end
}}}
AllFormulas[4072531] = {}
AllFormulas[4072531].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end

AllFormulas[4072531].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end
}}}
AllFormulas[4072532] = {}
AllFormulas[4072532].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end

AllFormulas[4072532].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072533] = {}
AllFormulas[4072533].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072533].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072534] = {}
AllFormulas[4072534].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072534].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，小鸡在此！#51"
end
}}}
AllFormulas[4072535] = {}
AllFormulas[4072535].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4072535].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
}}}
AllFormulas[4072536] = {}
AllFormulas[4072536].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4072536].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
}}}
AllFormulas[4072537] = {}
AllFormulas[4072537].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4072537].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
}}}
AllFormulas[4072538] = {}
AllFormulas[4072538].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4072538].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，那个#G"
end
}}}
AllFormulas[4072539] = {}
AllFormulas[4072539].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072539].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072540] = {}
AllFormulas[4072540].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072540].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072541] = {}
AllFormulas[4072541].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072541].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的徒弟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072542] = {}
AllFormulas[4072542].Condition = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end

AllFormulas[4072542].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072543] = {}
AllFormulas[4072543].Condition = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end

AllFormulas[4072543].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072544] = {}
AllFormulas[4072544].Condition = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end

AllFormulas[4072544].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072545] = {}
AllFormulas[4072545].Condition = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end

AllFormulas[4072545].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072546] = {}
AllFormulas[4072546].Condition = function(self)
  return "#G"
end

AllFormulas[4072546].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y来了，主人小心啊！#47"
end
}}}
AllFormulas[4072547] = {}
AllFormulas[4072547].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072547].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
}}}
AllFormulas[4072548] = {}
AllFormulas[4072548].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072548].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "吃我一扇，我要把你这个#G"
end
}}}
AllFormulas[4072549] = {}
AllFormulas[4072549].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072549].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y扇跑！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072550] = {}
AllFormulas[4072550].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072550].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072551] = {}
AllFormulas[4072551].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072551].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，小鸡会想念你的……#14"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4072552] = {}
AllFormulas[4072552].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072552].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人要跟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072553] = {}
AllFormulas[4072553].Condition = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end

AllFormulas[4072553].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072554] = {}
AllFormulas[4072554].Condition = function(self)
  return "小鸡我升到了#G"
end

AllFormulas[4072554].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end
}}}
AllFormulas[4072555] = {}
AllFormulas[4072555].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072555].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end
}}}
AllFormulas[4072556] = {}
AllFormulas[4072556].Condition = function(self)
  return true
end

AllFormulas[4072556].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好帅的一招#G"
end
}}}
AllFormulas[4072557] = {}
AllFormulas[4072557].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4072557].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
}}}
AllFormulas[4072600] = {}
AllFormulas[4072600].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072600].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072601] = {}
AllFormulas[4072601].Condition = function(self)
  return "#Y受伤了，好可怜呢。#14"
end

AllFormulas[4072601].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072602] = {}
AllFormulas[4072602].Condition = function(self)
  return "主人，你的队友#G"
end

AllFormulas[4072602].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end
}}}
AllFormulas[4072603] = {}
AllFormulas[4072603].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072603].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
}}}
AllFormulas[4072604] = {}
AllFormulas[4072604].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4072604].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
, [3] = function(self)
  return true
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072605] = {}
AllFormulas[4072605].Condition = function(self)
  return "主人升到#G"
end

AllFormulas[4072605].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072606] = {}
AllFormulas[4072606].Condition = function(self)
  return "#G"
end

AllFormulas[4072606].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [3] = function(self)
  return Rand(0.001)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072607] = {}
AllFormulas[4072607].Condition = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end

AllFormulas[4072607].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072608] = {}
AllFormulas[4072608].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072608].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
}}}
AllFormulas[4072609] = {}
AllFormulas[4072609].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4072609].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
, [3] = function(self)
  return Rand(0.1)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072610] = {}
AllFormulas[4072610].Condition = function(self)
  return "主人的#G"
end

AllFormulas[4072610].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072611] = {}
AllFormulas[4072611].Condition = function(self)
  return "主人穿这么少，不会冻着么？#55"
end

AllFormulas[4072611].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072612] = {}
AllFormulas[4072612].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4072612].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end
, [4] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4072613] = {}
AllFormulas[4072613].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072613].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4072614] = {}
AllFormulas[4072614].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072614].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end
, [2] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
}}}
AllFormulas[4072615] = {}
AllFormulas[4072615].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072615].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的不错啊！#40"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人升的好棒啊！#86"
end
}}}
AllFormulas[4072616] = {}
AllFormulas[4072616].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4072616].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end
}}}
AllFormulas[4072617] = {}
AllFormulas[4072617].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4072617].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end
}}}
AllFormulas[4072618] = {}
AllFormulas[4072618].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4072618].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你也好，叽！#62"
end
}}}
AllFormulas[4072619] = {}
AllFormulas[4072619].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4072619].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人做什么事都客客气气的！#56"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072620] = {}
AllFormulas[4072620].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4072620].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
}}}
AllFormulas[4072621] = {}
AllFormulas[4072621].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072621].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的伞伞比我的大！#52"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人锄地我浇水！#59"
end
, [5] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [6] = function()
  return "#CFFFF00"
end
, [7] = function(self)
  return "主人浇水我锄地！#46"
end
, [8] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [9] = function()
  return "#CFFFF00"
end
, [10] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
}}}
AllFormulas[4072622] = {}
AllFormulas[4072622].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4072622].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人抱抱！#17"
end
}}}
AllFormulas[4072623] = {}
AllFormulas[4072623].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4072623].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end
}}}
AllFormulas[4072624] = {}
AllFormulas[4072624].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4072624].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end
}}}
AllFormulas[4072625] = {}
AllFormulas[4072625].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4072625].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end
}}}
AllFormulas[4072626] = {}
AllFormulas[4072626].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4072626].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end
}}}
AllFormulas[4072627] = {}
AllFormulas[4072627].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072627].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
}}}
AllFormulas[4072628] = {}
AllFormulas[4072628].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072628].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072629] = {}
AllFormulas[4072629].Condition = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end

AllFormulas[4072629].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072630] = {}
AllFormulas[4072630].Condition = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end

AllFormulas[4072630].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072631] = {}
AllFormulas[4072631].Condition = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end

AllFormulas[4072631].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072632] = {}
AllFormulas[4072632].Condition = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end

AllFormulas[4072632].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072633] = {}
AllFormulas[4072633].Condition = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end

AllFormulas[4072633].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072634] = {}
AllFormulas[4072634].Condition = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end

AllFormulas[4072634].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072635] = {}
AllFormulas[4072635].Condition = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end

AllFormulas[4072635].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072636] = {}
AllFormulas[4072636].Condition = function(self)
  return "大哥，俺们一起杀了#G"
end

AllFormulas[4072636].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
}}}
AllFormulas[4072637] = {}
AllFormulas[4072637].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072637].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
}}}
AllFormulas[4072638] = {}
AllFormulas[4072638].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072638].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哟，师侄#G"
end
}}}
AllFormulas[4072639] = {}
AllFormulas[4072639].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072639].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072640] = {}
AllFormulas[4072640].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072640].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072641] = {}
AllFormulas[4072641].Condition = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end

AllFormulas[4072641].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072642] = {}
AllFormulas[4072642].Condition = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end

AllFormulas[4072642].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072643] = {}
AllFormulas[4072643].Condition = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end

AllFormulas[4072643].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072644] = {}
AllFormulas[4072644].Condition = function(self)
  return "杀啊！先灭了#G"
end

AllFormulas[4072644].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y！#140"
end
}}}
AllFormulas[4072645] = {}
AllFormulas[4072645].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072645].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
}}}
AllFormulas[4072646] = {}
AllFormulas[4072646].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072646].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
}}}
AllFormulas[4072647] = {}
AllFormulas[4072647].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072647].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
}}}
AllFormulas[4072648] = {}
AllFormulas[4072648].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072648].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
}}}
AllFormulas[4072649] = {}
AllFormulas[4072649].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4072649].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4072650] = {}
AllFormulas[4072650].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072650].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072651] = {}
AllFormulas[4072651].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072651].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072652] = {}
AllFormulas[4072652].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072652].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072653] = {}
AllFormulas[4072653].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072653].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
}}}
AllFormulas[4072654] = {}
AllFormulas[4072654].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072654].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "别管队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072655] = {}
AllFormulas[4072655].Condition = function(self)
  return "#Y，俺们先一起杀过去！#90"
end

AllFormulas[4072655].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072656] = {}
AllFormulas[4072656].Condition = function(self)
  return "队里的#G"
end

AllFormulas[4072656].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
}}}
AllFormulas[4072657] = {}
AllFormulas[4072657].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072657].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
}}}
AllFormulas[4072700] = {}
AllFormulas[4072700].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4072700].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "有好东西，大哥快抢！#18"
end
}}}
AllFormulas[4072701] = {}
AllFormulas[4072701].Condition = function(self)
  return true
end

AllFormulas[4072701].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end
}}}
AllFormulas[4072702] = {}
AllFormulas[4072702].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072702].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end
}}}
AllFormulas[4072703] = {}
AllFormulas[4072703].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072703].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end
}}}
AllFormulas[4072704] = {}
AllFormulas[4072704].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072704].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072705] = {}
AllFormulas[4072705].Condition = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end

AllFormulas[4072705].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072706] = {}
AllFormulas[4072706].Condition = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end

AllFormulas[4072706].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "还偷啥，直接抢啊！#21"
end
, [4] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4072707] = {}
AllFormulas[4072707].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072707].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end
}}}
AllFormulas[4072708] = {}
AllFormulas[4072708].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072708].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end
}}}
AllFormulas[4072709] = {}
AllFormulas[4072709].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072709].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这#G"
end
}}}
AllFormulas[4072710] = {}
AllFormulas[4072710].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072710].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
}}}
AllFormulas[4072711] = {}
AllFormulas[4072711].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4072711].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
}}}
AllFormulas[4072712] = {}
AllFormulas[4072712].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4072712].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升的不行啊！#64"
end
}}}
AllFormulas[4072713] = {}
AllFormulas[4072713].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end

AllFormulas[4072713].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这样升才给力嘛！#145"
end
}}}
AllFormulas[4072714] = {}
AllFormulas[4072714].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4072714].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升成这样怎么杀人啊！#15"
end
}}}
AllFormulas[4072715] = {}
AllFormulas[4072715].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4072715].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072716] = {}
AllFormulas[4072716].Condition = function(self)
  return "大哥好，大哥打怪去！#51"
end

AllFormulas[4072716].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072717] = {}
AllFormulas[4072717].Condition = function(self)
  return "大哥你干吗呢？#2"
end

AllFormulas[4072717].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072718] = {}
AllFormulas[4072718].Condition = function(self)
  return "甭睡了，快起来刷怪！#46"
end

AllFormulas[4072718].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072719] = {}
AllFormulas[4072719].Condition = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end

AllFormulas[4072719].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
}}}
AllFormulas[4072720] = {}
AllFormulas[4072720].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072720].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "淹死他，狠狠的浇！#102"
end
}}}
AllFormulas[4072721] = {}
AllFormulas[4072721].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4072721].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "扫帚杀人不好使吧？#119"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072722] = {}
AllFormulas[4072722].Condition = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end

AllFormulas[4072722].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072723] = {}
AllFormulas[4072723].Condition = function(self)
  return "大哥，你嘟囔啥呢？#132"
end

AllFormulas[4072723].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072724] = {}
AllFormulas[4072724].Condition = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end

AllFormulas[4072724].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072725] = {}
AllFormulas[4072725].Condition = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end

AllFormulas[4072725].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072726] = {}
AllFormulas[4072726].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072726].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来1"
end
}}}
AllFormulas[4072727] = {}
AllFormulas[4072727].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072727].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来2"
end
}}}
AllFormulas[4072728] = {}
AllFormulas[4072728].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072728].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "召唤出来3"
end
}}}
AllFormulas[4072729] = {}
AllFormulas[4072729].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072729].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你看我跑的多欢"
end
}}}
AllFormulas[4072730] = {}
AllFormulas[4072730].Condition = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4072730].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072731] = {}
AllFormulas[4072731].Condition = function(self)
  return "老师，你真给力 "
end

AllFormulas[4072731].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072732] = {}
AllFormulas[4072732].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072732].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "徒弟，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072733] = {}
AllFormulas[4072733].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072733].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哥们，你真给力 "
end
}}}
AllFormulas[4072734] = {}
AllFormulas[4072734].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072734].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072735] = {}
AllFormulas[4072735].Condition = function(self)
  return "亲爱的，你真给力 "
end

AllFormulas[4072735].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
}}}
AllFormulas[4072736] = {}
AllFormulas[4072736].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072736].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072737] = {}
AllFormulas[4072737].Condition = function(self)
  return "打死你  "
end

AllFormulas[4072737].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072738] = {}
AllFormulas[4072738].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072738].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072739] = {}
AllFormulas[4072739].Condition = function(self)
  return "打死你  "
end

AllFormulas[4072739].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072740] = {}
AllFormulas[4072740].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072740].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人我升到了 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072741] = {}
AllFormulas[4072741].Condition = function(self)
  return " 级"
end

AllFormulas[4072741].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072742] = {}
AllFormulas[4072742].Condition = function(self)
  return "主人，你的技能#G"
end

AllFormulas[4072742].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y好牛逼啊"
end
}}}
AllFormulas[4072743] = {}
AllFormulas[4072743].Condition = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end

AllFormulas[4072743].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
}}}
AllFormulas[4072744] = {}
AllFormulas[4072744].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072744].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " ， 名字 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072745] = {}
AllFormulas[4072745].Condition = function(self)
  return " , hp = "
end

AllFormulas[4072745].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4072746] = {}
AllFormulas[4072746].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4072746].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4072747] = {}
AllFormulas[4072747].Condition = function(self)
  return self.m_pCurEventParam[3] == 0
end

AllFormulas[4072747].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友 "
end
}}}
AllFormulas[4072748] = {}
AllFormulas[4072748].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072748].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " ， 名字 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072749] = {}
AllFormulas[4072749].Condition = function(self)
  return " , hp = "
end

AllFormulas[4072749].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3]
end
, [2] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4072750] = {}
AllFormulas[4072750].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4072750].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
}}}
AllFormulas[4072751] = {}
AllFormulas[4072751].Condition = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end

AllFormulas[4072751].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "紫装你好 "
end
}}}
AllFormulas[4072752] = {}
AllFormulas[4072752].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072752].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072753] = {}
AllFormulas[4072753].Condition = function(self)
  return "恭喜主人升到 "
end

AllFormulas[4072753].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 级"
end
}}}
AllFormulas[4072754] = {}
AllFormulas[4072754].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072754].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人， "
end
}}}
AllFormulas[4072755] = {}
AllFormulas[4072755].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072755].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "的店 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072756] = {}
AllFormulas[4072756].Condition = function(self)
  return " 不错嘛"
end

AllFormulas[4072756].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072757] = {}
AllFormulas[4072757].Condition = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end

AllFormulas[4072757].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072800] = {}
AllFormulas[4072800].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072800].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4072801] = {}
AllFormulas[4072801].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072801].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的技能 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072802] = {}
AllFormulas[4072802].Condition = function(self)
  return " 好牛逼啊"
end

AllFormulas[4072802].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072803] = {}
AllFormulas[4072803].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072803].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你完成了 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072804] = {}
AllFormulas[4072804].Condition = function(self)
  return " 任务 "
end

AllFormulas[4072804].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072805] = {}
AllFormulas[4072805].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072805].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人 Id 为 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
, [3] = function(self)
  return " 的 "
end
, [4] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072806] = {}
AllFormulas[4072806].Condition = function(self)
  return " 找你"
end

AllFormulas[4072806].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4072807] = {}
AllFormulas[4072807].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end

AllFormulas[4072807].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end
}}}
AllFormulas[4072808] = {}
AllFormulas[4072808].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end

AllFormulas[4072808].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end
}}}
AllFormulas[4072809] = {}
AllFormulas[4072809].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end

AllFormulas[4072809].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end
}}}
AllFormulas[4072810] = {}
AllFormulas[4072810].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end

AllFormulas[4072810].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
}}}
AllFormulas[4072811] = {}
AllFormulas[4072811].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end

AllFormulas[4072811].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072812] = {}
AllFormulas[4072812].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072812].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4072813] = {}
AllFormulas[4072813].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072813].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072814] = {}
AllFormulas[4072814].Condition = function(self)
  return "主人主人，小鸡在此！#51"
end

AllFormulas[4072814].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072815] = {}
AllFormulas[4072815].Condition = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end

AllFormulas[4072815].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
, [4] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4072816] = {}
AllFormulas[4072816].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072816].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
, [2] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4072817] = {}
AllFormulas[4072817].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072817].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，那个#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072818] = {}
AllFormulas[4072818].Condition = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end

AllFormulas[4072818].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072819] = {}
AllFormulas[4072819].Condition = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end

AllFormulas[4072819].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072820] = {}
AllFormulas[4072820].Condition = function(self)
  return "主人，你的徒弟#G"
end

AllFormulas[4072820].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
}}}
AllFormulas[4072821] = {}
AllFormulas[4072821].Condition = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072821].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
}}}
AllFormulas[4072822] = {}
AllFormulas[4072822].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end

AllFormulas[4072822].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4072823] = {}
AllFormulas[4072823].Condition = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end

AllFormulas[4072823].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
}}}
AllFormulas[4072824] = {}
AllFormulas[4072824].Condition = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end

AllFormulas[4072824].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4072825] = {}
AllFormulas[4072825].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072825].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，主人小心啊！#47"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072826] = {}
AllFormulas[4072826].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072826].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072827] = {}
AllFormulas[4072827].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072827].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "吃我一扇，我要把你这个#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072828] = {}
AllFormulas[4072828].Condition = function(self)
  return "#Y扇跑！#78"
end

AllFormulas[4072828].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072829] = {}
AllFormulas[4072829].Condition = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end

AllFormulas[4072829].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072830] = {}
AllFormulas[4072830].Condition = function(self)
  return "主人，小鸡会想念你的……#14"
end

AllFormulas[4072830].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072831] = {}
AllFormulas[4072831].Condition = function(self)
  return "主人要跟#G"
end

AllFormulas[4072831].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
}}}
AllFormulas[4072832] = {}
AllFormulas[4072832].Condition = function(self)
  return true
end

AllFormulas[4072832].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "小鸡我升到了#G"
end
}}}
AllFormulas[4072833] = {}
AllFormulas[4072833].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4072833].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072834] = {}
AllFormulas[4072834].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072834].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072835] = {}
AllFormulas[4072835].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072835].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "好帅的一招#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4072836] = {}
AllFormulas[4072836].Condition = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end

AllFormulas[4072836].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072837] = {}
AllFormulas[4072837].Condition = function(self)
  return "主人，你的队友#G"
end

AllFormulas[4072837].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
}}}
AllFormulas[4072838] = {}
AllFormulas[4072838].Condition = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end

AllFormulas[4072838].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4072839] = {}
AllFormulas[4072839].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072839].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072840] = {}
AllFormulas[4072840].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072840].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
, [2] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
}}}
AllFormulas[4072841] = {}
AllFormulas[4072841].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072841].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072842] = {}
AllFormulas[4072842].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072842].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升到#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4072843] = {}
AllFormulas[4072843].Condition = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end

AllFormulas[4072843].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072844] = {}
AllFormulas[4072844].Condition = function(self)
  return "#G"
end

AllFormulas[4072844].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
}}}
AllFormulas[4072845] = {}
AllFormulas[4072845].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072845].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
}}}
AllFormulas[4072846] = {}
AllFormulas[4072846].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072846].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
}}}
AllFormulas[4072847] = {}
AllFormulas[4072847].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072847].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
}}}
AllFormulas[4072848] = {}
AllFormulas[4072848].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072848].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
}}}
AllFormulas[4072849] = {}
AllFormulas[4072849].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4072849].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
}}}
AllFormulas[4072850] = {}
AllFormulas[4072850].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4072850].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的#G"
end
}}}
AllFormulas[4072851] = {}
AllFormulas[4072851].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4072851].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
}}}
AllFormulas[4072852] = {}
AllFormulas[4072852].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072852].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人穿这么少，不会冻着么？#55"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072853] = {}
AllFormulas[4072853].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072853].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4072854] = {}
AllFormulas[4072854].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072854].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4072855] = {}
AllFormulas[4072855].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072855].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4072856] = {}
AllFormulas[4072856].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072856].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end
, [2] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
}}}
AllFormulas[4072857] = {}
AllFormulas[4072857].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072857].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的不错啊！#40"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
}}}
AllFormulas[4072900] = {}
AllFormulas[4072900].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072900].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的好棒啊！#86"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
}}}
AllFormulas[4072901] = {}
AllFormulas[4072901].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072901].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
}}}
AllFormulas[4072902] = {}
AllFormulas[4072902].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072902].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
}}}
AllFormulas[4072903] = {}
AllFormulas[4072903].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072903].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你也好，叽！#62"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
}}}
AllFormulas[4072904] = {}
AllFormulas[4072904].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072904].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人做什么事都客客气气的！#56"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
}}}
AllFormulas[4072905] = {}
AllFormulas[4072905].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072905].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end
}}}
AllFormulas[4072906] = {}
AllFormulas[4072906].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4072906].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的伞伞比我的大！#52"
end
}}}
AllFormulas[4072907] = {}
AllFormulas[4072907].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4072907].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人锄地我浇水！#59"
end
}}}
AllFormulas[4072908] = {}
AllFormulas[4072908].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4072908].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人浇水我锄地！#46"
end
}}}
AllFormulas[4072909] = {}
AllFormulas[4072909].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4072909].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end
}}}
AllFormulas[4072910] = {}
AllFormulas[4072910].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4072910].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人抱抱！#17"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072911] = {}
AllFormulas[4072911].Condition = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end

AllFormulas[4072911].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072912] = {}
AllFormulas[4072912].Condition = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end

AllFormulas[4072912].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072913] = {}
AllFormulas[4072913].Condition = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end

AllFormulas[4072913].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072914] = {}
AllFormulas[4072914].Condition = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end

AllFormulas[4072914].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072915] = {}
AllFormulas[4072915].Condition = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end

AllFormulas[4072915].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072916] = {}
AllFormulas[4072916].Condition = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end

AllFormulas[4072916].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072917] = {}
AllFormulas[4072917].Condition = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end

AllFormulas[4072917].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072918] = {}
AllFormulas[4072918].Condition = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end

AllFormulas[4072918].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072919] = {}
AllFormulas[4072919].Condition = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end

AllFormulas[4072919].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end
, [4] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4072920] = {}
AllFormulas[4072920].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072920].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
, [2] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4072921] = {}
AllFormulas[4072921].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072921].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
, [2] = function(self)
  return Rand(0.0001)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
, [5] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [6] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072922] = {}
AllFormulas[4072922].Condition = function(self)
  return "大哥，俺们一起杀了#G"
end

AllFormulas[4072922].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
}}}
AllFormulas[4072923] = {}
AllFormulas[4072923].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072923].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
}}}
AllFormulas[4072924] = {}
AllFormulas[4072924].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4072924].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哟，师侄#G"
end
}}}
AllFormulas[4072925] = {}
AllFormulas[4072925].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072925].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4072926] = {}
AllFormulas[4072926].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072926].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4072927] = {}
AllFormulas[4072927].Condition = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end

AllFormulas[4072927].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072928] = {}
AllFormulas[4072928].Condition = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end

AllFormulas[4072928].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072929] = {}
AllFormulas[4072929].Condition = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end

AllFormulas[4072929].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072930] = {}
AllFormulas[4072930].Condition = function(self)
  return "杀啊！先灭了#G"
end

AllFormulas[4072930].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y！#140"
end
}}}
AllFormulas[4072931] = {}
AllFormulas[4072931].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072931].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
}}}
AllFormulas[4072932] = {}
AllFormulas[4072932].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072932].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
}}}
AllFormulas[4072933] = {}
AllFormulas[4072933].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072933].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
}}}
AllFormulas[4072934] = {}
AllFormulas[4072934].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072934].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
}}}
AllFormulas[4072935] = {}
AllFormulas[4072935].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4072935].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4072936] = {}
AllFormulas[4072936].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4072936].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072937] = {}
AllFormulas[4072937].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072937].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4072938] = {}
AllFormulas[4072938].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072938].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4072939] = {}
AllFormulas[4072939].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072939].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end
}}}
AllFormulas[4072940] = {}
AllFormulas[4072940].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072940].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "别管队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4072941] = {}
AllFormulas[4072941].Condition = function(self)
  return "#Y，俺们先一起杀过去！#90"
end

AllFormulas[4072941].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4072942] = {}
AllFormulas[4072942].Condition = function(self)
  return "队里的#G"
end

AllFormulas[4072942].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end
}}}
AllFormulas[4072943] = {}
AllFormulas[4072943].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4072943].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end
}}}
AllFormulas[4072944] = {}
AllFormulas[4072944].Condition = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end

AllFormulas[4072944].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "有好东西，大哥快抢！#18"
end
}}}
AllFormulas[4072945] = {}
AllFormulas[4072945].Condition = function(self)
  return true
end

AllFormulas[4072945].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end
}}}
AllFormulas[4072946] = {}
AllFormulas[4072946].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072946].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end
}}}
AllFormulas[4072947] = {}
AllFormulas[4072947].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4072947].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end
}}}
AllFormulas[4072948] = {}
AllFormulas[4072948].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072948].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end
}}}
AllFormulas[4072949] = {}
AllFormulas[4072949].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072949].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end
}}}
AllFormulas[4072950] = {}
AllFormulas[4072950].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072950].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end
}}}
AllFormulas[4072951] = {}
AllFormulas[4072951].Condition = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end

AllFormulas[4072951].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "还偷啥，直接抢啊！#21"
end
}}}
AllFormulas[4072952] = {}
AllFormulas[4072952].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4072952].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end
}}}
AllFormulas[4072953] = {}
AllFormulas[4072953].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end

AllFormulas[4072953].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end
}}}
AllFormulas[4072954] = {}
AllFormulas[4072954].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072954].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end
}}}
AllFormulas[4072955] = {}
AllFormulas[4072955].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4072955].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这#G"
end
}}}
AllFormulas[4072956] = {}
AllFormulas[4072956].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4072956].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4072957] = {}
AllFormulas[4072957].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4072957].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4073000] = {}
AllFormulas[4073000].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073000].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
, [2] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
}}}
AllFormulas[4073001] = {}
AllFormulas[4073001].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073001].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "升的不行啊！#64"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
}}}
AllFormulas[4073002] = {}
AllFormulas[4073002].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073002].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这样升才给力嘛！#145"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
}}}
AllFormulas[4073003] = {}
AllFormulas[4073003].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073003].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "升成这样怎么杀人啊！#15"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
}}}
AllFormulas[4073004] = {}
AllFormulas[4073004].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073004].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "大哥好，大哥打怪去！#51"
end
}}}
AllFormulas[4073005] = {}
AllFormulas[4073005].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4073005].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你干吗呢？#2"
end
}}}
AllFormulas[4073006] = {}
AllFormulas[4073006].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4073006].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
, [3] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073007] = {}
AllFormulas[4073007].Condition = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end

AllFormulas[4073007].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073008] = {}
AllFormulas[4073008].Condition = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end

AllFormulas[4073008].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073009] = {}
AllFormulas[4073009].Condition = function(self)
  return "大哥这回换锄头砍人了？#144"
end

AllFormulas[4073009].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073010] = {}
AllFormulas[4073010].Condition = function(self)
  return "淹死他，狠狠的浇！#102"
end

AllFormulas[4073010].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "扫帚杀人不好使吧？#119"
end
, [4] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
}}}
AllFormulas[4073011] = {}
AllFormulas[4073011].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073011].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
}}}
AllFormulas[4073012] = {}
AllFormulas[4073012].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073012].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
}}}
AllFormulas[4073013] = {}
AllFormulas[4073013].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073013].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
}}}
AllFormulas[4073014] = {}
AllFormulas[4073014].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073014].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
}}}
AllFormulas[4073015] = {}
AllFormulas[4073015].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073015].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "召唤出来1"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073016] = {}
AllFormulas[4073016].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073016].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来2"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073017] = {}
AllFormulas[4073017].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073017].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来3"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073018] = {}
AllFormulas[4073018].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073018].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你看我跑的多欢"
end
, [2] = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
}}}
AllFormulas[4073019] = {}
AllFormulas[4073019].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4073019].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "老师，你真给力 "
end
}}}
AllFormulas[4073020] = {}
AllFormulas[4073020].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073020].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073021] = {}
AllFormulas[4073021].Condition = function(self)
  return "徒弟，你真给力 "
end

AllFormulas[4073021].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073022] = {}
AllFormulas[4073022].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073022].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "哥们，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073023] = {}
AllFormulas[4073023].Condition = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4073023].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "亲爱的，你真给力 "
end
}}}
AllFormulas[4073024] = {}
AllFormulas[4073024].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073024].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073025] = {}
AllFormulas[4073025].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073025].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4073026] = {}
AllFormulas[4073026].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073026].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073027] = {}
AllFormulas[4073027].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4073027].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "打死你  "
end
}}}
AllFormulas[4073028] = {}
AllFormulas[4073028].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073028].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073029] = {}
AllFormulas[4073029].Condition = function(self)
  return "主人我升到了 "
end

AllFormulas[4073029].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 级"
end
}}}
AllFormulas[4073030] = {}
AllFormulas[4073030].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073030].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能#G"
end
}}}
AllFormulas[4073031] = {}
AllFormulas[4073031].Condition = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end

AllFormulas[4073031].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y好牛逼啊"
end
, [2] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
}}}
AllFormulas[4073032] = {}
AllFormulas[4073032].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073032].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4073033] = {}
AllFormulas[4073033].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4073033].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4073034] = {}
AllFormulas[4073034].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4073034].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4073035] = {}
AllFormulas[4073035].Condition = function(self)
  return ", Full= "
end

AllFormulas[4073035].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == 0
end
}}}
AllFormulas[4073036] = {}
AllFormulas[4073036].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073036].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4073037] = {}
AllFormulas[4073037].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4073037].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
}}}
AllFormulas[4073038] = {}
AllFormulas[4073038].Condition = function(self)
  return self.m_pCurEventParam[3]
end

AllFormulas[4073038].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", curFull = "
end
, [2] = function(self)
  return self.m_pCurEventParam[4]
end
}}}
AllFormulas[4073039] = {}
AllFormulas[4073039].Condition = function(self)
  return ", Full= "
end

AllFormulas[4073039].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[5]
end
, [2] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4073040] = {}
AllFormulas[4073040].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073040].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "紫装你好 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073041] = {}
AllFormulas[4073041].Condition = function(self)
  return true
end

AllFormulas[4073041].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "恭喜主人升到 "
end
}}}
AllFormulas[4073042] = {}
AllFormulas[4073042].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4073042].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073043] = {}
AllFormulas[4073043].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073043].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人， "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073044] = {}
AllFormulas[4073044].Condition = function(self)
  return "的店 "
end

AllFormulas[4073044].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " 不错嘛"
end
}}}
AllFormulas[4073045] = {}
AllFormulas[4073045].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4073045].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
}}}
AllFormulas[4073046] = {}
AllFormulas[4073046].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4073046].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073047] = {}
AllFormulas[4073047].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4073047].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073048] = {}
AllFormulas[4073048].Condition = function(self)
  return "主人，你的技能 "
end

AllFormulas[4073048].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 好牛逼啊"
end
}}}
AllFormulas[4073049] = {}
AllFormulas[4073049].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end

AllFormulas[4073049].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073050] = {}
AllFormulas[4073050].Condition = function(self)
  return "主人你完成了 "
end

AllFormulas[4073050].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 任务 "
end
}}}
AllFormulas[4073051] = {}
AllFormulas[4073051].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073051].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073052] = {}
AllFormulas[4073052].Condition = function(self)
  return "主人 Id 为 "
end

AllFormulas[4073052].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " 的 "
end
}}}
AllFormulas[4073053] = {}
AllFormulas[4073053].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073053].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 找你"
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
}}}
AllFormulas[4073054] = {}
AllFormulas[4073054].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4073054].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end
, [2] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
}}}
AllFormulas[4073055] = {}
AllFormulas[4073055].Condition = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end

AllFormulas[4073055].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
}}}
AllFormulas[4073056] = {}
AllFormulas[4073056].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end

AllFormulas[4073056].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
}}}
AllFormulas[4073057] = {}
AllFormulas[4073057].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end

AllFormulas[4073057].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
}}}
AllFormulas[4073100] = {}
AllFormulas[4073100].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end

AllFormulas[4073100].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
}}}
AllFormulas[4073101] = {}
AllFormulas[4073101].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end

AllFormulas[4073101].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073102] = {}
AllFormulas[4073102].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4073102].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073103] = {}
AllFormulas[4073103].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4073103].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073104] = {}
AllFormulas[4073104].Condition = function(self)
  return "主人主人，小鸡在此！#51"
end

AllFormulas[4073104].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073105] = {}
AllFormulas[4073105].Condition = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end

AllFormulas[4073105].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073106] = {}
AllFormulas[4073106].Condition = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end

AllFormulas[4073106].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073107] = {}
AllFormulas[4073107].Condition = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end

AllFormulas[4073107].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073108] = {}
AllFormulas[4073108].Condition = function(self)
  return "主人主人，那个#G"
end

AllFormulas[4073108].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
}}}
AllFormulas[4073109] = {}
AllFormulas[4073109].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4073109].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
}}}
AllFormulas[4073110] = {}
AllFormulas[4073110].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4073110].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的徒弟#G"
end
}}}
AllFormulas[4073111] = {}
AllFormulas[4073111].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073111].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073112] = {}
AllFormulas[4073112].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073112].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
}}}
AllFormulas[4073113] = {}
AllFormulas[4073113].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073113].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4073114] = {}
AllFormulas[4073114].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073114].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4073115] = {}
AllFormulas[4073115].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073115].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return "#Y来了，主人小心啊！#47"
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073116] = {}
AllFormulas[4073116].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073116].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073117] = {}
AllFormulas[4073117].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073117].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "吃我一扇，我要把你这个#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073118] = {}
AllFormulas[4073118].Condition = function(self)
  return "#Y扇跑！#78"
end

AllFormulas[4073118].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073119] = {}
AllFormulas[4073119].Condition = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end

AllFormulas[4073119].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人，小鸡会想念你的……#14"
end
, [4] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4073120] = {}
AllFormulas[4073120].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073120].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人要跟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073121] = {}
AllFormulas[4073121].Condition = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end

AllFormulas[4073121].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "小鸡我升到了#G"
end
, [4] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4073122] = {}
AllFormulas[4073122].Condition = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end

AllFormulas[4073122].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073123] = {}
AllFormulas[4073123].Condition = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end

AllFormulas[4073123].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073124] = {}
AllFormulas[4073124].Condition = function(self)
  return "好帅的一招#G"
end

AllFormulas[4073124].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [2] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4073125] = {}
AllFormulas[4073125].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4073125].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4073126] = {}
AllFormulas[4073126].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073126].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4073127] = {}
AllFormulas[4073127].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073127].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4073128] = {}
AllFormulas[4073128].Condition = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end

AllFormulas[4073128].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073129] = {}
AllFormulas[4073129].Condition = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end

AllFormulas[4073129].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073130] = {}
AllFormulas[4073130].Condition = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end

AllFormulas[4073130].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073131] = {}
AllFormulas[4073131].Condition = function(self)
  return "主人升到#G"
end

AllFormulas[4073131].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end
}}}
AllFormulas[4073132] = {}
AllFormulas[4073132].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4073132].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "#G"
end
}}}
AllFormulas[4073133] = {}
AllFormulas[4073133].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073133].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073134] = {}
AllFormulas[4073134].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073134].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073135] = {}
AllFormulas[4073135].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073135].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073136] = {}
AllFormulas[4073136].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073136].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073137] = {}
AllFormulas[4073137].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073137].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
}}}
AllFormulas[4073138] = {}
AllFormulas[4073138].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073138].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
, [2] = function(self)
  return Rand(0.1)
end
}}}
AllFormulas[4073139] = {}
AllFormulas[4073139].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073139].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人的#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
}}}
AllFormulas[4073140] = {}
AllFormulas[4073140].Condition = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end

AllFormulas[4073140].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073141] = {}
AllFormulas[4073141].Condition = function(self)
  return "主人穿这么少，不会冻着么？#55"
end

AllFormulas[4073141].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073142] = {}
AllFormulas[4073142].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4073142].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073143] = {}
AllFormulas[4073143].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4073143].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073144] = {}
AllFormulas[4073144].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4073144].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073145] = {}
AllFormulas[4073145].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4073145].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073146] = {}
AllFormulas[4073146].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4073146].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073147] = {}
AllFormulas[4073147].Condition = function(self)
  return "主人升的好棒啊！#86"
end

AllFormulas[4073147].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073148] = {}
AllFormulas[4073148].Condition = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end

AllFormulas[4073148].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073149] = {}
AllFormulas[4073149].Condition = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end

AllFormulas[4073149].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073150] = {}
AllFormulas[4073150].Condition = function(self)
  return "主人你也好，叽！#62"
end

AllFormulas[4073150].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073151] = {}
AllFormulas[4073151].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4073151].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073152] = {}
AllFormulas[4073152].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4073152].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073153] = {}
AllFormulas[4073153].Condition = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end

AllFormulas[4073153].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073154] = {}
AllFormulas[4073154].Condition = function(self)
  return "主人的伞伞比我的大！#52"
end

AllFormulas[4073154].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073155] = {}
AllFormulas[4073155].Condition = function(self)
  return "主人锄地我浇水！#59"
end

AllFormulas[4073155].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073156] = {}
AllFormulas[4073156].Condition = function(self)
  return "主人浇水我锄地！#46"
end

AllFormulas[4073156].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073157] = {}
AllFormulas[4073157].Condition = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end

AllFormulas[4073157].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073200] = {}
AllFormulas[4073200].Condition = function(self)
  return "主人抱抱！#17"
end

AllFormulas[4073200].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073201] = {}
AllFormulas[4073201].Condition = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end

AllFormulas[4073201].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073202] = {}
AllFormulas[4073202].Condition = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end

AllFormulas[4073202].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073203] = {}
AllFormulas[4073203].Condition = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end

AllFormulas[4073203].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073204] = {}
AllFormulas[4073204].Condition = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end

AllFormulas[4073204].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073205] = {}
AllFormulas[4073205].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073205].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end
}}}
AllFormulas[4073206] = {}
AllFormulas[4073206].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4073206].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end
}}}
AllFormulas[4073207] = {}
AllFormulas[4073207].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4073207].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073208] = {}
AllFormulas[4073208].Condition = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end

AllFormulas[4073208].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end
, [4] = function(self)
  return Rand(0.0001)
end
}}}
AllFormulas[4073209] = {}
AllFormulas[4073209].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073209].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end
, [2] = function(self)
  return Rand(0.0001)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end
}}}
AllFormulas[4073210] = {}
AllFormulas[4073210].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4073210].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，俺们一起杀了#G"
end
}}}
AllFormulas[4073211] = {}
AllFormulas[4073211].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073211].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073212] = {}
AllFormulas[4073212].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073212].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "哟，师侄#G"
end
}}}
AllFormulas[4073213] = {}
AllFormulas[4073213].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073213].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073214] = {}
AllFormulas[4073214].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073214].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073215] = {}
AllFormulas[4073215].Condition = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end

AllFormulas[4073215].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [4] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
}}}
AllFormulas[4073216] = {}
AllFormulas[4073216].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073216].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥大嫂，俺们一起去刷怪吧！#103"
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
}}}
AllFormulas[4073217] = {}
AllFormulas[4073217].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073217].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "杀啊！先灭了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [3] = function(self)
  return "#Y！#140"
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073218] = {}
AllFormulas[4073218].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073218].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺砍，俺砍，俺砍砍砍！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073219] = {}
AllFormulas[4073219].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073219].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "俺咬死你，咬不死你俺都不姓蜘！#119"
end
, [2] = function(self)
  return Rand(0.003)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "疼死俺了，疼死俺俺也要杀啊！#101"
end
}}}
AllFormulas[4073220] = {}
AllFormulas[4073220].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073220].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "啊俺要死了，大哥你要代俺报仇！#4"
end
, [3] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073221] = {}
AllFormulas[4073221].Condition = function(self)
  return "#G"
end

AllFormulas[4073221].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y，俺和俺大哥要群殴你！#28"
end
}}}
AllFormulas[4073222] = {}
AllFormulas[4073222].Condition = function(self)
  return true
end

AllFormulas[4073222].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "俺更强了，大哥俺们去打更高级的怪吧！#16"
end
}}}
AllFormulas[4073223] = {}
AllFormulas[4073223].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073223].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "敢打俺大哥，俺杀了你！#4"
end
}}}
AllFormulas[4073224] = {}
AllFormulas[4073224].Condition = function(self)
  return true
end

AllFormulas[4073224].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "好牛的招数，这下一定能干掉他！#89"
end
}}}
AllFormulas[4073225] = {}
AllFormulas[4073225].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4073225].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "别管队里的#G"
end
}}}
AllFormulas[4073226] = {}
AllFormulas[4073226].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073226].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y，俺们先一起杀过去！#90"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
}}}
AllFormulas[4073227] = {}
AllFormulas[4073227].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073227].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "队里的#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4073228] = {}
AllFormulas[4073228].Condition = function(self)
  return "#Y挂了，俺们一起给他报仇！#78"
end

AllFormulas[4073228].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073229] = {}
AllFormulas[4073229].Condition = function(self)
  return "这谁的小弟啊这么弱#80，看俺的！"
end

AllFormulas[4073229].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073230] = {}
AllFormulas[4073230].Condition = function(self)
  return "有好东西，大哥快抢！#18"
end

AllFormulas[4073230].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return true
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073231] = {}
AllFormulas[4073231].Condition = function(self)
  return "大哥你又变厉害了，杀个人让俺瞧瞧呀！#95"
end

AllFormulas[4073231].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073232] = {}
AllFormulas[4073232].Condition = function(self)
  return "收保护费了，快交保护费给俺大哥！#28"
end

AllFormulas[4073232].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073233] = {}
AllFormulas[4073233].Condition = function(self)
  return "快点买，买最贵的，最贵的就是最好的！#150"
end

AllFormulas[4073233].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073234] = {}
AllFormulas[4073234].Condition = function(self)
  return "不管你买了啥，俺们冲吧，杀啊！#90"
end

AllFormulas[4073234].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073235] = {}
AllFormulas[4073235].Condition = function(self)
  return "主人有坐骑，为啥俺没有！#24"
end

AllFormulas[4073235].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073236] = {}
AllFormulas[4073236].Condition = function(self)
  return "种瓜得豆，种豆得瓜，看俺还会说成语呢！#48"
end

AllFormulas[4073236].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073237] = {}
AllFormulas[4073237].Condition = function(self)
  return "还偷啥，直接抢啊！#21"
end

AllFormulas[4073237].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.1)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073238] = {}
AllFormulas[4073238].Condition = function(self)
  return "点技能了，点了他们就更打不过俺们了！哇哈哈！#1"
end

AllFormulas[4073238].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073239] = {}
AllFormulas[4073239].Condition = function(self)
  return "大哥你这是干啥呢，没钱买装备呀？#55"
end

AllFormulas[4073239].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073240] = {}
AllFormulas[4073240].Condition = function(self)
  return "大哥的任务是啥俺不知道，俺的任务就是杀杀杀！#18"
end

AllFormulas[4073240].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073241] = {}
AllFormulas[4073241].Condition = function(self)
  return "这#G"
end

AllFormulas[4073241].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return "#Y老跟你说话，耽误俺们杀人哪！#120"
end
}}}
AllFormulas[4073242] = {}
AllFormulas[4073242].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end

AllFormulas[4073242].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的七绝啥的，俺们杀啊！#112"
end
}}}
AllFormulas[4073243] = {}
AllFormulas[4073243].Condition = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end

AllFormulas[4073243].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥带上你的逆天啥的，俺们杀啊！#28"
end
}}}
AllFormulas[4073244] = {}
AllFormulas[4073244].Condition = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end

AllFormulas[4073244].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升的不行啊！#64"
end
}}}
AllFormulas[4073245] = {}
AllFormulas[4073245].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end

AllFormulas[4073245].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这样升才给力嘛！#145"
end
}}}
AllFormulas[4073246] = {}
AllFormulas[4073246].Condition = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end

AllFormulas[4073246].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "升成这样怎么杀人啊！#15"
end
}}}
AllFormulas[4073247] = {}
AllFormulas[4073247].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end

AllFormulas[4073247].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "这装备还会闪的，大哥也给俺搞一件！#97"
end
}}}
AllFormulas[4073248] = {}
AllFormulas[4073248].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end

AllFormulas[4073248].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥好，大哥打怪去！#51"
end
}}}
AllFormulas[4073249] = {}
AllFormulas[4073249].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end

AllFormulas[4073249].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你干吗呢？#2"
end
}}}
AllFormulas[4073250] = {}
AllFormulas[4073250].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end

AllFormulas[4073250].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "甭睡了，快起来刷怪！#46"
end
}}}
AllFormulas[4073251] = {}
AllFormulas[4073251].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end

AllFormulas[4073251].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "蹦跶啥呢，把怪都吓跑了！#4"
end
}}}
AllFormulas[4073252] = {}
AllFormulas[4073252].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end

AllFormulas[4073252].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，这圆不隆冬的是啥武器，打架利索不？#24"
end
}}}
AllFormulas[4073253] = {}
AllFormulas[4073253].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end

AllFormulas[4073253].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥这回换锄头砍人了？#144"
end
}}}
AllFormulas[4073254] = {}
AllFormulas[4073254].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end

AllFormulas[4073254].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "淹死他，狠狠的浇！#102"
end
}}}
AllFormulas[4073255] = {}
AllFormulas[4073255].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end

AllFormulas[4073255].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "扫帚杀人不好使吧？#119"
end
}}}
AllFormulas[4073256] = {}
AllFormulas[4073256].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end

AllFormulas[4073256].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥你这是干啥，要掐死人啊！#74"
end
}}}
AllFormulas[4073257] = {}
AllFormulas[4073257].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end

AllFormulas[4073257].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "大哥，你嘟囔啥呢？#132"
end
}}}
AllFormulas[4073300] = {}
AllFormulas[4073300].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end

AllFormulas[4073300].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "笑成这样，刚才又杀了几个啊？#48"
end
}}}
AllFormulas[4073301] = {}
AllFormulas[4073301].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end

AllFormulas[4073301].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哭啥呢，下次再杀呗，一点都不坚强！#150"
end
}}}
AllFormulas[4073302] = {}
AllFormulas[4073302].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end

AllFormulas[4073302].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073303] = {}
AllFormulas[4073303].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073303].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来1"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073304] = {}
AllFormulas[4073304].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073304].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "召唤出来2"
end
, [2] = function(self)
  return Rand(0.01)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "召唤出来3"
end
}}}
AllFormulas[4073305] = {}
AllFormulas[4073305].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073305].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你看我跑的多欢"
end
}}}
AllFormulas[4073306] = {}
AllFormulas[4073306].Condition = function(self)
  return not self.m_pCurEventParam[1]:IsPlayer() or not Rand(0.01) or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4073306].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "老师，你真给力 "
end
, [4] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073307] = {}
AllFormulas[4073307].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4073307].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "徒弟，你真给力 "
end
}}}
AllFormulas[4073308] = {}
AllFormulas[4073308].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073308].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073309] = {}
AllFormulas[4073309].Condition = function(self)
  return "哥们，你真给力 "
end

AllFormulas[4073309].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  if g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073310] = {}
AllFormulas[4073310].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073310].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "亲爱的，你真给力 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073311] = {}
AllFormulas[4073311].Condition = function(self)
  return self.m_pCurEventParam[1]:IsMonster()
end

AllFormulas[4073311].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073312] = {}
AllFormulas[4073312].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073312].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073313] = {}
AllFormulas[4073313].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073313].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.003)
end
, [2] = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end
}}}
AllFormulas[4073314] = {}
AllFormulas[4073314].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073314].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "打死你  "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073315] = {}
AllFormulas[4073315].Condition = function(self)
  return true
end

AllFormulas[4073315].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人我升到了 "
end
}}}
AllFormulas[4073316] = {}
AllFormulas[4073316].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4073316].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 级"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073317] = {}
AllFormulas[4073317].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073317].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的技能#G"
end
, [2] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [3] = function(self)
  return "#Y好牛逼啊"
end
, [4] = function(self)
  return self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 3
end
}}}
AllFormulas[4073318] = {}
AllFormulas[4073318].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073318].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的队友 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4073319] = {}
AllFormulas[4073319].Condition = function(self)
  return " ， 名字 "
end

AllFormulas[4073319].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2]
end
, [2] = function(self)
  return " , hp = "
end
, [3] = function(self)
  return self.m_pCurEventParam[3]
end
, [4] = function(self)
  return ", curFull = "
end
}}}
AllFormulas[4073320] = {}
AllFormulas[4073320].Condition = function(self)
  return self.m_pCurEventParam[4]
end

AllFormulas[4073320].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return ", Full= "
end
, [2] = function(self)
  return self.m_pCurEventParam[5]
end
, [3] = function(self)
  return self.m_pCurEventParam[3] == 0
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073321] = {}
AllFormulas[4073321].Condition = function(self)
  return "主人，你的队友 "
end

AllFormulas[4073321].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]
end
, [2] = function(self)
  return " ， 名字 "
end
}}}
AllFormulas[4073322] = {}
AllFormulas[4073322].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073322].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " , hp = "
end
, [2] = function(self)
  return self.m_pCurEventParam[3]
end
}}}
AllFormulas[4073323] = {}
AllFormulas[4073323].Condition = function(self)
  return ", curFull = "
end

AllFormulas[4073323].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[4]
end
, [2] = function(self)
  return ", Full= "
end
}}}
AllFormulas[4073324] = {}
AllFormulas[4073324].Condition = function(self)
  return self.m_pCurEventParam[5]
end

AllFormulas[4073324].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073325] = {}
AllFormulas[4073325].Condition = function(self)
  return "紫装你好 "
end

AllFormulas[4073325].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4073326] = {}
AllFormulas[4073326].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073326].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "恭喜主人升到 "
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4073327] = {}
AllFormulas[4073327].Condition = function(self)
  return " 级"
end

AllFormulas[4073327].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073328] = {}
AllFormulas[4073328].Condition = function(self)
  return "主人， "
end

AllFormulas[4073328].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "的店 "
end
}}}
AllFormulas[4073329] = {}
AllFormulas[4073329].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073329].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 不错嘛"
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073330] = {}
AllFormulas[4073330].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073330].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人你打开了道具商城界面，赶紧给我买个东西"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073331] = {}
AllFormulas[4073331].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4073331].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073332] = {}
AllFormulas[4073332].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4073332].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的技能 "
end
}}}
AllFormulas[4073333] = {}
AllFormulas[4073333].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4073333].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 好牛逼啊"
end
, [2] = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.01))
end
}}}
AllFormulas[4073334] = {}
AllFormulas[4073334].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4073334].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人你完成了 "
end
}}}
AllFormulas[4073335] = {}
AllFormulas[4073335].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4073335].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 任务 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4073336] = {}
AllFormulas[4073336].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4073336].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人 Id 为 "
end
}}}
AllFormulas[4073337] = {}
AllFormulas[4073337].Condition = function(self)
  return self.m_pCurEventParam[1]
end

AllFormulas[4073337].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return " 的 "
end
, [2] = function(self)
  return self.m_pCurEventParam[2]
end
}}}
AllFormulas[4073338] = {}
AllFormulas[4073338].Condition = function(self)
  return " 找你"
end

AllFormulas[4073338].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
}}}
AllFormulas[4073339] = {}
AllFormulas[4073339].Condition = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[5]
end

AllFormulas[4073339].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[3] == self.m_pCurEventParam[4]
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetUpgrade() >= 11
end
}}}
AllFormulas[4073340] = {}
AllFormulas[4073340].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.003))
end

AllFormulas[4073340].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700004 and Rand(0.003))
end
}}}
AllFormulas[4073341] = {}
AllFormulas[4073341].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.003))
end

AllFormulas[4073341].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.003))
end
}}}
AllFormulas[4073342] = {}
AllFormulas[4073342].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.003))
end

AllFormulas[4073342].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700023 and Rand(0.003))
end
}}}
AllFormulas[4073343] = {}
AllFormulas[4073343].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.003))
end

AllFormulas[4073343].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.003))
end
, [2] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.003))
end
}}}
AllFormulas[4073344] = {}
AllFormulas[4073344].Condition = function(self)
  return (self.m_pCurEventParam[1] == 4700030 and Rand(0.003))
end

AllFormulas[4073344].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073345] = {}
AllFormulas[4073345].Condition = function(self)
  return Rand(0.001)
end

AllFormulas[4073345].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function(self)
  return Rand(0.001)
end
}}}
AllFormulas[4073346] = {}
AllFormulas[4073346].Condition = function(self)
  return Rand(0.01)
end

AllFormulas[4073346].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，小鸡在此！#51"
end
}}}
AllFormulas[4073347] = {}
AllFormulas[4073347].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4073347].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "叽叽叽叽叽我是小小鸡！#41"
end
}}}
AllFormulas[4073348] = {}
AllFormulas[4073348].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4073348].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "下雨了所以我打伞，没下雨我还是要打伞，你可以叫我伞哥。#37"
end
}}}
AllFormulas[4073349] = {}
AllFormulas[4073349].Condition = function(self)
  return Rand(0.0001)
end

AllFormulas[4073349].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人不要跑这么快，我我我我我怕追不上主人！#17"
end
}}}
AllFormulas[4073350] = {}
AllFormulas[4073350].Condition = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end

AllFormulas[4073350].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人主人，那个#G"
end
}}}
AllFormulas[4073351] = {}
AllFormulas[4073351].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073351].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y好像很厉害的样子呢，不过我还是最喜欢主人！#96"
end
, [2] = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073352] = {}
AllFormulas[4073352].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073352].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人主人，你的师父来了，我像喜欢主人一样喜欢主人的师父！#86"
end
, [2] = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073353] = {}
AllFormulas[4073353].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073353].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，你的徒弟#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073354] = {}
AllFormulas[4073354].Condition = function(self)
  return "#Y来了，跟他聊聊吧，他跟小鸡我一样都很需要主人的关心哦！#53"
end

AllFormulas[4073354].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073355] = {}
AllFormulas[4073355].Condition = function(self)
  return "主人主人，你的兄弟姐妹上线啦，真是吉祥如意的一家人哪！#86"
end

AllFormulas[4073355].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073356] = {}
AllFormulas[4073356].Condition = function(self)
  return "主人的相公来了，看见主人幸福，小鸡也很开心呢！#44"
end

AllFormulas[4073356].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 1 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073357] = {}
AllFormulas[4073357].Condition = function(self)
  return "主人的娘子来了，看见主人幸福，小鸡也很开心呢！#44"
end

AllFormulas[4073357].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  if self.m_pCurEventParam[1]:IsMonster() then
    return Rand(0.001)
  end
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073400] = {}
AllFormulas[4073400].Condition = function(self)
  return "#G"
end

AllFormulas[4073400].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y来了，主人小心啊！#47"
end
}}}
AllFormulas[4073401] = {}
AllFormulas[4073401].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073401].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "竟来偷袭我主人，看我小鸡一爪！#99"
end
}}}
AllFormulas[4073402] = {}
AllFormulas[4073402].Condition = function(self)
  return Rand(0.003)
end

AllFormulas[4073402].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "吃我一扇，我要把你这个#G"
end
}}}
AllFormulas[4073403] = {}
AllFormulas[4073403].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073403].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y扇跑！#78"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073404] = {}
AllFormulas[4073404].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073404].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人，我，我可能不行了，你会想念小鸡吗……#1"
end
, [2] = function(self)
  return Rand(0.003)
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人，小鸡会想念你的……#14"
end
}}}
AllFormulas[4073405] = {}
AllFormulas[4073405].Condition = function(self)
  if self.m_pCurEventParam[1]:IsPlayer() then
    return Rand(0.003)
  end
end

AllFormulas[4073405].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人要跟#G"
end
}}}
AllFormulas[4073406] = {}
AllFormulas[4073406].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073406].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y开战，小鸡当然义不容辞。#85"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4073407] = {}
AllFormulas[4073407].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073407].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "小鸡我升到了#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
, [3] = function(self)
  return "#Y级，主人你也很高兴吧。#86"
end
, [4] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073408] = {}
AllFormulas[4073408].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073408].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人痛不痛，小鸡心疼主人！#52"
end
, [2] = function(self)
  return true
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "好帅的一招#G"
end
, [5] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [6] = function(self)
  return "#Y，主人我越来越仰慕你了！#84"
end
}}}
AllFormulas[4073409] = {}
AllFormulas[4073409].Condition = function(self)
  return (self.m_pCurEventParam[3] < self.m_pCurEventParam[5] * 1 / 5 and Rand(0.001))
end

AllFormulas[4073409].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4073410] = {}
AllFormulas[4073410].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073410].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y受伤了，好可怜呢。#14"
end
, [2] = function(self)
  return (self.m_pCurEventParam[3] == 0 and Rand(0.01))
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人，你的队友#G"
end
}}}
AllFormulas[4073411] = {}
AllFormulas[4073411].Condition = function(self)
  return self.m_pCurEventParam[2]
end

AllFormulas[4073411].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y牺牲了，你要好好保重。#75"
end
, [2] = function(self)
  return Rand(0.003)
end
}}}
AllFormulas[4073412] = {}
AllFormulas[4073412].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073412].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "旁人的灵兽牺牲了，小鸡心里很难受，小鸡想多陪伴主人！#15"
end
, [2] = function(self)
  if Rand(0.03) then
    return g_ConditionMgr:IsPurpleEquipObject(self.m_pCurEventParam[1])
  end
end
}}}
AllFormulas[4073413] = {}
AllFormulas[4073413].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073413].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "这紫光闪闪的是什么呀，真好看！#50"
end
, [2] = function(self)
  return true
end
}}}
AllFormulas[4073414] = {}
AllFormulas[4073414].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073414].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人升到#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]
end
}}}
AllFormulas[4073415] = {}
AllFormulas[4073415].Condition = function(self)
  return "#Y级了，小鸡比自己升级还高兴！#41"
end

AllFormulas[4073415].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "#G"
end
, [4] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073416] = {}
AllFormulas[4073416].Condition = function(self)
  return "#Y摊上的东西真是琳琅满目，主人想买点啥呢？#55"
end

AllFormulas[4073416].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073417] = {}
AllFormulas[4073417].Condition = function(self)
  return "商城里的东西真好玩，主人买一个吧！#39"
end

AllFormulas[4073417].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
, [3] = function(self)
  return "主人买的这是什么呀，看起来很厉害的样子！#24"
end
, [4] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073418] = {}
AllFormulas[4073418].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073418].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人上了坐骑，看起来好威风啊！#90"
end
, [2] = function(self)
  return Rand(0.01)
end
}}}
AllFormulas[4073419] = {}
AllFormulas[4073419].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073419].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "主人真勤劳，又开始劳动了！#42"
end
, [2] = function(self)
  return not Rand(0.01) or self.m_pCurEventParam[3] == 1
end
, [3] = function()
  return "#CFFFF00"
end
, [4] = function(self)
  return "主人主人，偷了就快跑吧，不然人家的狗会发现的！#7"
end
}}}
AllFormulas[4073420] = {}
AllFormulas[4073420].Condition = function(self)
  return Rand(0.1)
end

AllFormulas[4073420].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人的#G"
end
, [3] = function(self)
  return GetSkillName(self.m_pCurEventParam[1])
end
, [4] = function(self)
  return "#Y升级，小鸡也要强大自己，不能拖主人后腿哦！#58"
end
}}}
AllFormulas[4073421] = {}
AllFormulas[4073421].Condition = function(self)
  return (self.m_pCurEventParam[1]:GetData("Type") == 3 and Rand(0.1))
end

AllFormulas[4073421].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "主人穿这么少，不会冻着么？#55"
end
, [3] = function(self)
  return Rand(0.01)
end
, [4] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073422] = {}
AllFormulas[4073422].Condition = function(self)
  return "主人又完成任务了，小鸡心里真高兴！#93"
end

AllFormulas[4073422].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073423] = {}
AllFormulas[4073423].Condition = function(self)
  return "有人跟主人说话呢，主人看看是谁！#94"
end

AllFormulas[4073423].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 7
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073424] = {}
AllFormulas[4073424].Condition = function(self)
  return "七绝是什么呀，小鸡猜肯定是很厉害的吧！#24"
end

AllFormulas[4073424].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[2] == 3100076 and not self.m_pCurEventParam[1]:IsEquip() or self.m_pCurEventParam[1]:GetWordsNum() == 8
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073425] = {}
AllFormulas[4073425].Condition = function(self)
  return "小鸡不懂逆天是什么，但小鸡也会为主人欢呼！#61"
end

AllFormulas[4073425].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.1) or ((self.m_pCurEventParam[5] + self.m_pCurEventParam[4]) / 2 <= self.m_pCurEventParam[3] and self.m_pCurEventParam[3] < self.m_pCurEventParam[5])
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073426] = {}
AllFormulas[4073426].Condition = function(self)
  return "主人升的不错啊！#40"
end

AllFormulas[4073426].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[5] and Rand(0.5))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073427] = {}
AllFormulas[4073427].Condition = function(self)
  return "主人升的好棒啊！#86"
end

AllFormulas[4073427].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[3] == self.m_pCurEventParam[4] and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073428] = {}
AllFormulas[4073428].Condition = function(self)
  return "主人升的……好像有点点差哦,叽叽。#76"
end

AllFormulas[4073428].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1]:GetUpgrade() >= 10 and Rand(0.1))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073429] = {}
AllFormulas[4073429].Condition = function(self)
  return "呀！主人，你这个装备会发光哦！#41"
end

AllFormulas[4073429].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700001 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073430] = {}
AllFormulas[4073430].Condition = function(self)
  return "主人你也好，叽！#62"
end

AllFormulas[4073430].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700002 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073431] = {}
AllFormulas[4073431].Condition = function(self)
  return "主人做什么事都客客气气的！#56"
end

AllFormulas[4073431].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700003 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073432] = {}
AllFormulas[4073432].Condition = function(self)
  return "呼呼呼，主人觉觉小鸡也觉觉！#77"
end

AllFormulas[4073432].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700006 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073433] = {}
AllFormulas[4073433].Condition = function(self)
  return "主人主人，小鸡给你跳段雨伞舞！#44"
end

AllFormulas[4073433].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700014 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073434] = {}
AllFormulas[4073434].Condition = function(self)
  return "主人的伞伞比我的大！#52"
end

AllFormulas[4073434].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700019 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073435] = {}
AllFormulas[4073435].Condition = function(self)
  return "主人锄地我浇水！#59"
end

AllFormulas[4073435].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700020 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073436] = {}
AllFormulas[4073436].Condition = function(self)
  return "主人浇水我锄地！#46"
end

AllFormulas[4073436].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700021 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073437] = {}
AllFormulas[4073437].Condition = function(self)
  return "主人，我的小伞借你扫地，叽！#51"
end

AllFormulas[4073437].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700022 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073438] = {}
AllFormulas[4073438].Condition = function(self)
  return "主人抱抱！#17"
end

AllFormulas[4073438].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700026 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073439] = {}
AllFormulas[4073439].Condition = function(self)
  return "咯咯咯，主人能听懂我的鸡语吗？#55"
end

AllFormulas[4073439].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700027 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073440] = {}
AllFormulas[4073440].Condition = function(self)
  return "主人有啥事这么高兴，给小鸡说说呀！#47"
end

AllFormulas[4073440].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700028 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073441] = {}
AllFormulas[4073441].Condition = function(self)
  return "主人，别哭了，把我的小伞借你好了！#110"
end

AllFormulas[4073441].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return (self.m_pCurEventParam[1] == 4700029 and Rand(0.01))
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073442] = {}
AllFormulas[4073442].Condition = function(self)
  return "主人快起来呀，膝盖都跪痛了吧！#14"
end

AllFormulas[4073442].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073443] = {}
AllFormulas[4073443].Condition = function(self)
  return "主人主人，快来小鸡的伞底下，别晒成黑煤球啦！#44"
end

AllFormulas[4073443].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073444] = {}
AllFormulas[4073444].Condition = function(self)
  return "最喜欢下雨天了，小鸡的伞有用武之地啦！#39"
end

AllFormulas[4073444].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073445] = {}
AllFormulas[4073445].Condition = function(self)
  return "风好大，要把小鸡的伞都给吹跑啦！#107"
end

AllFormulas[4073445].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073446] = {}
AllFormulas[4073446].Condition = function(self)
  return "好冷，小鸡要冻僵啦……#122"
end

AllFormulas[4073446].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073447] = {}
AllFormulas[4073447].Condition = function(self)
  return "主人你很冷吧，抱着小鸡就不冷啦！#123"
end

AllFormulas[4073447].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.01)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073448] = {}
AllFormulas[4073448].Condition = function(self)
  return "大哥，小弟来帮你了，今天俺们砍谁去？#55"
end

AllFormulas[4073448].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073449] = {}
AllFormulas[4073449].Condition = function(self)
  return "真无聊，大哥，俺们去打怪吧！#62"
end

AllFormulas[4073449].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073450] = {}
AllFormulas[4073450].Condition = function(self)
  return "不杀怪，生命的意义何在啊！#60"
end

AllFormulas[4073450].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return Rand(0.0001)
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073451] = {}
AllFormulas[4073451].Condition = function(self)
  return "跟上，跑快点，别让那家伙有机会跑路！#90"
end

AllFormulas[4073451].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return not Rand(0.001) or not self.m_pCurEventParam[1]:IsPlayer() or self.m_State.m_Character:GetOwner():GetGrade() + 40 < self.m_pCurEventParam[1]:GetGrade()
end
, [2] = function()
  return "#CFFFF00"
end
}}}
AllFormulas[4073452] = {}
AllFormulas[4073452].Condition = function(self)
  return "大哥，俺们一起杀了#G"
end

AllFormulas[4073452].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
, [2] = function(self)
  return "#Y那家伙，爆他装备！#113"
end
}}}
AllFormulas[4073453] = {}
AllFormulas[4073453].Condition = function(self)
  if g_ConditionMgr:IsTeacher(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4073453].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "师父来了，我是大哥的结拜兄弟，也算师父的徒弟了。#112"
end
}}}
AllFormulas[4073454] = {}
AllFormulas[4073454].Condition = function(self)
  if g_ConditionMgr:IsStudent(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end

AllFormulas[4073454].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function()
  return "#CFFFF00"
end
, [2] = function(self)
  return "哟，师侄#G"
end
}}}
AllFormulas[4073455] = {}
AllFormulas[4073455].Condition = function(self)
  return self.m_pCurEventParam[1]:GetName()
end

AllFormulas[4073455].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "#Y来了，和俺一起杀啊！#32"
end
, [2] = function(self)
  if g_ConditionMgr:IsBrother(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) then
    return Rand(0.01)
  end
end
}}}
AllFormulas[4073456] = {}
AllFormulas[4073456].Condition = function()
  return "#CFFFF00"
end

AllFormulas[4073456].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return "大哥，#G"
end
, [2] = function(self)
  return self.m_pCurEventParam[1]:GetName()
end
}}}
AllFormulas[4073457] = {}
AllFormulas[4073457].Condition = function(self)
  return "#Y这人是你的大哥还是你的小弟，要是大哥的大哥我就叫一句老哥。#84"
end

AllFormulas[4073457].Content = {
[1] = {[1] = 0, 
[2] = {[1] = function(self)
  return g_ConditionMgr:IsPartner(self.m_State.m_Character:GetOwner(), self.m_pCurEventParam[1]) and ((self.m_pCurEventParam[1]:GetGender() == 0 and Rand(0.01)))
end
, [2] = function()
  return "#CFFFF00"
end
}}}

