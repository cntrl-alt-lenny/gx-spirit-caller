/* CAMPAIGN-PREP candidate for func_02000c4c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload idx-load each use; sentinel/high-byte as if-return; 16B struct stride
 *   risk:       orig RELOADS data_020c3bc0[idx] 3x (ldr at entry, tst-ne, .L_4c); if mwcc binds v to one reg the 3 ldr collapse — reshape-able (keep separate reads, don't bind). Struct offsets f_4/f_8/f_0 struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02000c4c (main, class C) — front-load.
 *   recipe: table-lookup accessor; RELOAD idx-load 3x; cond early returns as if/return
 * data_020c3bc0[idx] = int; sentinel -1 -> 0; high-byte set -> return raw;
 * else index 16-byte struct data_020c4204[v], maybe call func_020071a4, return ->f_0.
 */
extern volatile int data_020c3bc0[];

typedef struct {
    int f_0;
    int f_4;
    int f_8;
    int f_c;
} ent_020c4204_t;
extern ent_020c4204_t data_020c4204[];

extern void func_020071a4(int a, int b, int c);

int func_02000c4c(int idx) {
    int v = data_020c3bc0[idx];
    if (v == -1)
        return 0;
    if (v & 0xff000000) {
        int v2 = data_020c3bc0[idx];
        return v2;
    }
    {
        ent_020c4204_t *e = &data_020c4204[v];
        if (e->f_4 >= 0)
            func_020071a4(e->f_4, e->f_8, 0);
    }
    {
        int v3 = data_020c3bc0[idx];
        return data_020c4204[v3].f_0;
    }
}
