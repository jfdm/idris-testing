##  Makefile

IDRIS := idris
LIB   := test

.PHONY: clean lib

lib:
	${IDRIS} --build ${LIB}.ipkg

install: lib
	${IDRIS} --install ${LIB}.ipkg

clean:
	${IDRIS} --clean ${LIB}.ipkg
	find . -name "*~" -delete

clobber: clean
	find . -name "*.ibc" -delete

check: clobber
	${IDRIS} --checkpkg ${LIB}.ipkg

doc:
	${IDRIS} --mkdoc ${LIB}.ipkg
