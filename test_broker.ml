(**
   Test the Broker module.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)

open Broker

let _ = print_endline "test Broker ..."
let _ = Broker.heartbeat ()
let _ = Broker.udp_sendto "127.0.0.1" 1980 "hello, this is liang\n"

let _ = Broker.start_daemon2 ()

(**
let _ = Broker.send_msg "127.0.0.1" 1980
**)
