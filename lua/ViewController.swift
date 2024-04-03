//
//  ViewController.swift
//  lua
//
//  Created by 0x67 on 2024-04-03.
//

import UIKit
import liblua

class ViewController: UIViewController {

  @IBOutlet weak var outputLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let l = luaL_newstate()
    luaL_openlibs(l)
    
    let script = "return 'Hello World from lua!'"
    luaL_loadstring(l, script)
    
    lua_pcallk(l, 0, LUA_MULTRET, 0, 0, nil)
    
    // Close the Lua state
    
    var len: size_t = 0 // Variable to hold the string length
    if let cString = luaL_tolstring(l, -1, &len) {
      let swiftString = String(cString: cString)
      outputLabel.text = swiftString
    }
    
    lua_close(l)
  }


}

