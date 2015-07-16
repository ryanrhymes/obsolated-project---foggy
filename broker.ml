(**
   Broker module for service caching.
   Broker keeps a consistent view of the whole network. It knows where
   the service instances are cached.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.13
**)

open Async.Std

module Broker = struct

  let friend_list = 0

  let heartbeat = 0

  let start_daemon = 0

end
