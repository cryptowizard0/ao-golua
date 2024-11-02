# ao-golua

Run ao in a native Lua 5.3 environment use golang.

### Environment Setup
- Install lua 5.3
- Compile `lsqlite.so` and copy it to the `ao/` directory.
- Install pkg-config and configure the path to lua5.3.pc in PKG_CONFIG_PATH 

For example: ``` export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/homebrew//Cellar/lua@5.3/5.3.6/lib/pkgconfig/```

### Running
- go mod tidy
- run from main.go

```bash
# add -tags "lua53"
go run -tags "lua53" main.go
```

### Lua Code Explanation
- `ao/` aos code
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
return:
```bash
process
version: 2.0.0.rc2

token.lua info:
Name: Watermelon game test token
Handlers: 
version: 0.0.5
 - info
 - balance
 - balances
 - transfer
 - mint
 - totalSupply

token.Info
Name: Watermelon game test token
Ticker: WGAME-TEST
Logo: SBCCXwwecBlDqRLUjb8dYABExTJXLieawf7m2aBJ-KY
Denomination: 12
Desc: The Watermelon game test token
true

token.Mint
Successfully minted 1000 to 0x123
true

token.Balance
1000
true
```

### Modifications to ao
- The process ```function print()``` in ```process.lua``` has been comment out

