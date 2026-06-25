/* CAMPAIGN-PREP candidate for func_022a6cc4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain accessor: OR-of-nonzero + ==/< check, tail call
 *   risk:       4 early movne#1 returns + the (f_620==4 && f_624<0x100) gate; tail call func_022a6d1c on fallthrough; bool join order
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a6cc4 (ov002, class A).
 *   recipe:     guard-chain returning bool; series of (field!=0)->return 1;
 *               an (==4 && <0x100) gate; tail-call on fallthrough
 *   risk:       each (field != 0) must stay cmp;movne#1;return; the
 *               f_620==4 && f_624<0x100 gate ordering and the tail call to
 *               func_022a6d1c are the diff risks
 *   confidence: med
 */
/* func_ov002_022a6cc4: return 1 if any of f_578,f_5c0,f_5e8 nonzero; or if
 * f_620==4 and f_624<0x100; otherwise tail-call func_022a6d1c(p). */

extern int func_ov002_022a6d1c(void *p);

typedef struct {
    char _pad_000[0x578];
    int  f_578;           /* +0x578 */
    char _pad_57c[0x44];
    int  f_5c0;           /* +0x5c0 */
    char _pad_5c4[0x24];
    int  f_5e8;           /* +0x5e8 */
    char _pad_5ec[0x34];
    int  f_620;           /* +0x620 */
    int  f_624;           /* +0x624 */
} Ctx_022a6cc4;

int func_ov002_022a6cc4(Ctx_022a6cc4 *p) {
    if (p->f_578 != 0)
        return 1;
    if (p->f_5c0 != 0)
        return 1;
    if (p->f_5e8 != 0)
        return 1;
    if (p->f_620 == 4) {
        if (p->f_624 < 0x100)
            return 1;
    }
    return func_ov002_022a6d1c(p);
}
