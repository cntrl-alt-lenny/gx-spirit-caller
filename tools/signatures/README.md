# dsd named-function signatures

`nitro-sdk-eur/` contains 112 YAML signatures for the currently real-named
EUR ARM9 functions in the checked-in config. The signatures are used with
`dsd sig apply --dry` to identify un-named regional twins; the resulting
symbol changes are applied through `tools/rename_symbol.py --cascade`.

The refresh regenerated 109 of the 112 current names. `Task_PostLocked`,
`Task_InvokeLocked`, and `Ov008_Rand` retain their existing signatures because
`dsd sig new` still refuses them due to ambiguous symbol aliases in their
relocation targets; none was guessed or applied from a new signature.
