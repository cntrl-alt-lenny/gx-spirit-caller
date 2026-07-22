# Signature refresh 3

Snapshot: 2026-07-22. This refresh uses the committed tree on the queue branch.

## Result

The committed Nitro/EUR signature directory contains 72 YAML definitions, and
EUR currently has 72 non-placeholder named ARM9 functions. The sets match, so
regenerating the database produces no YAML file delta: the database was already
up to date with the named-function set.

The comparison point is Brief 630's documented 29-signature refresh. The
definition-count delta is therefore **+43 signatures** (72 versus 29). The
functional apply delta in this refresh is **+2 names applied**: one shared
function address in USA and the same address in JPN. EUR had no new name to
apply because its 72 names are the source set.

## Round-trip canary

Before the bulk pass, `SysWork_GetPointDistance.yaml` was applied with
`--dry` against all three configs:

```text
dsd sig apply -c config/eur/arm9/config.yaml -s tools/signatures/nitro-sdk-eur/SysWork_GetPointDistance.yaml --dry  OK
dsd sig apply -c config/usa/arm9/config.yaml -s tools/signatures/nitro-sdk-eur/SysWork_GetPointDistance.yaml --dry  OK
dsd sig apply -c config/jpn/arm9/config.yaml -s tools/signatures/nitro-sdk-eur/SysWork_GetPointDistance.yaml --dry  OK
```

The dry runs resolved without a no-match or multiple-match error. The commonly
used `AutoloadCallback` signature was not used as the canary because its
pattern has multiple valid matches.

## Bulk dry-apply census

All 72 committed YAML definitions were dry-applied to each region (216 applies).
“No-op” means the target already had the signature's name; “multiple” is an
ambiguous pattern and was not changed; “error” is the existing relocation-target
ambiguity described below.

| region | YAMLs | no-op | multiple | apply errors | names applied |
|---|---:|---:|---:|---:|---:|
| EUR | 72 | 48 | 22 | 2 | 0 |
| USA | 72 | 49 | 22 | 0 | 1 |
| JPN | 72 | 49 | 22 | 0 | 1 |
| **total** | **216** | **146** | **66** | **2** | **2** |

The two applied names were both `0x02018b70`:

| region | old symbol | new symbol | cascade |
|---|---|---|---|
| USA | `func_02018b70` | `SysWork_ClearField0x810` | 1 symbol table, 2 source files, 1 filename, 1 delink |
| JPN | `func_02018b70` | `SysWork_ClearField0x810` | 1 symbol table, 2 source files, 1 filename, 1 delink |

These were applied with `tools/rename_symbol.py --cascade`, limited to the
respective region. No EUR rename was attempted: EUR already has the named
function at its matching region-specific address.

The two EUR apply errors are not unmatched function signatures. The
`Task_InvokeLocked` and `Task_PostLocked` signatures each reach a relocation
target for which more than one symbol is bound at `0x02104f1c`; dsd therefore
refuses to choose a target name. They remain unchanged and are recorded as
ambiguous rather than guessed.

For an independent generation check, `dsd sig new` was run for all 72 names
against EUR: **70 succeeded; 2 failed** for the same multi-symbol
`Task_InvokeLocked` / `Task_PostLocked` cases. Existing YAML files were not
overwritten.

## Gates

On the all-region gate runner, these commands all exited 0:

```text
dsd check modules -c config/eur/arm9/config.yaml -f
dsd check modules -c config/usa/arm9/config.yaml -f
dsd check modules -c config/jpn/arm9/config.yaml -f
```

Each reported `Check ...: OK` for ARM9 main, ITCM, DTCM, and overlays 0 through
23. The naming scope gate also passed after the two cascaded renames:

```text
python tools/scope_gate.py --kind naming --base origin/main
PASS scope        real-named delta = 194 across 3 region(s) (eur:72, usa:61, jpn:61); target 1
PASS dup-symbol   no function name bound to 2+ addresses in any region
PASS cascade      no placeholder names were renamed away (nothing to cascade)
scope_gate: PASS — scope met, no dup-symbol, renames fully cascaded.
```

The 194 total includes the already-stacked naming changes from the preceding
queue PRs; this item contributes the two new region applications listed above.
