[//]: # (markdownlint-disable MD013 MD041)

# Brief 610 - NitroSDK naming campaign

Wine-free symbol-only campaign from `origin/main`. No ROM, SHA1, or Wine
build was run; names change configuration metadata only.

## Canary

Renamed EUR `func_02000b64` to the existing repo-supported `FX_Init` port
name. `dsd check modules -c config/<region>/arm9/config.yaml` returned exit
0 for all three regions. Its output reports 27 checksum notices per region
because this worktree intentionally has no linked ROM build; `ninja delink`
returned exit 0 for EUR, USA, and JPN before and after the renames.

## Phase 1 - dsd signatures

The vendored `libs/nitro` reference produced a dictionary of 26 declarations
across 2 subsystems. `dsd sig list` exposed `FS_LoadOverlay` and
`FS_UnloadOverlay`. Applying all known signatures gave:

| Region | Names added by dsd sig |
|---|---:|
| EUR | 3 |
| USA | 3 |
| JPN | 3 |

`FS_LoadOverlay` had no match in any region. `FS_UnloadOverlay` named the
function plus `FS_LoadOverlayInfo` and `FS_StopOverlay` in each region.

## Phase 2 - narrowed candidates

The default `nitro_suggest_renames.py` scan found 0 tractable candidates.
Relaxing to `--min-size 2 --min-callers 1` found 4 LOW-confidence candidates,
all with score 0; there were 0 HIGH and 0 MEDIUM candidates. The complete
`bulk_rename_candidates.py` scan covered 124 named EUR anchors and found 0
HIGH/MED sibling families. No Phase 2 names were invented outside a tool
candidate set.

**Phase 2 result: 0 names.**

## Phase 3 - exact cross-region propagation

Read-only `dsd sig new` plus `dsd sig apply --dry` probing covered 124 named
EUR sources; 122 produced signatures. It found 20 exact unambiguous
placeholder twins in USA and the same 20 in JPN. The propagated names were:

`Bg_FillTileRect`, `Ov008_Rand`, `Bg_SetScroll`,
`Ov012_BeginIntroTransition`, `Ov013_GetPageCount`, `Ov013_SetBlendAlpha`,
`Ov013_SlotToCell`, `Ov013_SetPage`, `Ov013_InitGraphics`,
`Ov014_UpdatePanes`, `Ov014_HitTestPrimary`, `Audio_Init`, `Scene_Update`,
`Task_InvokeLockedIrq`, `List_Unlink`, `SysWork_ClearField0x810`,
`SysWork_GetPointDistance`, `Rand_Next`, `OSi_PostIrqEvent`,
`__register_global_object`.

| Region | Phase 3 names |
|---|---:|
| EUR | 0 |
| USA | 20 |
| JPN | 20 |

The 10 exact `__sinit_*` twin hits were excluded because the brief requested
`func_*` targets, not compiler-generated names.

## Totals

| Region | Canary | Phase 1 | Phase 2 | Phase 3 | Total |
|---|---:|---:|---:|---:|---:|
| EUR | 1 | 3 | 0 | 0 | **4** |
| USA | 0 | 3 | 0 | 20 | **23** |
| JPN | 0 | 3 | 0 | 20 | **23** |
| **All** | **1** | **9** | **0** | **40** | **50** |

Final native structural validation: `ninja delink` exit 0 in all three
regions; `dsd check modules` exit 0 in all three regions with the same
27 no-linked-build checksum notices described above. `git diff --check` is
clean. The brain must run the three-region SHA1 gate after merge.
