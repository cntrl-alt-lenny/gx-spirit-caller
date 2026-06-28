# Module: overlay013

## Summary

Overlay013 implements the **Duel Monster / Deck-slot selection UI** — a paginated overlay that lets the player browse available monsters in slot-grid form, pick one (or confirm an action), and animate a slide or fade transition between pages. The module owns two large BSS work-blocks (`data_ov013_021cbc00` / `data_ov013_021cbc3c`) that hold the UI state machine (page index, blend alpha in fixed-point, a handle for `Task_InvokeLocked`, and an 18-state sub-step counter packed into bitfields). It drives the NDS display hardware directly: `BLDALPHA` (0x4000014 / 0x4001014) is programmed every frame via `Ov013_SetBlendAlpha`, BG/OBJ display-control registers are reconfigured during init, and OAM cell assignments are handled through `Ov013_SlotToCell`.

The UI is paged: `Ov013_GetPageCount` computes the number of pages for the current item list (ceil of count/3); `Ov013_SetPage` triggers a forward or reverse slide animation and re-skins the active tab cell. The main per-frame dispatcher (`func_ov013_021ca7cc`, 0xe78 bytes) is an 18-branch jump-table over a sub-step field, handling input polling (`GetSystemWork`, touch / button decode), item selection, dual-engine sprite animation, and page-flip sequencing. Supporting helpers prepare OAM task records (`func_ov013_021ca024` / `func_ov013_021ca15c`), enumerate candidate sprites for the current page (`func_ov013_021ca2b8`), choose an audio-visual resource set from six data tables (`func_ov013_021ca70c`), and drive the full entry/exit lifecycle (`func_ov013_021c9d74` = init, `func_ov013_021ca42c` = activate, `func_ov013_021cb674` = re-enter/reload, `func_ov013_021cb700` = step through an indexed callback table, `func_ov013_021c9d60` = paired-call setup shim).

## Function inventory

| addr | size | status | name_current | proposed_name | confidence | rationale |
|------|------|--------|-------------|--------------|-----------|-----------|
| 0x021c9d60 | 0x14 | SHIP | func_ov013_021c9d60 | Ov013_SetupPairedInit | MED | Tiny 3-BL shim: calls two cross-overlay funcs then intra-overlay `func_ov013_021ca024`; pattern matches other "setup then dispatch" shims |
| 0x021c9d74 | 0x284 | SHIP | func_ov013_021c9d74 | Ov013_Init | HIGH | Fills BSS to zero, initialises BG/OBJ registers for both engines, sets up VRAM mapping (`func_02094504` ×3), loads sprite config, programs BLDALPHA-related state, arms task system — classic module init body |
| 0x021c9ff8 | 0x2c | MATCHED | func_ov013_021c9ff8 | Ov013_InvokeIfReady | HIGH | C body read: checks `data_ov013_021cbc00.flag`; if non-zero calls `Task_InvokeLocked(handle)` — a guarded invoke helper |
| 0x021ca024 | 0x138 | SHIP | func_ov013_021ca024 | Ov013_BuildOamTask | HIGH | Allocates and fills a stack OAM task record (`func_0201d47c` / `func_0201e5b8`), adjusts tile/palette/attr fields, conditionally tweaks for a secondary sprite, then calls `Task_Invoke` and resets the pending flag |
| 0x021ca15c | 0x138 | SHIP | func_ov013_021ca15c | Ov013_BuildCursorOamTask | HIGH | Same OAM-task build pattern as 021ca024 but loads its config from `data_ov013_021cb750` (the cursor/tab descriptor) and fires two `Task_Invoke` calls for a dual-sprite cursor |
| 0x021ca294 | 0x24 | NAMED | Ov013_GetPageCount | Ov013_GetPageCount | HIGH | Already named; refreshes count then returns (n+2)/3 |
| 0x021ca2b8 | 0x174 | SHIP | func_ov013_021ca2b8 | Ov013_EnumeratePageSlots | HIGH | Iterates bits of the slot-presence mask (up to 4 slots), maps each to a display cell via `func_0202c0c0` and `func_020a69d0`, then calls `func_ov000_021ae394` with slot-type code — enumerating which sprites belong on the current page |
| 0x021ca42c | 0x1a8 | SHIP | func_ov013_021ca42c | Ov013_Activate | HIGH | Configures LCD control registers for both screens, calls the OAM-task setup helpers (021ca15c, 021ca2b8), enables OBJ/BG rendering layers, initialises palette and sound, handles system-work flags, installs the per-frame callback via `func_02005800(func_ov013_021c9d60)` |
| 0x021ca5d4 | 0x44 | NAMED | Ov013_SetBlendAlpha | Ov013_SetBlendAlpha | HIGH | Already named; writes EVA/EVB to BLDALPHA on both engines |
| 0x021ca618 | 0x74 | NAMED | Ov013_SlotToCell | Ov013_SlotToCell | HIGH | Already named; slot 0-7 → OAM cell index switch |
| 0x021ca68c | 0x80 | NAMED | Ov013_SetPage | Ov013_SetPage | HIGH | Already named; stores page into bitfield, triggers slide animation |
| 0x021ca70c | 0xc0 | SHIP | func_ov013_021ca70c | Ov013_SelectResourceSet | HIGH | Reads page-type field from `data_ov013_021cbc00[0x1a4]`, polls input state (`func_0201a4dc` / `func_0201a824`), then loads one of six data-table pointers (`data_ov013_021cbb20/.40/.60/.7c/.94/.b0`) — a resource-set selector keyed on page/button state |
| 0x021ca7cc | 0xe78 | SHIP | func_ov013_021ca7cc | Ov013_UpdateFrame | HIGH | Massive 18-branch per-frame dispatcher: handles alpha fade, slide-in/out, input polling, item select, dual OAM task dispatch, audio, page navigation — the module's main tick function |
| 0x021cb644 | 0x30 | NAMED | Ov013_InitGraphics | Ov013_InitGraphics | HIGH | Already named; resets graphics subsystem and powers both engines |
| 0x021cb674 | 0x8c | SHIP | func_ov013_021cb674 | Ov013_ReEnter | HIGH | Re-initialises page-context data (`data_021040ac[0x3c/0x40]`), checks `func_02018b48` return (== 4 → special VRAM remap), then calls `Ov013_InitGraphics` — a resume/re-enter path |
| 0x021cb700 | 0x50 | SHIP | func_ov013_021cb700 | Ov013_StepCallback | HIGH | Reads `data_021040ac[0xb6c]` as an index into `data_ov013_021cb9b0` function-pointer table, calls via `blx`, advances index on success — a sequenced callback stepper |

## Call graph (top hub functions)

| addr | proposed_name | call count |
|------|--------------|-----------|
| — | GetSystemWork | 13 |
| — | func_ov000_021aed18 | 12 |
| — | func_ov000_021af420 | 8 |
| — | func_0202c0c0 | 8 |
| — | func_ov000_021ab740 | 6 |
| — | func_ov000_021ab4bc | 6 |
| — | func_ov000_021ae4ac | 5 |
| — | func_ov000_021af3f0 | 4 |
| — | func_020a69d0 | 4 |
| 0x021ca2b8 | Ov013_EnumeratePageSlots | 3 |

## Stats

Total: 16 | Named: 5 | Matched: 1 | Ship: 10 | Proposals: HIGH/MED/LOW = 15/1/0
