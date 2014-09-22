-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: allfcc.luac 

AllFormulas[107] = {}
AllFormulas[107].Formula = function(a, d, ...)
  local __a_pSpeed = a:GetParam(EFightProp.pSpeed)
  return math.min(1, math.max(0.5, (1.2 - 0.00172 * __a_pSpeed) * (1.05 - a:getClassWeaponSpeed() * 0.1)))
end

AllFormulas[108] = {}
AllFormulas[108].Formula = function(a, d, ...)
  local __a_mSpeed = a:GetParam(EFightProp.mSpeed)
  return math.min(1, math.max(0.5, (1.2 - 0.00172 * __a_mSpeed) * (1.05 - a:getClassWeaponSpeed() * 0.1)))
end

AllFormulas[116] = {}
AllFormulas[116].Formula = function(a, d, ...)
  local _args = {...}
  return math.pow(_args[1], 2) * 8000
end

AllFormulas[117] = {}
AllFormulas[117].Formula = function(a, d, ...)
  local _args = {...}
  return 0.002 * _args[1] * _args[1] + 0.003 * _args[1] + 1.04
end

AllFormulas[122] = {}
AllFormulas[122].Formula = function(a, d, ...)
  local _args = {...}
  return 5 * _args[1] + 2.8571428571429 * _args[2] + 50
end

AllFormulas[124] = {}
AllFormulas[124].Formula = function(a, d, ...)
  local _args = {...}
  return 5 * _args[1] + 2.8571428571429 * _args[2] + 50
end

AllFormulas[126] = {}
AllFormulas[126].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(180 * _args[1] + 2700, 360 * _args[1] - 8000, 360 * _args[1] - 8000) * 27
end

AllFormulas[127] = {}
AllFormulas[127].Formula = function(a, d, ...)
  local _args = {...}
  return math.pow(_args[1], 2) * 8000
end

AllFormulas[156] = {}
AllFormulas[156].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(0, _args[1] - 3) * 5 / 21
end

AllFormulas[157] = {}
AllFormulas[157].Formula = function(a, d, ...)
  local _args = {...}
  return _args[1] * 40
end

AllFormulas[158] = {}
AllFormulas[158].Formula = function(a, d, ...)
  local _args = {...}
  return _args[1] * _args[2] * 0.02
end

AllFormulas[162] = {}
AllFormulas[162].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(0, _args[1] - 4) * 0.1
end

AllFormulas[163] = {}
AllFormulas[163].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(0, _args[1] - 5) * 0.13
end

AllFormulas[169] = {}
AllFormulas[169].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor(50000 * _args[1])
end

AllFormulas[170] = {}
AllFormulas[170].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor(50000 * _args[1])
end

AllFormulas[171] = {}
AllFormulas[171].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor(1000 * _args[1])
end

AllFormulas[172] = {}
AllFormulas[172].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor(40 * _args[1])
end

AllFormulas[173] = {}
AllFormulas[173].Formula = function(a, d, ...)
  local _args = {...}
  return 0.01 * _args[1]
end

AllFormulas[174] = {}
AllFormulas[174].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor(math.min(math.max((_args[1] - 5) / 2 * math.random() + (_args[1] - 5) / 2 * math.random() + (_args[1] - 5) / 2 * math.random(), 0), 70))
end

AllFormulas[175] = {}
AllFormulas[175].Formula = function(a, d, ...)
  local _args = {...}
  return 50000 * _args[1]
end

AllFormulas[176] = {}
AllFormulas[176].Formula = function(a, d, ...)
  local _args = {...}
  return 50000 * _args[1] * _args[2] * _args[3]
end

AllFormulas[177] = {}
AllFormulas[177].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor(math.min(2.5, math.max(0.25, 1 + (_args[1] - 2000) * 0.0005)) * 100) / 100
end

AllFormulas[178] = {}
AllFormulas[178].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor((1000 * _args[2] * _args[2] * _args[2] + 15000) * _args[1] + 50000 * _args[1])
end

AllFormulas[216] = {}
AllFormulas[216].Formula = function(a, d, ...)
  local __a_pSpeed = a:GetParam(EFightProp.pSpeed)
  local __a_mSpeed = a:GetParam(EFightProp.mSpeed)
  return math.min(1, math.max(0.5, (1.2 - 0.00172 * math.max(__a_pSpeed, __a_mSpeed)) * (1.05 - a:getClassWeaponSpeed() * 0.1)))
end

AllFormulas[220] = {}
AllFormulas[220].Formula = function(a, d, ...)
  local _args = {...}
  return _args[1] * 2
end

AllFormulas[224] = {}
AllFormulas[224].Formula = function(a, d, ...)
  return (0.85 + a:GetGrade() * 0.15) * 3600 * (0.1 * a:GetGrade() + 1) * 5
end

AllFormulas[225] = {}
AllFormulas[225].Formula = function(a, d, ...)
  return (1.9 * math.pow(a:GetGrade(), 2) + 42 * a:GetGrade() + 3000) * 2.5
end

AllFormulas[227] = {}
AllFormulas[227].Formula = function(a, d, ...)
  local _args = {...}
  return _args[1] / 5 * _args[2]
end

AllFormulas[245] = {}
AllFormulas[245].Formula = function(a, d, ...)
  local _args = {...}
  return 1 + _args[1] / 100
end

AllFormulas[261] = {}
AllFormulas[261].Formula = function(a, d, ...)
  return (0.18 * math.pow(a:GetGrade(), 2) + 7 * a:GetGrade() + 200) * 500
end

AllFormulas[262] = {}
AllFormulas[262].Formula = function(a, d, ...)
  return (0.18 * math.pow(a:GetGrade(), 2) + 7 * a:GetGrade() + 200) * 500 * 2
end

AllFormulas[263] = {}
AllFormulas[263].Formula = function(a, d, ...)
  return (0.18 * math.pow(a:GetGrade(), 2) + 7 * a:GetGrade() + 200) * 500 * 3
end

AllFormulas[264] = {}
AllFormulas[264].Formula = function(a, d, ...)
  local _args = {...}
  return (0.18 * math.pow(a:GetGrade(), 2) + 7 * a:GetGrade() + 200) * 500 * (math.max(0, _args[1] - 69) * 0.0056 + 0.5)
end

AllFormulas[265] = {}
AllFormulas[265].Formula = function(a, d, ...)
  local _args = {...}
  return (0.18 * math.pow(a:GetGrade(), 2) + 7 * a:GetGrade() + 200) * 500 * (math.max(0, _args[1] - 69) * 0.0056 + 0.5) * 2
end

AllFormulas[266] = {}
AllFormulas[266].Formula = function(a, d, ...)
  local _args = {...}
  return (0.18 * math.pow(a:GetGrade(), 2) + 7 * a:GetGrade() + 200) * 500 * (math.max(0, _args[1] - 69) * 0.0056 + 0.5) * 3
end

AllFormulas[272] = {}
AllFormulas[272].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(1 - math.max(math.floor((_args[1] - _args[2] - 1) / (1 + math.floor(math.max(0, _args[1] - 1) / 10))) * 0.2, math.floor((_args[1] - _args[2] - 2) / (1 + math.floor(math.max(0, _args[1] - 2) / 10))) * 0.2, math.floor((_args[1] - _args[2] - 3) / (1 + math.floor(math.max(0, _args[1] - 3) / 10))) * 0.2, math.floor((_args[1] - _args[2] - 4) / (1 + math.floor(math.max(0, _args[1] - 4) / 10))) * 0.2, math.floor((_args[1] - _args[2]) / (1 + math.floor(_args[1] / 10))) * 0.2), 0.05)
end

AllFormulas[273] = {}
AllFormulas[273].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(1 - math.max(math.floor((_args[1] - _args[2] - 1) / (1 + math.floor(math.max(0, _args[1] - 1) / 10))) * 0.2, math.floor((_args[1] - _args[2] - 2) / (1 + math.floor(math.max(0, _args[1] - 2) / 10))) * 0.2, math.floor((_args[1] - _args[2] - 3) / (1 + math.floor(math.max(0, _args[1] - 3) / 10))) * 0.2, math.floor((_args[1] - _args[2] - 4) / (1 + math.floor(math.max(0, _args[1] - 4) / 10))) * 0.2, math.floor((_args[1] - _args[2]) / (1 + math.floor(_args[1] / 10))) * 0.2), 0.05)
end

AllFormulas[276] = {}
AllFormulas[276].Formula = function(a, d, ...)
  local _args = {...}
  return 45 * _args[1]
end

AllFormulas[277] = {}
AllFormulas[277].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor(math.min(120, _args[1]) * _args[2] / 5)
end

AllFormulas[278] = {}
AllFormulas[278].Formula = function(a, d, ...)
  return 0.375
end

AllFormulas[280] = {}
AllFormulas[280].Formula = function(a, d, ...)
  local _args = {...}
  return math.pow(_args[1], 1.815) + 10 + 5 * _args[1]
end

AllFormulas[282] = {}
AllFormulas[282].Formula = function(a, d, ...)
  local _args = {...}
  return 6000 * _args[1] / 150
end

AllFormulas[283] = {}
AllFormulas[283].Formula = function(a, d, ...)
  local _args = {...}
  return 3000 * _args[1] / 150
end

AllFormulas[284] = {}
AllFormulas[284].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(45 * _args[1], math.max(2700 + 108 * (_args[1] - 60), 5940 + 172 * (_args[1] - 90))) * _args[2] / 100 * 5
end

AllFormulas[285] = {}
AllFormulas[285].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(45 * _args[1], math.max(2700 + 108 * (_args[1] - 60), 5940 + 172 * (_args[1] - 90))) * 0.5 * _args[2] / 100 * 5
end

AllFormulas[286] = {}
AllFormulas[286].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(38 * _args[1], math.max(2280 + 79 * (_args[1] - 60), 4650 + 141 * (_args[1] - 90))) * _args[2] / 100 * 5
end

AllFormulas[287] = {}
AllFormulas[287].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(38 * _args[1], math.max(2280 + 79 * (_args[1] - 60), 4650 + 141 * (_args[1] - 90))) * 0.5 * _args[2] / 100 * 5
end

AllFormulas[436] = {}
AllFormulas[436].Formula = function(a, d, ...)
  local _args = {...}
  return (0.85 + _args[1] * 0.15) * 3600 * (0.1 * _args[1] + 1) * (0.7 + 0.3 * _args[2])
end

AllFormulas[448] = {}
AllFormulas[448].Formula = function(a, d, ...)
  local _args = {...}
  return (0.85 + _args[1] * 0.15) * 3600 * (0.1 * _args[1] + 1) * (0.7 + 0.3 * _args[2]) * 4
end

AllFormulas[600] = {}
AllFormulas[600].Formula = function(a, d, ...)
  local _args = {...}
  return 82.9598 * _args[1] * _args[2] / 2.2 + 6.1952 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 148
end

AllFormulas[601] = {}
AllFormulas[601].Formula = function(a, d, ...)
  return 0
end

AllFormulas[602] = {}
AllFormulas[602].Formula = function(a, d, ...)
  local _args = {...}
  return 4 * _args[1] * _args[2] / 2.2 + 10 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 112
end

AllFormulas[603] = {}
AllFormulas[603].Formula = function(a, d, ...)
  return 0
end

AllFormulas[604] = {}
AllFormulas[604].Formula = function(a, d, ...)
  local _args = {...}
  return (46.215 * _args[1] * _args[2] / 2.2 + 2.957 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 50) * 0.8
end

AllFormulas[605] = {}
AllFormulas[605].Formula = function(a, d, ...)
  local _args = {...}
  return (46.215 * _args[1] * _args[2] / 2.2 + 2.957 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 50) * 1.2
end

AllFormulas[606] = {}
AllFormulas[606].Formula = function(a, d, ...)
  local _args = {...}
  return 2.745 * _args[1] * _args[2] / 2.2 + 0.189 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 10
end

AllFormulas[607] = {}
AllFormulas[607].Formula = function(a, d, ...)
  local _args = {...}
  return 2.745 * _args[1] * _args[2] / 2.2 + 0.189 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 10
end

AllFormulas[608] = {}
AllFormulas[608].Formula = function(a, d, ...)
  local _args = {...}
  return (46.215 * _args[1] * _args[2] / 2.2 + 2.957 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 50) * 0.8
end

AllFormulas[609] = {}
AllFormulas[609].Formula = function(a, d, ...)
  local _args = {...}
  return (46.215 * _args[1] * _args[2] / 2.2 + 2.957 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 50) * 1.2
end

AllFormulas[610] = {}
AllFormulas[610].Formula = function(a, d, ...)
  local _args = {...}
  return 5.49 * _args[1] * _args[2] / 2.2 + 0.379 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 20
end

AllFormulas[611] = {}
AllFormulas[611].Formula = function(a, d, ...)
  local _args = {...}
  return 5.49 * _args[1] * _args[2] / 2.2 + 0.379 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 20
end

AllFormulas[612] = {}
AllFormulas[612].Formula = function(a, d, ...)
  local _args = {...}
  return 25.071 * _args[1] * _args[2] / 2.2 + 1.346 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 0.07 * (1 + _args[3]) * _args[6] * _args[7] / 1000 + 35
end

AllFormulas[613] = {}
AllFormulas[613].Formula = function(a, d, ...)
  local _args = {...}
  return 25.071 * _args[1] * _args[2] / 2.2 + 1.346 * (1 + _args[3]) * _args[4] * _args[5] / 1000 + 0.07 * (1 + _args[3]) * _args[6] * _args[7] / 1000 + 35
end

AllFormulas[614] = {}
AllFormulas[614].Formula = function(a, d, ...)
  local _args = {...}
  return (math.max(0, _args[6]) * _args[3] + math.max(0, _args[7]) * _args[4] + math.max(0, _args[8]) * _args[2] + math.max(0, _args[9]) * _args[5] + math.max(0, _args[10]) * _args[1]) * 0.0001 + 0.5 * (math.max(0, _args[6]) * _args[1] + math.max(0, _args[7]) * _args[2] + math.max(0, _args[8]) * _args[3] + math.max(0, _args[9]) * _args[4] + math.max(0, _args[10]) * _args[5]) * 0.0001 - (math.max(0, _args[6]) * _args[2] + math.max(0, _args[7]) * _args[5] + math.max(0, _args[8]) * _args[4] + math.max(0, _args[9]) * _args[1] + math.max(0, _args[10]) * _args[3]) * 0.0001
end

AllFormulas[615] = {}
AllFormulas[615].Formula = function(a, d, ...)
  local _args = {...}
  return _args[1] * ((1.3 + _args[2]) / 11 * 0.8 + 0.05)
end

AllFormulas[642] = {}
AllFormulas[642].Formula = function(a, d, ...)
  local _args = {...}
  return _args[1] * (1 + _args[2] * 3) * 10
end

AllFormulas[645] = {}
AllFormulas[645].Formula = function(a, d, ...)
  local _args = {...}
  return 20000 * math.pow(1.165, _args[1]) * math.pow(1.002, _args[2])
end

AllFormulas[649] = {}
AllFormulas[649].Formula = function(a, d, ...)
  local _args = {...}
  return math.max(0, math.floor((_args[1] - 10) * 0.137 + 0.9))
end

AllFormulas[654] = {}
AllFormulas[654].Formula = function(a, d, ...)
  local _args = {...}
  return math.floor((5 + 0.415 * (_args[1] - 65)) * math.min(1, math.max(_args[1] - 64, 0)) * _args[2] / 5)
end

AllFormulas[655] = {}
AllFormulas[655].Formula = function(a, d, ...)
  local _args = {...}
  return 36 * _args[1]
end


