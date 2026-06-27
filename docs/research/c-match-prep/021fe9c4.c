/* CAMPAIGN-PREP candidate for func_021fe9c4 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x30 stack struct via fill helper; indexed stk.a[idx]/stk.b[idx]; guard chain in asm order; sub sp,#0x30
 *   risk:       struct-guessed: _LIT0 (the `cmp r4,_LIT0` constant) is an unknown word the asm compares obj against — modelled as a placeholder; must be replaced with the real extern/constant. Also asm body is TRUNCATED at size 324 (tail .L_11ac fallthrough unseen).
 *   confidence: low
 */
/* func_ov002_021fe9c4 (ov002, class C) — fill a 0x30 stack struct via 021fdd9c, then a
 * guard chain keyed on 02031794/0202b878/0202b8c0/0202e234 and indexed stack words
 * [r5*4] and [r5*4+8]. self index r5, obj r4. */
typedef unsigned int u32;

extern int  func_0202b878(int obj);
extern int  func_0202b8c0(int obj);
extern int  func_0202e234(int obj);
extern int  func_02031794(int obj);
extern void func_ov002_021fdd9c(void *stk);

struct F021fe9c4_Stk {
    int a[2];     /* +0x00,+0x04  (indexed [idx]) */
    int b[2];     /* +0x08,+0x0c  (indexed [idx]) */
    int pad10[3]; /* +0x10,+0x14,+0x18 */
    int f1c;      /* +0x1c */
    int f20;      /* +0x20 */
    int f24;      /* +0x24 */
    int f28;      /* +0x28 */
    int pad2c;    /* +0x2c */
};

int func_ov002_021fe9c4(int idx, int obj) {
    struct F021fe9c4_Stk stk;
    func_ov002_021fdd9c(&stk);
    if (func_02031794(obj) != 0) return 0;
    if (func_0202b878(obj) == 0x17) {
        int v = stk.a[idx];
        if (v == 2) {
            if (obj != (int)func_0202b878) return 1;   /* _LIT0 placeholder; see risk */
            return 1;
        }
        if (v == 1) return 1;
        if (stk.f1c != 0 && func_0202b8c0(obj) == 4) return 1;
        return 0;
    }
    if (stk.b[idx] != 0) return 1;
    if (stk.f20 != 0 && func_0202b8c0(obj) == 4) return 1;
    if (stk.f28 != 0) {
        if (func_0202b8c0(obj) == 3) return 1;
        if (func_0202e234(obj) != 0) return 1;
    }
    if (stk.f24 != 0 && func_0202b8c0(obj) == 2) return 1;
    return 0;   /* tail truncated in source asm; verify final fallthrough */
}
