/* CAMPAIGN-PREP candidate for func_02067850 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two if-guards (bxlt/bxgt) + indexed word-array store
 *   risk:       table element type assumed int (lsl#2); if signed/index semantics differ, codegen unaffected; very low
 *   confidence: high
 */
/* func_02067850 — bounds-checked indexed word-table store.
 * cmp r0,#0x32; bxlt; cmp r0,#0xfe; bxgt; str r1,[table, r0<<2].
 * Valid index range is [0x32, 0xfe]. The two bx-on-condition early
 * returns are if-guards; the store uses a word array (lsl#2).
 */
extern int data_02101928[];

void func_02067850(int idx, int v) {
    if (idx < 0x32) return;
    if (idx > 0xfe) return;
    data_02101928[idx] = v;
}
