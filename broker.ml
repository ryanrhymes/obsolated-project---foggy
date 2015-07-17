(**
   Broker module for service caching.
   Broker keeps a consistent view of the whole network. It knows where
   the service instances are cached.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)


module Broker = struct

  let friend_list = 0

  let heartbeat () =
    let s = Lwt_unix.sleep 5. in
    Lwt_main.run s

  let udp_sendto host port msg = 
    let socket = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM
      (Unix.getprotobyname "udp").Unix.p_proto in
    let _ = Unix.setsockopt socket Unix.SO_BROADCAST in
    let ipaddr = (Unix.gethostbyname host).Unix.h_addr_list.(0) in
    let portaddr = Unix.ADDR_INET (ipaddr, port) in
    print_endline (UnixLabels.string_of_inet_addr ipaddr);
    Unix.sendto socket msg 0 (String.length msg) [] portaddr

  let start_daemon = 0

(**
  let send_msg addr port =
    let addr = UnixLabels.inet_addr_of_string addr in
    let sock = Socket.Address.Inet.create addr port in
    print_endline "hi"
**)

end
