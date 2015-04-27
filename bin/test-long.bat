@echo luadec long test

del test_fc_error.txt test_fc_ns_error.txt test_fc_f_error.txt test_fc_s_error.txt
del test_fc_error_c.txt test_fc_ns_error_c.txt test_fc_f_error_c.txt test_fc_s_error_c.txt
del test_fc_summary.txt test_fc_ns_summary.txt test_fc_f_summary.txt test_fc_s_summary.txt
del test_fc_summary_c.txt test_fc_ns_summary_c.txt test_fc_f_summary_c.txt test_fc_s_summary_c.txt

for /r ..\test %%f in (*.lua) do @luadec -fc %%f 2>>test_fc_error.txt | findstr /r /c:"-- function check" >>test_fc_summary.txt
for /r ..\test-compiled %%f in (*.lua) do @luadec -fc %%f 2>>test_fc_error_c.txt | findstr /r /c:"-- function check" >>test_fc_summary_c.txt

for /r ..\test %%f in (*.lua) do @luadec -fc -ns %%f 2>>test_fc_ns_error.txt | findstr /r /c:"-- function check" >>test_fc_ns_summary.txt
for /r ..\test-compiled %%f in (*.lua) do @luadec -fc -ns %%f 2>>test_fc_ns_error_c.txt | findstr /r /c:"-- function check" >>test_fc_ns_summary_c.txt

for /r ..\test %%f in (*.lua) do @luadec -fc -f 0_3 %%f 2>>test_fc_f_error.txt | findstr /r /c:"-- function check" >>test_fc_f_summary.txt
for /r ..\test-compiled %%f in (*.lua) do @luadec -fc -f 0_3 %%f 2>>test_fc_f_error_c.txt | findstr /r /c:"-- function check" >>test_fc_f_summary_c.txt

@rem for /r ..\test %%f in (*.lua) do @luadec -fc -s %%f 2>>test_fc_s_error.txt | findstr /r /c:"-- function check" >>test_fc_s_summary.txt
@rem for /r ..\test-compiled %%f in (*.lua) do @luadec -fc -s %%f 2>>test_fc_s_error_c.txt | findstr /r /c:"-- function check" >>test_fc_s_summary_c.txt


del test_dis_error.txt

@(echo luadec -dis)>>test_dis_error.txt
for /r ..\test %%f in (*.lua) do @luadec -dis %%f 2>>test_dis_error.txt 1>nul
for /r ..\test-compiled %%f in (*.lua) do @luadec -dis %%f 2>>test_dis_error.txt 1>nul

@(echo.)>>test_dis_error.txt
@(echo luadec -dis -ns)>>test_dis_error.txt
for /r ..\test %%f in (*.lua) do @luadec -dis -ns %%f 2>>test_dis_error.txt 1>nul
for /r ..\test-compiled %%f in (*.lua) do @luadec -dis -ns %%f 2>>test_dis_error.txt 1>nul

@(echo.)>>test_dis_error.txt
@(echo luadec -dis -fn 0_3)>>test_dis_error.txt
for /r ..\test %%f in (*.lua) do @luadec -dis -f 0_3 %%f 2>>test_dis_error.txt 1>nul
for /r ..\test-compiled %%f in (*.lua) do @luadec -dis -f 0_3 %%f 2>>test_dis_error.txt 1>nul


lua fun_check_count.lua test_fc_summary.txt
lua fun_check_count.lua test_fc_summary_c.txt
@rem lua fun_check_count.lua test_fc_s_summary.txt
@rem lua fun_check_count.lua test_fc_s_summary_c.txt
