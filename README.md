### 环境准备
- 安装 lua 5.3
- 安装 pkg-config 并配置 lua5.3.pc 路径到 PKG_CONFIG_PATH
如：export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/homebrew//Cellar/lua@5.3/5.3.6/lib/pkgconfig/

### 运行
加 -tags "lua53"
```bash
go run -tags "lua53" main.go
```

### ao 的修改

- ao lua代码中所有的 pcall 替换成 unsafe_pcall
- lsqlite3 还不支持
- process 的 function print(a) 函数被替换了，注释掉