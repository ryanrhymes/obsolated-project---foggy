all: test_cache

test_cache: test_cache.ml
	ocamlbuild -r -use-ocamlfind -tag thread -package lwt,cohttp,cohttp.lwt,cohttp.async,yojson test_cache.native

clean:
	rm -fr _build *.native *.cmi *.cmo *.annot *~