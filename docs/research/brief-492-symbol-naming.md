[//]: # (markdownlint-disable MD013 MD041)

# Brief 492 — EUR symbol-naming swarm (29 applied + review list)

A read-only multi-agent SWARM proposed `ModuleName_Verb` names for the **2,385 matched-C `func_*` EUR functions** from each `.c` (code + comment) + its already-named SDK callees. Names were applied ONLY where the swarm was genuinely confident (the rest stay `func_XXXX` — a wrong name is worse). All renames are **byte-neutral** (only labels/filenames change) and **EUR-only** (`config/eur` + non-region `src/` — excluded from USA/JPN builds per configure.py).

## Applied — 29 high-confidence renames (byte-neutral, verified 0 dangling refs)

| func | new name |
|---|---|
| `func_02006368` | **Task_InvokeLockedIrq** |
| `func_02006e1c` | **Task_Invoke** |
| `func_0200faf8` | **List_Unlink** |
| `func_02018ba4` | **SysWork_ClearField0x810** |
| `func_02018f2c` | **SysWork_GetPointDistance** |
| `func_0202250c` | **Rand_Next** |
| `func_0208deec` | **Vram_GetBankBaseE** |
| `func_0208df40` | **Vram_GetBankBaseCD** |
| `func_ov003_021ccd20` | **Bg_FillTileRect** |
| `func_ov006_021b4ad8` | **Ov006_FullInit** |
| `func_ov011_021cc948` | **Bg_SetScroll** |
| `func_ov008_021aa50c` | **Ov008_Rand** |
| `func_ov012_021cbf74` | **Ov012_BeginIntroTransition** |
| `func_ov013_021ca294` | **Ov013_GetPageCount** |
| `func_ov013_021ca5d4` | **Ov013_SetBlendAlpha** |
| `func_ov013_021ca618` | **Ov013_SlotToCell** |
| `func_ov013_021ca68c` | **Ov013_SetPage** |
| `func_ov013_021cb644` | **Ov013_InitGraphics** |
| `func_ov014_021b25b0` | **Ov014_UpdatePanes** |
| `func_ov014_021b3440` | **Ov014_HitTestPrimary** |
| `func_ov014_021b34f0` | **Ov014_HitTestSecondary** |
| `func_ov015_021b238c` | **Ov015_UpdateScrollTarget** |
| `func_ov015_021b2b08` | **Ov015_SelectVramBank** |
| `func_ov015_021b2b80` | **Ov015_SelectVramBankSub** |
| `func_ov015_021b2bf8` | **Ov015_RegisterCallbacks** |
| `func_ov015_021b3028` | **Ov015_DrawStatusFields** |
| `func_ov015_021b3170` | **Ov015_InitScroller** |
| `func_ov021_021aa514` | **Audio_Init** |
| `func_ov021_021aa908` | **Scene_Update** |

Mechanics: `git mv` the `.c` + word-boundary token-replace `func_X` across symbols.txt + delinks.txt + ALL caller `.c` AND `.s` (245 files touched, 0 leftover). The brain byte-verifies 3-region `ninja sha1` on merge.

## Conservative yield is the point — 29 of 2,385

Distribution: **39 high** (29 applied + 10 clone-collisions held), **237 med**, **2,109 none**. Only ~39 genuine semantic anchors exist in EUR (NitroSDK OS_/Task_/SND_/Fill32…), so confident `ModuleName_Verb` naming is feasible mainly for (a) SDK-wrapper funcs, (b) recognisable idioms (Bit_PopCount SWAR, MD5 init constants, MSVC LCG rand), (c) structured overlays (ov013 paged-menu, ov014 hit-test, ov015 scroller). The other ~2,100 are trivial accessors / const-returns / opaque thunks where a name would be a guess — left `func_XXXX` honestly.

## Review list — 229 med + 10 clone-collisions (NOT applied; for human review)

Full list in `brief-492-name-review.json`. A sample:

| func | proposed | why held |
|---|---|---|
| `func_020058b4` | Os_ClearVBlankFlag | IRQ-bracketed VBlank IE clear of flag |
| `func_02005bfc` | Task_PostByFlags | posts tasks per flag bits, stores hand |
| `func_02005c60` | Task_InvokeByKind | selects handle, tail-calls Task_Invoke |
| `func_02006314` | Os_DisableIme | Clears REG_IME then tail-calls OS_Disa |
| `func_02006334` | Task_PostLockedIrq | IRQ-bracketed Task_PostLocked wrapper, |
| `func_0200ad90` | Task_InvokeSlotAndClear | invokes task slot then clears it |
| `func_0200af08` | Task_TryInvoke | null-guarded Task_InvokeLocked wrapper |
| `func_0200b06c` | Task_InvokeList | invokes each task in list then list/se |
| `func_0200bca8` | Task_AllocZeroed | alloc n*0x38 via Task_PostLocked, zero |
| `func_0200bce4` | Task_AllocZeroed | alloc n*0x18 via Task_PostLocked, zero |
| `func_0200bd20` | Task_AllocZeroed | alloc n*8 via Task_PostLocked, zero vi |
| `func_0200bd58` | Task_AllocZeroed | alloc n*8 via Task_PostLocked, zero vi |
| `func_0200c558` | Task_Cancel | invokes+clears task callback, clears a |
| `func_0200c824` | Task_SetSlotValue | lazy-alloc table via Task_PostLocked,  |
| `func_020115e0` | Mtx_InitTranslate | inits 3x3 fixed-point matrix with tran |
| `func_02018a38` | SysWork_SetField0x8e8Bits11 | bitfield insert into SysWork; exact fi |
| `func_02018a64` | SysWork_ClearField0x8e8Bits11 | bit-clear of same field; meaning of fi |
| `func_02018b34` | SysWork_SetHardTier | writes SysWork field 0x814, comment ca |
| `func_02018b48` | SysWork_GetHardTier | reads SysWork field 0x814, hard-tier g |
| `func_02018b58` | SysWork_GetFlag0x8f8Bit16 | extracts single flag bit from SysWork  |
| `func_02018b70` | SysWork_SetFlag0x8f8Bit15 | inserts flag bit into SysWork field |
| `func_02018b94` | SysWork_GetField0x810Ptr | returns pointer to SysWork sub-struct  |
| `func_02018bc0` | SysWork_GetEntry | returns stride-0x18 indexed entry in S |
| `func_02018d98` | SysWork_GetEntryFlagBit1 | reads bit1 of stride-24 SysWork entry  |
| … | … | (205 more in the .json) |

Clone-family collisions held (same name for >1 func — need distinct names): Bit_PopCount, Ov006_BlankDisplay, Ov006_DispatchCallback, Ov006_InitAudio, Ov006_InitDisplay.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
