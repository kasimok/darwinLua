//
//  LuaUtils.swift
//  lua
//
//  Created by 0x67 on 2024-04-04.
//

import Foundation
import liblua

func labelTextFromLua() -> String {
  let l = luaL_newstate()
  defer {
    lua_close(l)
  }
  luaL_openlibs(l)
  
  let script = "return 'Hello World from lua!'"
  luaL_loadstring(l, script)
  
  lua_pcallk(l, 0, LUA_MULTRET, 0, 0, nil)
  
  // Close the Lua state
  var len: size_t = 0 // Variable to hold the string length
  if let cString = luaL_tolstring(l, -1, &len) {
    let swiftString = String(cString: cString)
    return swiftString
  } else {
    return ""
  }
  
  }
