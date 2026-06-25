/* CAMPAIGN-PREP candidate for func_02068d24 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Call + compare-to-(-1) early-return + tail call (return f(&p->f_4c))
 *   risk:       &p->f_4c recomputed twice (not cached) — should match since it is a fresh add each call; field +0x4c offset guessed; return type assumed int.
 *   confidence: high
 */
/* func_02068d24: r = func_0206b778(&p->f_4c); if (r == -1) return r;
 * else tail-call func_0206b670(&p->f_4c). Mirrors func_02006898
 * guarded-tail-call shape. */

typedef struct {
    char _pad[0x4c];
    int  f_4c;                 /* +0x4c (passed by address) */
} obj_02068d24_t;

extern int func_0206b778(int *slot);
extern int func_0206b670(int *slot);

int func_02068d24(obj_02068d24_t *p) {
    int r = func_0206b778(&p->f_4c);
    if (r == -1) return r;
    return func_0206b670(&p->f_4c);
}
