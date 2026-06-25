/* CAMPAIGN-PREP candidate for func_0229e14c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop calls predicate, early-true, tail bool
 *   risk:       stride-0x14 walk via add r5 vs index; final [r6+0xb4]!=0 bool may emit subs/clz instead of movne/moveq
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229e14c (ov002, class A).
 *   recipe:     counted loop over stride-0x14 entries calling a predicate;
 *               early return-true; tail returns (field != 0) as bool
 *   risk:       base pointer is walked (p += 0x14) not indexed; the final
 *               (->f_b4 != 0) bool may lower to subs/clz vs movne/moveq
 *   confidence: med
 */
/* func_ov002_0229e14c: scan 8 sub-objects (stride 0x14) starting at p; if
 * func_ov002_0229d2c8 returns non-zero for any, return 1; else return
 * (p->f_b4 != 0). */

extern int func_ov002_0229d2c8(void *entry);

typedef struct {
    char _pad_00[0xb4];
    int  f_b4;            /* +0xb4 */
} Ctx_0229e14c;

int func_ov002_0229e14c(Ctx_0229e14c *p) {
    char *e = (char *)p;
    int i;
    for (i = 0; i < 8; i++) {
        if (func_ov002_0229d2c8(e) != 0)
            return 1;
        e += 0x14;
    }
    return p->f_b4 != 0;
}
