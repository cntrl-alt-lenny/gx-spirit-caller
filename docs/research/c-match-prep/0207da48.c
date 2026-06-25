/* CAMPAIGN-PREP candidate for func_0207da48 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-return + RELOAD-each-use field, pointer-diff return
 *   risk:       the three reloads of cur may be CSE'd into one reg by mwcc (bind-vs-reload); +0x24 sub-struct offsets guessed; movne-return shape
 *   confidence: med
 */
/* func_0207da48 (main, class A, 0x34) — leaf accessor with early-out.
 *   add r3,r0,#0x24; ldr r2,[r0,#0x1c]; ldr r1,[r3,#4]; subs r1,r2,r1;
 *   movne r0,#0; bxne lr; ldr r1,[r3]; str r1,[r0,#0x1c];
 *   ldr r1,[r0,#0x1c]; str r1,[r3,#4]; ldr r1,[r0,#0x1c]; sub r0,r1,r0; bx lr
 * If cur != mgr.f4 return 0; else cur = mgr.f0; mgr.f4 = cur; return cur - p.
 * NOTE the asm RELOADS p->cur three times -> keep three separate p->cur refs
 * (do NOT cache cur in a local) to reproduce the ldr/str/ldr/ldr pattern.
 * Leaf, no frame -> default .c (mwcc 2.0/sp1p5).
 */

typedef struct {
    void           *f0;             /* +0x24 (mgr+0x0)  */
    void           *f4;             /* +0x28 (mgr+0x4)  */
} mgr_0207da48_t;

typedef struct {
    char            _pad_00[0x1c];
    void           *cur;            /* +0x1c */
    mgr_0207da48_t  mgr;            /* +0x24 */
} obj_0207da48_t;

int func_0207da48(obj_0207da48_t *p) {
    if (p->cur != p->mgr.f4) {
        return 0;
    }
    p->cur = p->mgr.f0;
    p->mgr.f4 = p->cur;
    return (int)((char *)p->cur - (char *)p);
}
