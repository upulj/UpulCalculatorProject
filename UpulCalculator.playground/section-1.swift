// Playground - noun: a place where people can play

//Removing .0 from double value if it is an integer, this is because then i can add decimal point and values after doing so.
//For example before doing above, say if i get 10.0 in the display label, and i want to add .25 for 10.0 (to have 10.25), then i got an issue that
//how could i concatenate 0.25 to existing 10.0 as i got the value 10.025 as the result
//To avoid this issue i used the following to the code

import UIKit

var a = "1234.0"
if a.substringFromIndex(a.endIndex.predecessor().predecessor()) == ".0"{
println("int")
}
else{
    println("not")
}

a.substringFromIndex(a.endIndex.predecessor().predecessor())







