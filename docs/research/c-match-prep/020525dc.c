/* CAMPAIGN-PREP candidate for func_020525dc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     double-deref global (RELOAD) + null-guard + blx callback dispatch
 *   risk:       global is ptr-to-struct, +0x60c is fn-ptr; callback(arg1, func_02046870()); r0(arg0) ignored at entry
 *   confidence: med
 */
/* func_020525dc -> src/main/func_020525dc.c (mwcc 2.0/sp1p5 default; push{r4,lr}/pop pc) */
typedef void (*Cb)(int, int);
typedef struct {
    char _pad[0x60c];
    Cb   cb;   /* +0x60c */
} Ctx;
extern Ctx *data_0219e3ec;   /* ldr r1,[r2]; ldr r1,[r1,#0x60c] => pointer var */
extern int  func_02046870(void);

void func_020525dc(int unused, int arg) {
    (void)unused;
    if (data_0219e3ec->cb == 0)
        return;
    {
        int v = func_02046870();
        data_0219e3ec->cb(arg, v);
    }
}
