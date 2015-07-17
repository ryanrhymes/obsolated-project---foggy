(**
   Broker module for service caching.
   Broker keeps a consistent view of the whole network. It knows where
   the service instances are cached.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)

open Lwt

module Broker = struct

  let friend_list = 0

  let heartbeat () =
    let s = Lwt_unix.sleep 1. in
    Lwt_main.run s

  let udp_sendto host port msg = 
    let socket = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM
      (Unix.getprotobyname "udp").Unix.p_proto in
    let _ = Unix.setsockopt socket Unix.SO_BROADCAST in
    let ipaddr = (Unix.gethostbyname host).Unix.h_addr_list.(0) in
    let portaddr = Unix.ADDR_INET (ipaddr, port) in
    print_endline (UnixLabels.string_of_inet_addr ipaddr);
    Unix.sendto socket msg 0 (String.length msg) [] portaddr

  let start_http_server = let open Cohttp in let open Cohttp_lwt_unix in
    let callback _conn req body =
      let uri = req |> Request.uri |> Uri.to_string in
      let meth = req |> Request.meth |> Code.string_of_method in
      body |> Cohttp_lwt_body.to_string >|= (fun body ->
	(Printf.sprintf "Uri: %s\nMethod: %s\nBody: %s"
           uri meth body^" hello from liang")) >>= 
	  (fun body -> print_endline uri; Server.respond_string ~status:`OK ~body ())
    in
    Server.create ~mode:(`TCP (`Port 9973)) (Server.make ~callback ())

  let test () = 
    while true; do
      Unix.sleep 1;
      print_endline "heartbeat";
    done      

  let start_daemon () =
    let open Async.Std in
    In_thread.run (fun () -> print_endline "hello");
    ignore (Lwt_main.run start_http_server)

  let rec f () = 
    Lwt_unix.sleep 1. >>= fun () -> print_endline "A"; f()

  let rec g () = 
    Lwt_unix.sleep 2. >>= fun () -> print_endline "B"; g()

  let start_daemon2 () =
    let s = f() <&> g() >>= fun () -> (print_endline "never ..."; return ())
    in Lwt_main.run s


(**
  let send_msg addr port =
    let addr = UnixLabels.inet_addr_of_string addr in
    let sock = Socket.Address.Inet.create addr port in
    print_endline "hi"
**)

end
