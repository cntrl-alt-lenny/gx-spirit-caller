/* CAMPAIGN-PREP candidate for func_020161ac (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 guard + discrete cmp/beq if-chain (not jump-table); unsigned `<` early-returns; |= flag, o[8] store-then-call order
 *   risk:       permuter-class: bit0 guard `and #1` wall. Otherwise tight: handler 3 has _LIT2=0x180300 (truncated literal in batch but recovered from .s). Reshape-able: unsigned cmp polarity on +1/+2 bounds
 *   confidence: low
 */
/* func_020161ac (main, class D, MED) — GetSystemWork dispatcher.
 * w[0x8d8]:bit0 guard; w[0x920] in {1,2,3} -> three handlers (if/else-if, NOT a
 * jump table: discrete cmp/beq). o[8] message + flag-word RMW. Literals:
 * 0x180100,0x180200,0x180300 (o[8]). Modeled on src/main/func_020161ac.s. */
extern char *GetSystemWork(void);
extern int  func_020139c4(void);
extern int  func_02019034(void);
extern int  func_020190ec(void);
extern int  func_020190fc(void);
extern int  func_02019664(void);
extern void func_0201aabc(int);
extern void func_0201aaf4(int);
extern void func_0201b7b4(void);
extern int  func_0201b7e0(void *);

void func_020161ac(void *o) {
    char *w = GetSystemWork();
    if (!((*(unsigned int *)(w + 0x8d8) << 0x1f) >> 0x1f)) return;
    if (*(int *)(w + 0x920) == 1) {
        if (func_0201b7e0(o) != 4) return;
        if (func_020190fc() == 0) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 2)) return;
        *(int *)((char *)o + 8) = 0x00180100;
        func_0201b7b4();
        *(int *)(w + 0x8f8) |= 0x800;
        return;
    }
    if (*(int *)(w + 0x920) == 2) {
        if (func_020190ec() == 0) return;
        if (func_020139c4() != 5) return;
        if ((unsigned int)func_02019034() < (unsigned int)(*(int *)(w + 0x8dc) + 1)) return;
        if (func_0201b7e0(o) != 5) return;
        *(int *)((char *)o + 8) = 0x00180200;
        func_0201aabc(0x78);
        *(int *)(w + 0x900) |= 0x1000000;
        return;
    }
    if (*(int *)(w + 0x920) == 3) {
        if (func_0201b7e0(o) != 3) return;
        if (func_02019664() != 0x78) return;
        *(int *)((char *)o + 8) = 0x00180300;
        func_0201aaf4(0x78);
        return;
    }
}
