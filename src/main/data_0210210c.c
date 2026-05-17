/* Brief 121 cluster D worked example — D-1 (dispatch / data-pointer table).
 *
 * Pool: 1 of 98 native cluster D candidates per brief 113.
 * Address 0x0210210c, size 0x14 = 20 bytes = 5 pointers (naturally
 * 4-aligned; no W6 cascade — Pattern 1 from brief 119).
 *
 * Bytes (from extract/eur/arm9/arm9.bin at 0x10210c):
 *   80 21 10 02   → 0x02102180 (data ptr)
 *   68 21 10 02   → 0x02102168 (data ptr)
 *   20 21 10 02   → 0x02102120 (data ptr)
 *   50 21 10 02   → 0x02102150 (data ptr)
 *   38 21 10 02   → 0x02102138 (data ptr)
 *
 * Sub-cluster D-1 (dispatch tables): mwcc emits a `.data` section
 * containing 4-byte words with reloc records pointing at the target
 * symbols. Linker resolves the relocations; per-region values vary
 * automatically (here all targets are in main .data so identical
 * across all 3 regions).
 *
 * Note: targets are themselves unmatched placeholder data symbols.
 * Declaring `extern char data_xxx;` lets the linker resolve them by
 * their existing addresses in symbols.txt — no need to wait for the
 * targets to be cluster-D/B/C-recovered first.
 */

extern char data_02102120;
extern char data_02102138;
extern char data_02102150;
extern char data_02102168;
extern char data_02102180;

void *data_0210210c[5] = {
    &data_02102180,
    &data_02102168,
    &data_02102120,
    &data_02102150,
    &data_02102138,
};
