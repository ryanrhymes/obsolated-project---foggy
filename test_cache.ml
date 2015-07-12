(**
   Test the Cache module.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)

open Cache

let s1 = {id=1; uri="http://map.google.com"; timestamp=(Unix.time ()); size=100;}
let s2 = {id=2; uri="http://www.youtube.com"; timestamp=(Unix.time ()); size=200;}
let s3 = {id=3; uri="http://www.facebook.com"; timestamp=(Unix.time ()); size=300;};;
let s4 = {id=4; uri="http://map.twitter.com"; timestamp=(Unix.time ()); size=400;}

let _ = print_endline "add cache entries ..."
let _ = Cache.add s1
let _ = Cache.add s2
let _ = Cache.add s3
let _ = Cache.debug ()

let _ = print_endline "search cache entries ..."
let _ = Cache.print (Cache.find 2)

let _ = print_endline "remove cache entries ..."
let _ = Cache.remove 2
let _ = Cache.remove 4
let _ = Cache.debug ()
