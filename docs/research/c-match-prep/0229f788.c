/* CAMPAIGN-PREP candidate for func_0229f788 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     setter, guard-chain calls, min-clamp if-assign, reload global
 *   risk:       data_022d0f2c reloaded twice (two ldr _LIT0) must reproduce; movlt clamp must be if-assign not max(); call/guard order
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229f788 (ov002, class A).
 *   recipe:     field set, predicate guards, min-clamp via if-assign, global
 *               reloaded per access (separate refs), two tail calls
 *   risk:       data_022d0f2c is loaded twice (the asm reloads _LIT0 around
 *               the clamp) -> keep two separate refs; the f_d4 clamp must be
 *               `if (v<0x10) v=0x10;` if-assign, not a max() ternary
 *   confidence: med
 */
/* func_ov002_0229f788: p->f_44 = 1. If func_022a1870(p): clamp
 * g.f_d4 up to >= 0x10. If g.f_c8: func_0229a414(0). Always:
 * func_022ae9c0(&data_022d1a9c, 0). */

extern int  func_ov002_022a1870(void *p);
extern void func_ov002_0229a414(int);
extern void func_ov002_022ae9c0(void *p, int v);
extern char data_ov002_022d1a9c[];

typedef struct {
    char _pad_00[0xc8];
    int  f_c8;            /* +0xc8 */
    char _pad_cc[0x8];
    int  f_d4;            /* +0xd4 */
} Glob_0229f788;

extern Glob_0229f788 data_ov002_022d0f2c;

void func_ov002_0229f788(void *p) {
    *(int *)((char *)p + 0x44) = 1;
    if (func_ov002_022a1870(p) != 0) {
        int v = data_ov002_022d0f2c.f_d4;
        if (v < 0x10)
            v = 0x10;
        data_ov002_022d0f2c.f_d4 = v;
    }
    if (data_ov002_022d0f2c.f_c8 != 0)
        func_ov002_0229a414(0);
    func_ov002_022ae9c0(data_ov002_022d1a9c, 0);
}
