/* CAMPAIGN-PREP candidate for func_02098388 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order init with reload-to-copy (A)
 *   risk:       must keep `str;ldr;str` copy pairs (f4=f0, f18=f1c); if mwcc reuses the zero reg the reloads vanish
 *   confidence: high
 */
/* func_02098388: plain field initializer. Note the original stores 0 to a
 * field then RELOADS it to copy into a sibling (f_4 = f_0, f_18 = f_1c) --
 * reproduced by reading the just-written member rather than using a literal 0.
 * Store order is load-bearing: f0, f4(=f0), f1c, f18(=f1c), f8, f10=0xe, fc. */

typedef struct {
    int f_0;     /* +0x00 */
    int f_4;     /* +0x04 */
    int f_8;     /* +0x08 */
    int f_c;     /* +0x0c */
    int f_10;    /* +0x10 */
    char _pad14[0x8];
    int f_18;    /* +0x18 */
    int f_1c;    /* +0x1c */
} St_02098388;

void func_02098388(St_02098388 *p) {
    p->f_0  = 0;
    p->f_4  = p->f_0;
    p->f_1c = 0;
    p->f_18 = p->f_1c;
    p->f_8  = 0;
    p->f_10 = 0xe;
    p->f_c  = 0;
}
