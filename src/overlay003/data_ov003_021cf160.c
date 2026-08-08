/* data_ov003_021cf160 (16 bytes, 4-aligned): per-state callback dispatch
 * table (3 entries: 1 unmatched + 2 already-matched handlers + a NULL
 * sentinel) -- ov006-family-A dispatch step pattern (ov003_core.h).
 * Sole reader: func_ov003_021ca1fc (src/overlay003/func_ov003_021ca1fc.c,
 * ALREADY SHIPPED/matched), which already declares and uses this exact
 * symbol: `extern int (*data_ov003_021cf160[])(void); ... int (*cb)(void)
 * = data_ov003_021cf160[data_ov003_021cf6c0[0]]; if (cb != 0) { if (cb()
 * != 0) { data_ov003_021cf6c0[0]++; data_ov003_021cf6c0[1] = 0; } ... }`
 * (relocs.txt ov003:63 from:0x021ca250 kind:load to:0x021cf160).
 * Each element is itself a proven relocation (relocs.txt ov003:606-608):
 *   from:0x021cf160 to:0x021c9d60 -> func_ov003_021c9d60 (not yet split
 *     out of the ov003 gap region into its own delinked file, but a
 *     named function symbol per symbols.txt: kind:function(arm,size=0x368))
 *   from:0x021cf164 to:0x021ca0c8 -> func_ov003_021ca0c8 (matched C,
 *     "tear down the scene", ov003_core.h wave-1 pick)
 *   from:0x021cf168 to:0x021ca10c -> func_ov003_021ca10c (matched C,
 *     "full scene teardown", ov003_core.h wave-2 pick)
 * Element [3] (offset +0xc) has no reloc -- genuine NULL terminator,
 * matches the `if (cb != 0)` guard in the consumer.
 * Not const -- .data, delinks.txt ov003 line 5: .data start:0x021cf160
 * end:0x021cf6c0 (this symbol opens the section).
 */
extern int func_ov003_021c9d60(void);   /* unmatched gap function, named per symbols.txt */
extern int func_ov003_021ca0c8(void);
extern int func_ov003_021ca10c(void);

int (*data_ov003_021cf160[])(void) = {
    func_ov003_021c9d60,
    func_ov003_021ca0c8,
    func_ov003_021ca10c,
    0,
};
