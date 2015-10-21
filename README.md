只能在真机上运行，虚拟机上缺少相关得库文件
配置:
1、加入框架 Security.framework
2、添加路劲 在Build Settings ->搜索"search paths"->在Head Search Paths里面加入:$(PROJECT_DIR)/RSADemo/openSSL 
