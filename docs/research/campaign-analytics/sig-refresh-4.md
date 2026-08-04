# Signature Refresh 4

Snapshot: 2026-08-04. This refresh follows the C%-jump from 8.48% to
14.11% and rebuilds the committed EUR signature corpus from all currently
real-named EUR ARM9 functions.

## Result

The EUR config contains 112 real-named function symbols and the refreshed
directory contains 112 YAML definitions. `dsd sig new` regenerated 109 of the
112 names. `Task_PostLocked`, `Task_InvokeLocked`, and `Ov008_Rand` were not
regenerated: dsd reported ambiguous symbol aliases in relocation targets.
Their existing definitions were retained. No signature failure was guessed
through.

Compared with the previous refresh's 72 definitions, this is **+40 YAML
definitions**. Compared with b630's documented 29-signature baseline, it is
**+83 definitions**.

## Round-trip canary

`FS_LoadOverlayInfo` was temporarily renamed to `func_02098a4c` in EUR with
`rename_symbol.py --cascade`. Dry signature apply then emitted:

```text
[INFO ] Applying signature: FS_LoadOverlayInfo
[INFO ] Renamed function at 0x02098a4c in ARM9 main to 'FS_LoadOverlayInfo'
[INFO ] Dry run enabled, no changes were written
```

The cascade was restored immediately and the worktree had no canary residue.

## Bulk dry-apply census

All 112 signatures were dry-applied to all three regions: 336 invocations.
The first pass found 8 actual function proposals, all four USA/JPN twin pairs:

| EUR signature | USA target | JPN target |
|---|---|---|
| `FindU16InArray` | `0x020acda4` | `0x020acda4` |
| `OSi_RemoveLinkFromQueue` | `0x020920c0` | `0x020920c0` |
| `Strchr` | `0x020aaf94` | `0x020aaf94` |
| `Strlen` | `0x020a690c` | `0x020a690c` |

EUR had 0 proposals; USA had 4; JPN had 4. All 8 were applied through
`rename_symbol.py --cascade`. A second 336-invocation dry sweep reported:

```text
FINAL_DRY_PROPOSALS total=0
  eur: 0
  usa: 0
  jpn: 0
```

## Gates

`dsd check modules` exited 0 for EUR, USA, and JPN; every ARM9 main, ITCM,
DTCM, and overlay 0-23 check reported `OK`. The naming scope gate passed
after the cross-region batch. The full three-region ROM gate is recorded in
the companion PR body.
