@echo off
title TIK������-V-AB��ˢ�ű�
echo.
echo ��ӭʹ������ҿ�Դ��ROM�����䣺TIBOX��
echo.
set /p CHOICE=�Ƿ�Ҫ�����������豸�еġ����ݡ���(Ĭ��Y����/����N��ɾ��)
echo �뽫�ֻ����뵽Fastbootģʽ
fastboot %* getvar is-userspace 2>&1 | findstr /r /c:"^is-userspace: *no" || fastboot reboot bootloader
fastboot %* flash abl_ab %~dp0images/abl.img
fastboot %* flash aop_ab %~dp0images/aop.img
fastboot %* flash bluetooth_ab %~dp0images/bluetooth.img
fastboot %* flash boot_ab %~dp0images/boot.img
fastboot %* flash cmnlib_ab %~dp0images/cmnlib.img
fastboot %* flash cmnlib64_ab %~dp0images/cmnlib64.img
fastboot %* flash devcfg_ab %~dp0images/devcfg.img
fastboot %* flash dsp_ab %~dp0images/dsp.img
fastboot %* flash dtbo_ab %~dp0images/dtbo.img
fastboot %* flash hyp_ab %~dp0images/hyp.img
fastboot %* flash imagefv_ab %~dp0images/imagefv.img
fastboot %* flash keymaster_ab %~dp0images/keymaster.img
fastboot %* flash modem_ab %~dp0images/modem.img
fastboot %* flash qupfw_ab %~dp0images/qupfw.img
fastboot %* flash tz_ab %~dp0images/tz.img
fastboot %* flash uefisecapp_ab %~dp0images/uefisecapp.img
fastboot %* --disable-verity --disable-verification flash vbmeta_ab %~dp0images/vbmeta.img
fastboot %* --disable-verity --disable-verification flash vbmeta_system_ab %~dp0images/vbmeta_system.img
fastboot %* flash vendor_boot_ab %~dp0images/vendor_boot.img
fastboot %* flash xbl_ab %~dp0images/xbl.img
fastboot %* flash xbl_config_ab %~dp0images/xbl_config.img
fastboot %* flash super %~dp0super.img
if "%CHOICE%" == "N" (
	echo.
	echo �û��������������...
	echo.
	fastboot %* erase userdata
	fastboot %* erase metadata
	fastboot -w
)
fastboot %* set_active a 
fastboot %* reboot 
echo ˢ�����!
echo.
echo �����������ύissue��
:Finish
goto Finish
