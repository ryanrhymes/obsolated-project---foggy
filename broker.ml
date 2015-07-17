(**
   Broker module for service caching.
   Broker keeps a consistent view of the whole network. It knows where
   the service instances are cached.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)


open Unix

module Broker = struct

  let friend_list = 0

  let heartbeat hostname port msg = 
    let socket = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM
      (Unix.getprotobyname "udp").Unix.p_proto in
    let ipaddr = (Unix.gethostbyname hostname).Unix.h_addr_list.(0) in
    let portaddr = Unix.ADDR_INET (ipaddr, port) in
    print_endline (UnixLabels.string_of_inet_addr ipaddr);
    let len = Unix.sendto socket msg 0 (String.length msg) [] portaddr in
    len

  let start_daemon = 0

(**
  let send_msg addr port =
    let addr = UnixLabels.inet_addr_of_string addr in
    let sock = Socket.Address.Inet.create addr port in
    print_endline "hi"
**)

end
