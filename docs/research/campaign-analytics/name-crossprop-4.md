# Cross-Region Name Propagation Sweep 4

Snapshot: 2026-08-04. This sweep follows Signature Refresh 4 and uses the
refreshed 112-signature EUR corpus as the validated twin resolver.

## Result

Four EUR names had one un-named twin in each target region. All four USA and
all four JPN instances were propagated with `rename_symbol.py --cascade`:

| name | USA | JPN |
|---|---|---|
| `FindU16InArray` | `func_020acda4` | `func_020acda4` |
| `OSi_RemoveLinkFromQueue` | `func_020920c0` | `func_020920c0` |
| `Strchr` | `func_020aaf94` | `func_020aaf94` |
| `Strlen` | `func_020a690c` | `func_020a690c` |

**Twins propagated: 8 region instances (4 EUR names × USA/JPN).**

The post-apply full signature dry sweep found zero residual proposals in all
three regions, so there are no unresolved unique twins left in this corpus.
Ambiguous matches were left unchanged; no names were invented.

## Gate

The naming scope gate reported scope delta 8 for this batch, no duplicate
symbols, and all four renamed-away placeholders fully cascaded out of source.
`dsd check modules` was green for all three regions.
