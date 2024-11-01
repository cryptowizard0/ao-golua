package main

import (
	"fmt"

	"github.com/aarzilli/golua/lua"
)

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
