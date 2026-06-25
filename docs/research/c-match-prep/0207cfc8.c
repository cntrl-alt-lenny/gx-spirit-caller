/* CAMPAIGN-PREP candidate for func_0207cfc8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     predicated conditional accessor (if-convert), reg-offset load
 *   risk:       mwcc may branch instead of predicating ldreq/ldrneh/ldrne; hA offset/type guessed; reg-offset add may reorder
 *   confidence: med
 */
/* func_0207cfc8 (main, class A, 0x14) — tiny conditional load accessor.
 *   cmp r1,#0; ldreq r0,[r0,#4]; ldrneh r0,[r0,#0xa]; ldrne r0,[r1,r0]; bx lr
 * Leaf, no stack frame -> default .c (mwcc 2.0/sp1p5).
 */

typedef struct {
    char            _pad_00[0x4];
    int             field_04;       /* +0x04 */
    char            _pad_06[0x4];
    unsigned short  field_0a;       /* +0x0a */
} obj_0207cfc8_t;

int func_0207cfc8(obj_0207cfc8_t *a0, void *a1) {
    if (a1 == 0) {
        return a0->field_04;
    }
    return *(int *)((char *)a1 + a0->field_0a);
}
