
#  **TI Kitchen** 

开发者yeliqin666失去测试设备与开发条件，将退出工具开发，将由其他大佬接管


请关注工具主页更新提醒！
####  **介绍** 


1.  【 **TI Kitchen** 】 永久开源的ROM工具箱，支持安卓全版本

2.  支持【 *.zip, *.br, super ,*.dat, *.dat.1~20, ext4/2 *.img, payload.bin, *.win000-004 ，*.ops，dtbo，dtb，*.ofp,*.ozip】格式分解

3.  支持安卓全版本解包/打包【包括动态分区】，使用[ mke2fs+e2fsdroid ]

4.  支持V-AB的payload，header3，erofs解、打包

5.  支持合并分段*.dat.*，分段img

6.  支持分解payload.bin，合成payload.bin功能已完成，但需测试签名，暂不放出（预计全网首发，感谢@秋水）
	
7.  支持分解TWRP备份文件（data除外），最大支持4个( _*.win000~004_ )

8.  支持分解绿厂的ops,ofp(ozip已被弃用)等

9.  加入AIK(Android-Image-Kitchen)分解合成[boot|exaid|recovery/etc].img, 已经补全手机端支持

10.  支持分解全版本super.img(V-AB)支持各种类型打包（半自动识别，高效稳定）

11.  修复部分动态分区size识别不准确问题，


####  **软件架构  同时支持** 

1. 手机 Termux Proot Ubuntu 20.04及以上版本 Arm64[aarch64] 或者 <Linux Deploy> Chroot Ubuntu 20.04及以上版本 Arm64[aarch64] 【推荐chroot，效率更高】

2. 电脑 Win10 Wsl/Wsl2 Ubuntu 20.04及以上版本 x86_64[x64]  推荐wsl1!

3. 虚拟机或实体机 Ubuntu 20.04及以上版本 x86_64[x64]  不推荐deepin等，兼容性差！


####  **安装教程** 

    git clone https://gitee.com/yeliqin666/TIK
    cd TIK && ./run

【手机端--需配置proot环境】
1----手机运行Termux 获取存储权限 

        termux-setup-storage

2----手机一键配置proot并下载工具

	bash <(curl -s https://gitee.com/yeliqin666/proot-ubuntu/raw/master/onekey_install.sh)


####  **使用说明** 

1.  Termux内所有操作尽量【 **不要使用系统root功能** 】， PC端需要root权限(sudo) 且最好不要在【root用户登录状态下】运行此工具，以免打包后刷入手机出现权限问题 ！

2.   **关于手机解压zip** 
    - 请将zip文件放置在【 **内置存储 /sdcard/TIK** 】，工具会自动查找（设置中可以修改)

3.  手机端termux proot ubuntu下工具目录： 【**/data/data/com.termux/files/home/ubuntu/root/TIK** 】

4.  **请勿删除【工程目录/TI_config文件夹】，打包时所需的文件信息都在此处，默认工具会自动帮您修改大小，适配动态分区！！！

5.  由于手机性能、proot效率、工作模式( **如打包img前自动比对fs_config，不会立刻打包** )等原因，保持耐心，等待片刻即可；

6.  删除文件尽量在【Termux或proot ubuntu】执行 【rm -rf 文件、文件夹】 【 **不要使用系统root功能 ** 】

7.   **不要放在含有中文名文件夹下运行，不要选择带有空格的文件进行解包，工程文件夹不得有空格或其他特殊符号 ，文件名不要过长！！！** 

8.   **动态分区不允许单刷.img，具体请参见安卓文档** 

10.  手机上使用工具时如果使用 **系统ROOT** 对工程目录下进行了操作(比如： **添加文件，修改文件**等。。。 )，请记得给操作过的文件或文件夹  **777**  满权！！！

####  **参与贡献** 

Credit:
1.  mke2fs & e2fsdroid [aarch64 from @多幸运](http://www.coolapk.com/u/8160711)
2.  x86_64 [mke2fs & e2fsdroid from Erfan Abdi](https://github.com/erfanoabdi/ErfanGSIs)
3.  Android-Image-Kitchen(modified by @yeliqin666): [osm0sis @ Github](https://github.com/osm0sis/Android-Image-Kitchen)
4.  termux-linux: [~xiliuya @ Github](https://github.com/xiliuya/termux-linux)~
5.  sdat2img.py: [xpirt   @ Github](https://github.com/xpirt/sdat2img) & [img2sdat.py](https://github.com/xpirt/img2sdat)
6.  ext4.py: [Cubi    @ Github](https://github.com/cubinator/ext4)
7.  payload-dumper-go(modified by @yeliqin666): [ssut @ Github](https://github.com/ssut/payload-dumper-go)
8.  dtb_tools [from 小新大大 and 黑风](https://github.com/xiaoxindada/SGSI-build-tool)(http://www.coolapk.com/u/3473348)
9.  FlashImageTools [from @hais](http://z.hais.pw/)
10. oppo_decrypt [from bkerler @github](https://github.com/bkerler/oppo_decrypt)
11. get_miui.py (By NightstarSakura) [@Github](https://github.com/NightstarSakura) [@酷安](https://www.coolapk.com/u/2670027)
12. fs.py [from @hais](http://z.hais.pw/)
13. imgextractor.py [from 小新大大](https://github.com/xiaoxindada)
14. lpmake & lpunpack aarch64[from @hais](http://z.hais.pw/)
15. lpmake & lpunpack x86_64[from @yeliqin666](https://github.com/yeliqin666)
16. mkfs.erofs aarch64 & x86_64 [from @忘川](https://github.com/bugme2/)
17. simg2img [from @多幸运](http://www.coolapk.com/u/8160711)
18. erofsUnpackKt [from @忘川](https://github.com/bugme2/erofs-oneplus)
19. pack_ext4_with-rw.bash(modified by @yeliqin666) [from @多幸运](http://www.coolapk.com/u/8160711)
20. pack_super.bash(modified by @yeliqin666) [from @秋水](Email：qiurigao@163.com)
21. pack_payload.bin tools on x64_64 [from @秋水](Email：qiurigao@163.com)
22. show.bash_with-dialog(modified by @yeliqin666) [CSDN]
23. D.N.A. & CYToolkit for reference on UI [@sharpeter ](https://gitee.com/sharpeter/DNA) [@闲出屁的imagine](https://github.com/NightstarSakura)
24. debuging & suggestions [the active users!]


####  **交流反馈** 

  QQ群：[939212867] ( https://jq.qq.com/?_wv=1027&k=HOJVFqzP )

  酷安话题#TIK工具箱#


####  **免责声明** 

1.  本工具在Termux proot环境中运行，不需要root权限 【 **请在Termux中慎用系统root功能** 】 ！！！

2.  此工具不含任何【破坏系统、获取数据】等其他不法代码 ！！！

3.  **如果由于用户利用root权限对工具中的工程目录进行操作导致的数据丢失、损毁，本人不承担任何责任 ！！！** 


