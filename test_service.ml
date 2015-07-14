(**
   Test the Broker module.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)

open Service

let _ = print_endline "test Broker ..."
let _ = Service.pull "http://www.google.com"

type both = | Int of int
	    | Float of float

let test x = 
  match x with
  | Int y -> Int (y + 1)
  | Float y -> Float (y +. 2.)


let a = test (Int 5)
let b = test (Float 6.)

let prt x =  match x with 
  | Int x -> print_endline (string_of_int x)
  | Float x -> print_endline (string_of_float x)

let _ = prt a
let _ = prt b

(**
let _ = print_endline (string_of_int (both 5))
**)
