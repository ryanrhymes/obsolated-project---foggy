(**
   Test the Broker module.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)

open Service

let _ = print_endline "test Broker ..."
let s = Service.pull "http://www.google.com" 
let _ = print_endline s
