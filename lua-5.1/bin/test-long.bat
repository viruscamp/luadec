@echo luadec long test

for /r ..\test %%f in (*.lua) do @luadec -fc %%f 2>>error_fc.txt | findstr /r /c:"-- function check" >>result_fc.txt

for /r ..\test %%f in (*.lua) do @luadec -fc -ns %%f 2>>error_fc_ns.txt | findstr /r /c:"-- function check" >>result_fc_ns.txt

for /r ..\test %%f in (*.lua) do @luadec -fc -fn 0_3 %%f 2>>error_fc_fn.txt | findstr /r /c:"-- function check" >>result_fc_fn.txt

@(echo luadec -dis)>>error_dis.txt
for /r ..\test %%f in (*.lua) do @luadec -dis %%f 2>>error_dis.txt 1>nul
@(echo.)>>error_dis.txt
@(echo luadec -dis -ns)>>error_dis.txt
for /r ..\test %%f in (*.lua) do @luadec -dis -ns %%f 2>>error_dis.txt 1>nul
@(echo.)>>error_dis.txt
@(echo luadec -dis -fn 0_3)>>error_dis.txt
for /r ..\test %%f in (*.lua) do @luadec -dis -fn 0_3 %%f 2>>error_dis.txt 1>nul
