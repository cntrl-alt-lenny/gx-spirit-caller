# dsd naming signatures

`nitro-sdk-eur/` is the committed EUR seed database for `dsd sig apply`.
It contains 72 YAML signatures generated with `dsd sig new` from the named
functions in all EUR ARM9 modules, including the two multi-instance seeds
generated with `-n 0` and the three FS overlay helpers exposed by dsd's
built-in signature set.

The current checkout contains 100 `libs/nitro/*.legacy.c` files, but only
`OS_DefaultIrqHandler.legacy.c` has a real function name; the other 99 retain
`func_*` names. No SDK names were invented for those placeholders. Their
source inventory is recorded here by the 72 checked-in signatures plus the
existing named config functions.
