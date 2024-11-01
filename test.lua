require('token')
local ao = require('ao')

print("process"  )
Version()

print()
print("token.lua info:")
print("Name: " .. Name)

print("Handlers: "  )
print("version: " .. Handlers._version)
for _, value in pairs(Handlers.list) do
    print(" - " .. value.name)
end



ao.id = "0x123"
print()
print("token.Info")
msgInfo = {
    From = "0x123",
    Tags = {Action = "Info"},
}
local resp = Handlers.evaluate(msgInfo, {})
print(resp)

print()
print("token.Mint")
msgMint = {
    From = "0x123",
    Tags = {Action = "Mint",},
    Quantity = "1000",
}
local resp = Handlers.evaluate(msgMint, {})
print(resp)

print()
print("token.Balance")
msgBalance = {
    From = "0x123",
    Tags = {Action = "Balance",},
}

local resp = Handlers.evaluate(msgBalance, {})
print(resp)