(**
   Service module for service caching
   This module deals with service migration and instantiation.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.14
**)

open Lwt

module Service = struct

  let pull ~uri = 
    ( Cohttp_lwt_unix.Client.get (Uri.of_string uri) 
    >>= fun (resp, body) -> Cohttp_lwt_body.to_string body )
    |> Lwt_main.run

  let push = 0

  let start = 0

  let stop = 0

  let pause = 0

  let save = 0

  let remove = 0

end
