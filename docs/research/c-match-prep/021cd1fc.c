/* CAMPAIGN-PREP candidate for func_021cd1fc (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Linear search loop over byte table; if-assign cond-move; nibble bitfield
 *   risk:       WALL per ov011_core.h: table base-selection (32d8/334a stride 114) + count reload + neg-offset addressing; mwcc reg-alloc/base-select won't match. Field offsets/strides inferred
 *   confidence: low
 */
/* func_ov011_021cd1fc: linear search for r0 in a byte sub-table selected by a
 * 4-bit field of data_ov011_021d4000[+0x2a4]. Returns the matching index, or
 * -1. DOCUMENTED WALL (ov011_core.h: "table-walk base-selection + count reload
 * (32d8/334a stride 114): ... 021cd1fc") - the 0x72-stride base math, the count
 * reload from data_ov011_021d32d8, and the negative-offset walk
 * (data_ov011_021d334a) drive a base-selection / reg-numbering mwcc can't be
 * steered to. Strides/offsets inferred from the asm.
 *
 *   sel = (data_4000[+0x2a4] << 23) >> 28          ; 4-bit field, bits 8:5
 *   off = sel * 0x72
 *   n   = data_32d8[off]                            ; signed byte count
 *   if (n <= 0) return -1
 *   limit = data_334a[off - 0x72]   (== [off] of 334a, since 334a=32d8+0x72)
 *   p = data_334a + off
 *   for (i = 0; ; ) {
 *     if (r0 == p[i - 0x28]) return i
 *     if (++i >= limit) break
 *   }
 *   return -1
 */
extern char data_ov011_021d4000[];
extern signed char data_ov011_021d32d8[];
extern signed char data_ov011_021d334a[];

int func_ov011_021cd1fc(int key) {
    int sel = (int)((unsigned int)(*(int *)(data_ov011_021d4000 + 0x2a4) << 23) >> 28);
    int off = sel * 0x72;
    int n = data_ov011_021d32d8[off];
    int i;
    signed char *p;
    if (n <= 0)
        return -1;
    p = data_ov011_021d334a + off;
    {
        int limit = p[-114];
        for (i = 0; ; i++) {
            if (key == p[i - 40])
                return i;
            if (i + 1 >= limit)
                break;
        }
    }
    return -1;
}
