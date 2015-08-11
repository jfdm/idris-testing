##  Makefile

IDRIS := idris
LIB   := test
EXTRA := testextra

.PHONY: clean lib

install: lib
	${IDRIS} --install ${LIB}.ipkg
	${IDRIS} --install ${EXTRA}.ipkg

clean:
	${IDRIS} --clean ${LIB}.ipkg
	${IDRIS} --clean ${EXTRA}.ipkg
	find . -name "*~" -delete

clobber: clean
	find . -name "*.ibc" -delete

check: clobber
	${IDRIS} --checkpkg ${LIB}.ipkg
	${IDRIS} --checkpkg ${EXTRA}.ipkg

doc:
	${IDRIS} --mkdoc ${LIB}.ipkg
	${IDRIS} --mkdoc ${EXTRA}.ipkg
