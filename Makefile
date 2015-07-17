all: test_all

test_all: test_cache.ml
	ocamlbuild -r -use-ocamlfind -tag thread -package lwt,cohttp,cohttp.lwt,cohttp.async,yojson test_cache.native
	ocamlbuild -r -use-ocamlfind -tag thread -syntax camlp4o -package lwt,lwt.unix,async,unix,cohttp,cohttp.lwt,lwt.syntax test_broker.native
	ocamlbuild -r -use-ocamlfind -tag thread -package lwt,cohttp,cohttp.lwt test_service.native

clean:
	rm -fr _build *.native *.cmi *.cmo *.annot *~