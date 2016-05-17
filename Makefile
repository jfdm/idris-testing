# ----------------------------------------------------------------- [ Makefile ]
# Module    : Makefile
# Copyright : (c) Jan de Muijnck-Hughes
# License   : see LICENSE
# ---------------------------------------------------------------------- [ EOH ]

IDRIS  := idris
LIBA   := test
LIBB   := testparse

.PHONY: clean lib install clobber checkLib checkLibParse doc

lib:
	${IDRIS} --build ${LIBA}.ipkg
	${IDRIS} --build ${LIBB}.ipkg

install: lib
	${IDRIS} --install ${LIBA}.ipkg
	${IDRIS} --install ${LIBB}.ipkg

clean:
	${IDRIS} --clean ${LIBA}.ipkg
	${IDRIS} --clean ${LIBB}.ipkg
	find . -name "*~" -delete

clobber: clean
	find . -name "*.ibc" -delete

checkLib: clobber
	${IDRIS} --checkpkg ${LIBA}.ipkg

checkLibParse: clobber
	${IDRIS} --checkpkg ${LIBB}.ipkg

doc:
	${IDRIS} --mkdoc ${LIBA}.ipkg
	${IDRIS} --mkdoc ${LIBB}.ipkg


# ---------------------------------------------------------------------- [ EOF ]
