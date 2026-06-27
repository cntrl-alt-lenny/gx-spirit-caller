/* CAMPAIGN-PREP candidate for func_0209bba4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     DisableIrq state in caller-saved across guard; store order 0x14,0x18,8,4,0x10 verbatim; movne0/moveq3 return
 *   risk:       Store order 0x14,0x18,0x8,0x4,0x10 non-monotonic; mwcc may sort by offset, reordering 5 str. Also args a/b/c map to fields 0x8/0x4/0x10 (not in arg order) — stores must follow asm. reshape-able (statement order).
 *   confidence: med
 */
/* func_0209bba4: irq-guard + ordered field stores, dispatch func_0209bda8. */

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);

typedef struct {
    /* 0x00 */ int field_0;
    /* 0x04 */ int field_4;
    /* 0x08 */ int field_8;
    /* 0x0c */ int field_c;
    /* 0x10 */ int field_10;
    /* 0x14 */ int field_14;
    /* 0x18 */ int field_18;
} Struct_021a8438;
extern Struct_021a8438 data_021a8438;

extern int func_0209bda8(void);

int func_0209bba4(int a, int b, int c) {
    int old;
    old = OS_DisableIrq();
    if (data_021a8438.field_0 != 0) {
        OS_RestoreIrq(old);
        return 1;
    }
    data_021a8438.field_0 = 1;
    OS_RestoreIrq(old);
    data_021a8438.field_14 = 1;
    data_021a8438.field_18 = 0;
    data_021a8438.field_8  = a;
    data_021a8438.field_4  = b;
    data_021a8438.field_10 = c;
    return func_0209bda8() ? 0 : 3;
}
