## overlay013

| func_addr | proposed_name | confidence | rationale |
|-----------|--------------|-----------|-----------|
| 0x021c9d60 | Ov013_SetupPairedInit | MED | Tiny 3-BL shim calling two cross-overlay funcs then Ov013_BuildOamTask; matches setup-before-dispatch pattern seen in other overlays |
| 0x021c9d74 | Ov013_Init | HIGH | Fills BSS, configures both LCD engines (VRAM map, BG/OBJ registers, BLDALPHA), loads sprite descriptors — canonical module init body |
| 0x021c9ff8 | Ov013_InvokeIfReady | HIGH | C body: checks flag in main work-block; if non-zero calls Task_InvokeLocked(handle) — guarded invoke helper |
| 0x021ca024 | Ov013_BuildOamTask | HIGH | Builds stack OAM task record (func_0201d47c/func_0201e5b8), adjusts tile/palette/attribute fields, calls Task_Invoke, clears pending flag |
| 0x021ca15c | Ov013_BuildCursorOamTask | HIGH | Same OAM-task pattern as 021ca024 but uses cursor/tab descriptor from data_ov013_021cb750; fires two Task_Invoke for dual-sprite cursor |
| 0x021ca2b8 | Ov013_EnumeratePageSlots | HIGH | Iterates slot-presence bitmask (up to 4), maps each slot to a display cell via func_0202c0c0 + func_020a69d0, calls func_ov000_021ae394 with slot type |
| 0x021ca42c | Ov013_Activate | HIGH | Configures LCD registers for both screens, calls slot/cursor OAM helpers, enables rendering layers, initialises palette/audio, installs per-frame callback |
| 0x021ca70c | Ov013_SelectResourceSet | HIGH | Reads page-type bitfield, polls button/touch input, loads one of six data-table pointers (data_ov013_021cbb20/40/60/7c/94/b0) as active resource set |
| 0x021ca7cc | Ov013_UpdateFrame | HIGH | 18-branch per-frame dispatcher: alpha-fade, slide-in/out, input handling, item selection, OAM task dispatch, audio, page navigation |
| 0x021cb674 | Ov013_ReEnter | HIGH | Resets page-context fields, optionally remaps VRAM (func_02018e88 when func_02018b48==4), then calls Ov013_InitGraphics — resume/re-entry path |
| 0x021cb700 | Ov013_StepCallback | HIGH | Reads data_021040ac[0xb6c] as index into data_ov013_021cb9b0 function-pointer table; calls entry via blx, advances index on success |
