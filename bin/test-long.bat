@echo luadec long test

del error_fc.txt error_fc_ns.txt error_fc_fn.txt error_fc_s.txt
del result_fc.txt result_fc_ns.txt result_fc_fn.txt result_fc_s.txt

for /r ..\test %%f in (*.lua) do @luadec -fc %%f 2>>error_fc.txt | findstr /r /c:"-- function check" >>result_fc.txt
for /r ..\lua-5.1\test %%f in (*.lua) do @luadec -fc %%f 2>>error_fc.txt | findstr /r /c:"-- function check" >>result_fc.txt

for /r ..\test %%f in (*.lua) do @luadec -fc -ns %%f 2>>error_fc_ns.txt | findstr /r /c:"-- function check" >>result_fc_ns.txt
for /r ..\lua-5.1\test %%f in (*.lua) do @luadec -fc -ns %%f 2>>error_fc_ns.txt | findstr /r /c:"-- function check" >>result_fc_ns.txt

for /r ..\test %%f in (*.lua) do @luadec -fc -fn 0_3 %%f 2>>error_fc_fn.txt | findstr /r /c:"-- function check" >>result_fc_fn.txt
for /r ..\lua-5.1\test %%f in (*.lua) do @luadec -fc -fn 0_3 %%f 2>>error_fc_fn.txt | findstr /r /c:"-- function check" >>result_fc_fn.txt

for /r ..\test %%f in (*.lua) do @luadec -s -fc %%f 2>>error_fc_s.txt | findstr /r /c:"-- function check" >>result_fc_s.txt
for /r ..\lua-5.1\test %%f in (*.lua) do @luadec -s -fc %%f 2>>error_fc_s.txt | findstr /r /c:"-- function check" >>result_fc_s.txt


del error_dis.txt

@(echo luadec -dis)>>error_dis.txt
for /r ..\test %%f in (*.lua) do @luadec -dis %%f 2>>error_dis.txt 1>nul
for /r ..\lua-5.1\test %%f in (*.lua) do @luadec -dis %%f 2>>error_dis.txt 1>nul

@(echo.)>>error_dis.txt
@(echo luadec -dis -ns)>>error_dis.txt
for /r ..\test %%f in (*.lua) do @luadec -dis -ns %%f 2>>error_dis.txt 1>nul
for /r ..\lua-5.1\test %%f in (*.lua) do @luadec -dis -ns %%f 2>>error_dis.txt 1>nul

@(echo.)>>error_dis.txt
@(echo luadec -dis -fn 0_3)>>error_dis.txt
for /r ..\test %%f in (*.lua) do @luadec -dis -fn 0_3 %%f 2>>error_dis.txt 1>nul
for /r ..\lua-5.1\test %%f in (*.lua) do @luadec -dis -fn 0_3 %%f 2>>error_dis.txt 1>nul


del error_fc_c.txt result_fc_c.txt
for /r ..\test\compiled %%f in (*.lua) do @luadec -fc %%f 2>>error_fc_c.txt | findstr /r /c:"-- function check" >>result_fc_c.txt


rem del error_fc_ab.txt result_fc_ab.txt
rem for /r ..\angrybirds_lua %%f in (*.lua) do @luadec -fc %%f 2>>error_fc_ab.txt | findstr /r /c:"-- function check" >>result_fc_ab.txt
rem @lua fun_check_count.lua result_fc_ab.txt


lua fun_check_count.lua result_fc.txt
lua fun_check_count.lua result_fc_c.txt
lua fun_check_count.lua result_fc_s.txt
