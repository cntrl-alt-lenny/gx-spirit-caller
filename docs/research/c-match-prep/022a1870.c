/* CAMPAIGN-PREP candidate for func_022a1870 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     accessor: cmp;cmpne chained equality guard, return field
 *   risk:       cmp r1,#0xc / cmpne r1,#0x20 chain needs (==0xc||==0x20) form; returns 0 vs ->f_0 must keep ldr placement
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov002_022a1870 (ov002, class A).
 *   recipe:     accessor; chained-equality guard (cmp;cmpne) -> ||; field ret
 *   risk:       (f_4==0xc || f_4==0x20) must lower to cmp;cmpne not two
 *               branches; the load of f_0 stays after the guard
 *   confidence: high
 */
/* func_ov002_022a1870: if p->f_4 is 0xc or 0x20 return 0, else return
 * p->f_0. */

typedef struct {
    int f_0;              /* +0x00 */
    int f_4;              /* +0x04 */
} Ctx_022a1870;

int func_ov002_022a1870(Ctx_022a1870 *p) {
    int t = p->f_4;
    if (t == 0xc || t == 0x20)
        return 0;
    return p->f_0;
}
