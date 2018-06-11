//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var string2 = "www/stackoverflow.com"
let url = URL(string: "hellow//world")

let lastComponent = string2.components(separatedBy: "/").last
//print(lastComponent)
print(url?.lastPathComponent)
