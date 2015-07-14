(**
   Service module for service caching
   This module deals with service migration and instantiation.

   Liang Wang @ Computer Lab, Cambridge University, UK
   2015.07.14
**)


module Service = struct

  let pull ~uri = 
    print_endline ( "pull the service from ..." ^ uri )

  let push = 0

  let start = 0

  let stop = 0

  let pause = 0

  let save = 0

  let remove = 0

end
