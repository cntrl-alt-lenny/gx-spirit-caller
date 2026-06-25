/* CAMPAIGN-PREP candidate for func_02062d88 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     out-param probe, middle helper on p+0x50 with const args, bool tail
 *   risk:       `(char*)p+0x50` base-add; sub#4 frame (3 saved regs odd); arg order a then 0x20
 *   confidence: med
 */
/* func_02062d88: probe func_02062eec(p, 1, 0x27, &out); short-circuit;
 * else func_020613d8((char*)p+0x50, a, 0x20); normalize func_02062e6c.
 * args r0=p (->r5), r1=a (->r4). */

extern int  func_02062eec(void *p, int a, int b, int *out);
extern void func_020613d8(void *sub, int a, int b);
extern int  func_02062e6c(void *p);

int func_02062d88(void *p, int a) {
    int out;
    if (!func_02062eec(p, 1, 0x27, &out))
        return 0;
    if (out)
        return 1;
    func_020613d8((char *)p + 0x50, a, 0x20);
    return func_02062e6c(p) ? 1 : 0;
}
