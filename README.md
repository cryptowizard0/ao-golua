# ao-golua

Run ao in a native Lua 5.3 environment use golang.

### Environment Setup
- Install lua 5.3
- Install pkg-config and configure the path to lua5.3.pc in PKG_CONFIG_PATH 

For example:

``` export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/homebrew//Cellar/lua@5.3/5.3.6/lib/pkgconfig/```

### Running
- go mod tidy
- run from main.go

```bash
# add -tags "lua53"
go run -tags "lua53" main.go
```

### Lua Code Explanation
- `ao/aos` code
- `setenv.lua` initializes the Lua environment
- `token.lua` contains the test token code
- `test.lua` is the test entry point
- `main.go`
```go
func main() {
	L := lua.NewState()
	defer L.Close()
	L.OpenLibs()

	// set env
	err := L.DoFile("setenv.lua")
	if err != nil {
		fmt.Println("Error: ", err)
	}
	// load ao process
	err = L.DoFile("ao/process.lua")
	if err != nil {
		fmt.Println("Error: ", err)
		return
	}

	// run lua code
	err = L.DoFile("test.lua")
	if err != nil {
		fmt.Println("Error: ", err)
	}
}
```

### Modifications to ao

- Replace all function of ```pcall``` with ```unsafe_pcall``` in ao Lua code
- The process ```function print()``` in ```process.lua``` has been comment out
- lsqlite3 is not supported yet
