@echo off
title TIK工具箱-V-AB线刷脚本
echo.
echo 欢迎使用免费且开源的ROM工具箱：TIBOX！
echo.
set /p CHOICE=是否要【保留】您设备中的【数据】？(默认Y保留/输入N则删除)
echo 请将手机进入到Fastboot模式
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
fastboot %* flash vbmeta_ab %~dp0images/vbmeta.img
fastboot %* flash vbmeta_system_ab %~dp0images/vbmeta_system.img
fastboot %* flash vendor_boot_ab %~dp0images/vendor_boot.img
fastboot %* flash xbl_ab %~dp0images/xbl.img
fastboot %* flash xbl_config_ab %~dp0images/xbl_config.img
fastboot %* flash super %~dp0super.img
if exist images\vendor_dlkm.img echo 在重启到fastbootd用户分区！
if exist images\vendor_dlkm.img fastboot reboot fastboot
if exist images\vendor_dlkm.img echo 开始写入vendor dlkm独立分区！
if exist images\vendor_dlkm.img fastboot create-logical-partition vendor_dlkm_a 1024
if exist images\vendor_dlkm.img fastboot create-logical-partition vendor_dlkm_b 0
if exist images\vendor_dlkm.img fastboot flash vendor_dlkm_a images\vendor_dlkm.img
if "%CHOICE%" == "N" (
	echo.
	echo 用户数据正在清除中...
	echo.
	fastboot -w
	fastboot %* erase userdata
	fastboot %* erase metadata
)
fastboot %* set_active a 
fastboot %* reboot 
echo 刷机完成!
echo.

:Finish
goto Finish
