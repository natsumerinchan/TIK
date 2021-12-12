
#  **TI Kitchen** 
v2.3更新

①修正大量bug，完善aarch64端支持

②界面微调

③更换清华源，加快配置速度

④添加项目迁移功能（aarch64）

v2.3更新

①完美同步proot/chroot环境下aarch64的支持（即手机版）

②安卓端支持分解V-AB的payload以及erofs，header3的boot了

③安卓端支持访问内置存储了，支持自定义获取ROM目录

④优化启动，解包，打包速度，在电脑端效果明显

 加入设置功能，自由调整压缩等级 等待时间等
 
⑤加入ROM信息预览条，可设置关闭

⑥补全支持安卓8及以下的ROM分解！

⑦加入自动补全fs_config，保证权限完整

v2.2更新

①MIUI更新地址一键获取（可选开发-稳定/机型/线刷-卡刷包/国内-波兰-国际...等等）

②全面支持安卓12解/打包

③修复部分逻辑错误，优化代码可读性

④完善下载模块，修复boot解包等

⑤新增分解dtbo，dtb，ofp，twrp的ext4备份文件（ozip，ops下次加上）

⑥支持解某些奇怪的分区（正在扩展）

⑦MIUI一键官改模块开始构建，欢迎各机型基友加入

####  **介绍** 


1.  【 **TI Kitchen** 】 永久开源的ROM工具箱，支持安卓全版本

2.  支持【 *.zip, *.br, *.dat, *.dat.1~20, ext4/2 *.img, payload.bin, *.win000-004 ，*.ops，dtbo，dtb，*.ozip】格式分解

3.  支持安卓≤12解包打包【包括动态分区】，安卓 [5.0~8.1] 使用[ make_ext4fs ]打包 ，安卓 [9.0+] 使用[ mke2fs+e2fsdroid ]打包

4.  支持V-AB的payload，header3，erofs解、打包
    - 测试包小米CIVI MIX4 K30Pro：[ _miui_LMI_21.11.3_d6464f494e_11.0.zip_ ](https://bigota.d.miui.com/21.11.3/miui_LMI_21.11.3_d6464f494e_11.0.zip)

5.  支持合并分段*.dat.*，最大支持20个(1～20 看了几个vivo rom，通常为15个分段文件，多了影响解包速度)
    - 测试包vivo Y9s：[ _PD1945_A_1.10.7-update-full_1589940104.zip_ ](http://sysupwrdl.vivo.com.cn/upgrade/official/officialFiles/PD1945_A_1.10.7-update-full_1589940104.zip)

6.  支持分解payload.bin

7.  支持分解TWRP备份文件（data除外），最大支持4个( _*.win000~004_ )   ----2020.11.24

8.  支持分解绿厂的ozip,ops,ofp等[ozip支持取消了，下版补回]

9.  加入AIK(Android-Image-Kitchen)分解合成[boot|exaid|recovery/etc].img, 已经补全手机端支持

10.  支持分解全版本super.img(V-AB)，测试-叶利钦的米板5

11.  修复部分动态分区size识别不准确问题！感谢 多幸运i 大佬 


####  **软件架构  同时支持** 

1. 手机 Termux Proot Ubuntu 20.04及以上版本 Arm64[aarch64] 或者 <Linux Deploy> Chroot Ubuntu 20.04及以上版本 Arm64[aarch64] 【推荐chroot，效率更高】

2. 电脑 Win10 Wsl/Wsl2 Ubuntu 20.04及以上版本 x86_64[x64]  没有用到mount,不强制要求wsl2

3. 虚拟机或实体机 Ubuntu 20.04及以上版本 x86_64[x64]  推荐！！！


####  **安装教程** 
1----手机运行Termux 获取存储权限 

    termux-setup-storage

2----一键安装ubuntu 

	bash <(curl -s https://gitee.com/yeliqin666/proot-ubuntu/raw/master/onekey_install.sh)


####  **使用说明** 

1.  Termux内所有操作尽量【 **不要使用系统root功能** 】， PC端需要root权限(sudo) 且最好不要在【root用户登录状态下】运行此工具，以免打包后刷入手机出现权限问题 ！

2.   **关于手机解压zip** 
    - 请将zip文件放置在【 **内置存储 /sdcard/TIK** 】工具会自动查找，设置中可以修改

3.  手机端termux proot ubuntu下工具目录： 【**/data/data/com.termux/files/home/ubuntu/root/TIK** 】

4.  **请勿删除【工程目录/TI_config文件夹】，打包时所需的文件信息都在此处，若你想修改打包img大小，可以打开 【工程目录/configs/*_size.txt】把里面数值改成你想要的大小，该数值必须是字节大小**，动态分区打包超出大小可以同时修改【工程目录/configs/*_size.txt】和【dynamic_partitions_op_list】 中例如【resize vendor ~2016763904~】 默认工具会自动帮您修改！

5.  由于手机性能、proot效率以及工具工作方式( **比如每次打包img前都要自动比对获取新增文件的fs_config，不会立刻询问是否打包** )等原因，保持耐心，等待片刻即可

6.  删除文件尽量在【Termux或proot ubuntu】执行 【rm -rf 文件、文件夹】 【 **不要使用系统root功能，除非你记得chmod 777** 】

7.   **不要放在含有中文名文件夹下运行，不要选择带有空格的文件进行解包，工程文件夹不得有空格或其他特殊符号 ！！！** 

8.  更新说明:删除 TIK 后，从下载工具那一步重来[工具很快就会加入内置更新功能！]

9.   **动态分区必须打包成原官方卡刷包格式[zip]（即打包成.new.dat.br或.new.dat，同时必须使用工程文件夹下的dynamic_partitions_op_list，一块压缩成zip卡刷包），不允许单刷.img** 

10.  手机上使用工具时如果使用 **系统ROOT** 对工程目录下进行了操作(比如： **添加文件，修改文件**等。。。 )，请记得给操作过的文件或文件夹  **777**  满权！！！

####  **参与贡献** 

特别感谢 @闲出屁的imagine @多幸运i

Credit:
1.  aarch64 [mke2fs & e2fsdroid from 小新大大](https://github.com/xiaoxindada/SGSI-build-tool)
2.  x86_64 [mke2fs & e2fsdroid from Erfan Abdi](https://github.com/erfanoabdi/ErfanGSIs)
3.  osm0sis @ Github: [Android-Image-Kitchen](https://github.com/osm0sis/Android-Image-Kitchen)
4.  ~xiliuya @ Github: [termux-linux](https://github.com/xiliuya/termux-linux)~

5.  xpirt   @ Github: [sdat2img.py](https://github.com/xpirt/sdat2img) & [img2sdat.py](https://github.com/xpirt/img2sdat)
6.  Cubi    @ Github: [ext4.py](https://github.com/cubinator/ext4)
7.  Gregory @ Github: [extract_android_ota_payload.py & update_metadata_pb2.py](https://github.com/cyxx/extract_android_ota_payload)
8.  Sergey  @ Github (unix3dgforce@MiuiPro.by DEV Team): [BatchApkTool UnpackerFirmware](https://github.com/unix3dgforce) & [lpunpack.py](https://github.com/unix3dgforce/lpunpack)


####  **工具预览** 

1.  手机 Termux Proot Ubuntu 20.04 Arm64[aarch64]

2.  虚拟机或实体机 Ubuntu 20.04 x86_64[x64]

3.  电脑 Win10 Wsl2 Ubuntu 20.04 x86_64[x64]


####  **交流反馈** 

1.  QQ群1：[939212867] ( https://jq.qq.com/?_wv=1027&k=HOJVFqzP )

    ~QQ群2：[945993403]



####  **免责声明** 

1.  本工具在Termux proot环境中运行，不需要root权限， 【 **请不要在Termux中使用系统root功能** 】 ！！！

2.  此工具不含任何【破坏系统、获取数据】等其他不法代码 ！！！

3.   **如果由于用户利用root权限对工具中的工程目录进行操作导致的数据丢失、损毁，本人不承担任何责任 ！！！** 


