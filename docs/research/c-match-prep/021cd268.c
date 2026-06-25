/* CAMPAIGN-PREP candidate for func_021cd268 (ov011, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear-search loop; dual-base bind (32d8 count / 334a body); field-shift
 *   risk:       Loop reg-alloc/index form likely flips: ip-relative -114/-113 walk and reuse of #0x72 as both stride and literal may not reproduce; bxeq-vs-branch tail uncertain.
 *   confidence: low
 */
/* func_ov011_021cd268: linear search over a per-mode 0x72-stride table.
 * Row = (data_021d4000[0x2a4] << 23) >> 28  (4-bit field, bits 12:9).
 * data_021d32d8 holds the per-row count byte; data_021d334a is the same
 * table base + 114 so the loop body reads through it with -114/-113
 * offsets (two distinct pool words, matching the asm's _LIT1/_LIT2).
 * Returns the 0-based index of the first entry equal to (arg-0x65), or -1.
 */
extern unsigned char data_ov011_021d4000[];
extern unsigned char data_ov011_021d32d8[];
extern unsigned char data_ov011_021d334a[];

int func_ov011_021cd268(int arg0) {
    int key = arg0 - 0x65;
    int row = ((int)(*(unsigned int *)(data_ov011_021d4000 + 0x2a4) << 23)) >> 28;
    int base = row * 0x72;
    unsigned char *p = data_ov011_021d334a + base;
    int count = p[-114];
    int i;
    if (count <= 0)
        return -1;
    for (i = 0; i < count; i++) {
        if (key == p[-113 + i])
            return i;
    }
    return -1;
}
