/* CAMPAIGN-PREP candidate for func_021b28a8 (ov015, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dispatch switch + boolean ==/!= -> moveq/movne
 *   risk:       struct field offsets at 0x8/0xc assumed; switch may lower to cmp-chain (it should — exactly matches)
 *   confidence: high
 */
/* func_ov010_021b28a8: nested switch returning 0/1 booleans.
 *
 *   switch (p->x8) {
 *     case 0: return p->xc == 1;   // cmp #1; moveq/movne
 *     case 1: return p->xc != 0;   // cmp #0; moveq/movne
 *     default: return 0;
 *   }
 */

struct S28a8 {
    char _pad[0x8];
    int  x8;
    int  xc;
};

int func_ov010_021b28a8(struct S28a8 *p) {
    switch (p->x8) {
    case 0:
        return p->xc == 1;
    case 1:
        return p->xc != 0;
    default:
        return 0;
    }
}
