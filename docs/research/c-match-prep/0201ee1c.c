/* CAMPAIGN-PREP candidate for func_0201ee1c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch (cmp-chain) + struct copy + TAIL CALL
 *   risk:       3 contiguous cases may lower to a jump table not the cmp #0/#1/#2 chain; field offsets guessed
 *   confidence: med
 */
/* func_0201ee1c: 3-way dispatcher on arg2 then a common epilogue. p=arg0
 * (struct: f_0,f_4,f_c at those offsets), a1=arg1, sel=arg2, out=arg3, a4 is
 * the 5th (first stacked) arg loaded from [sp,#0x18]. Pre-dispatch:
 * func_02092904(p->f_c, a4). Each case forwards (p->f_c, a1, a4) to handlers;
 * cases 1/2 branch on p->f_4. Epilogue copies p->f_0/f_4 into out then
 * tail-calls func_0207f850(out, sel, a1). */

typedef struct {
    int f_0;       /* +0x00 */
    int f_4;       /* +0x04 */
    char _pad8[4];
    int f_c;       /* +0x0c */
} obj_ee1c;

typedef struct {
    int g_0;       /* +0x00 */
    int g_4;       /* +0x04 */
} out_ee1c;

extern int func_02092904(int a0, int a1);
extern void func_0208f1c4(void);
extern int func_0208f210(int a0, int a1, int a2);
extern void func_0208f284(void);
extern void func_0208f38c(void);
extern int func_0208f3e4(int a0, int a1, int a2);
extern void func_0208f458(void);
extern int func_0208feb4(int a0, int a1, int a2);
extern int func_0208ff1c(int a0, int a1, int a2);
extern void func_02090048(void);
extern int func_020900a0(int a0, int a1, int a2);
extern void func_02090114(void);
extern int func_0207f850(out_ee1c *out, int a1, int a2);

int func_0201ee1c(obj_ee1c *p, int a1, int sel, out_ee1c *out, int a4) {
    func_02092904(p->f_c, a4);
    switch (sel) {
    case 0:
        func_02090114();
        func_020900a0(p->f_c, a1, a4);
        func_02090048();
        break;
    case 1:
        if (p->f_4) {
            func_0208f458();
            func_0208f3e4(p->f_c, a1, a4);
            func_0208f38c();
        } else {
            func_0208ff1c(p->f_c, a1, a4);
        }
        break;
    case 2:
        if (p->f_4) {
            func_0208f284();
            func_0208f210(p->f_c, a1, a4);
            func_0208f1c4();
        } else {
            func_0208feb4(p->f_c, a1, a4);
        }
        break;
    }
    out->g_0 = p->f_0;
    out->g_4 = p->f_4;
    return func_0207f850(out, sel, a1);
}
