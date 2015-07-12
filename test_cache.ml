(**
   Test the Cache module.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)

open Cache

let s1 = {id=1; uri="http://map.google.com"; timestamp=(Unix.time ()); size=100;}
let s2 = {id=2; uri="http://www.youtube.com"; timestamp=(Unix.time ()); size=200;}
let s3 = {id=3; uri="http://www.facebook.com"; timestamp=(Unix.time ()); size=300;};;

let _ = Cache.add s1
let _ = Cache.add s2
let _ = Cache.add s3
