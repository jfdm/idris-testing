# ----------------------------------------------------------------- [ Makefile ]
# Module    : Makefile
# Copyright : (c) Jan de Muijnck-Hughes
# License   : see LICENSE
# ---------------------------------------------------------------------- [ EOH ]

IDRIS  := idris
LIB    := test

.PHONY: clean lib install clobber check doc

lib:
	${IDRIS} --build ${LIB}.ipkg

install: lib
	${IDRIS} --install ${LIB}.ipkg

clean:
	${IDRIS} --clean ${LIB}.ipkg
	${IDRIS} --clean ${LIB}.ipkg
	find . -name "*~" -delete

clobber: clean
	find . -name "*.ibc" -delete

check: clobber
	${IDRIS} --checkpkg ${LIB}.ipkg

doc:
	${IDRIS} --mkdoc ${LIB}.ipkg

# ---------------------------------------------------------------------- [ EOF ]
