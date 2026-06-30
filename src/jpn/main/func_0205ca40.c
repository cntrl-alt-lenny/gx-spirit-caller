/* CAMPAIGN-PREP candidate for func_0205ca40 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sequential teardown calls + null-clear stores; guarded free
 *   risk:       p->+8 reloaded before each of the first two calls (no bind); if mwcc binds it the ldr-per-call flips
 *   confidence: high
 */
/* func_0205ca40: teardown via arg1 (=p). arg0 unused.
 *   func_02054de0(p->+8, 2); func_02054dfc(p->+8)
 *   free(p->+0x18); p->+0x18=0; free(p->+0x28); p->+0x28=0
 *   if (p->+0x38) { func_020540d4(p->+0x38); p->+0x38=0; }
 *   free(p)
 */

extern void func_02045364(void *p);
extern void func_020540d4(void *p);
extern void func_02054de0(void *p, int v);
extern void func_02054dfc(void *p);

typedef struct {
    char  _pad_00[0x8];
    void *f8;     /* +0x08 */
    char  _pad_0c[0x18 - 0xc];
    void *f18;    /* +0x18 */
    char  _pad_1c[0x28 - 0x1c];
    void *f28;    /* +0x28 */
    char  _pad_2c[0x38 - 0x2c];
    void *f38;    /* +0x38 */
} Teardown;

void func_0205ca40(void *unused, Teardown *p) {
    func_02054de0(p->f8, 2);
    func_02054dfc(p->f8);
    func_02045364(p->f18); p->f18 = 0;
    func_02045364(p->f28); p->f28 = 0;
    if (p->f38 != 0) {
        func_020540d4(p->f38);
        p->f38 = 0;
    }
    func_02045364(p);
}
