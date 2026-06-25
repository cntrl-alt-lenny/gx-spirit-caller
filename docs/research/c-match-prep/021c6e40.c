/* CAMPAIGN-PREP candidate for func_021c6e40 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cmp+cmpeq compound guard; compute sel(r5) before call; reuse r across 0216b0
 *   risk:       sel held in callee-saved r5 across func_02021660: if mwcc computes sel AFTER the call (defers it) the movne/moveq lands post-bl and registers rotate. permuter-class (call-crossing reg coin-flip, flagged in note).
 *   confidence: low
 */
/* func_ov006_021c6e40: if (id,flag) already current return 1; else store id,
   reset three sub-objects, and if obj[0] live reprogram two layers (3,1)/(3,2)
   and pick a palette from data_021040ac[0x34]; return 1. */
extern int  data_021040ac;                  /* +0x34 */
extern char data_ov006_021ce19c[];
extern char data_ov006_021ce1b0[];
extern int  func_02021660(int a, int b, int c);
extern int  func_020216b0(int a, int b, int c);
extern void func_020a978c(int a, int b, int c);
extern void func_ov006_021c7110(void *p);
extern void func_ov006_021c71e0(void *p, int b);
extern void func_ov006_021c72c8(void *p);
int func_ov006_021c6e40(char *base, int id, int flag) {
    if (*(int *)(base + 0x38) == id && flag == 0)
        return 1;
    *(int *)(base + 0x38) = id;
    func_ov006_021c7110(base);
    func_ov006_021c72c8(base);
    func_ov006_021c71e0(base, 0);
    if (*(int *)base == 0)
        return 1;
    {
        int sel = (*(int *)(base + 0x38) != 0) ? 1 : 0;
        int r = func_02021660(*(int *)base, 3, 1);
        func_020216b0(r, 0, sel);
    }
    if (*(int *)(base + 0x38) == 0)
        return 1;
    {
        int r = func_02021660(*(int *)base, 3, 2);
        func_020216b0(r, 2, 0);
        func_020216b0(r, 0, 0x201);
    }
    {
        int p1;
        if (*(int *)((char *)&data_021040ac + 0x34) == 0) p1 = (int)data_ov006_021ce19c;
        else p1 = (int)data_ov006_021ce1b0;
        func_020a978c((int)(base + 0x58), p1, *(int *)(base + 0x38));
    }
    return 1;
}
