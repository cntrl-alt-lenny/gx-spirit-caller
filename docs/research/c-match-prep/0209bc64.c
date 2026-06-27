/* CAMPAIGN-PREP candidate for func_0209bc64 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     as 0209bba4 but field_14=0 (shared zero reg with 0x18); store order 0x14,0x18,8,4,0x10 verbatim
 *   risk:       field_14 and field_18 both 0 from one mov r1,#0; if mwcc materializes two zeros the str count is unaffected but a reordered/coalesced store sequence diverges. Non-monotonic order is the main lever. reshape-able (statement order).
 *   confidence: med
 */
/* func_0209bc64: irq-guard + ordered field stores, dispatch func_0209bdb8. */

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

extern int func_0209bdb8(void);

int func_0209bc64(int a, int b, int c) {
    int old;
    old = OS_DisableIrq();
    if (data_021a8438.field_0 != 0) {
        OS_RestoreIrq(old);
        return 1;
    }
    data_021a8438.field_0 = 1;
    OS_RestoreIrq(old);
    data_021a8438.field_14 = 0;
    data_021a8438.field_18 = 0;
    data_021a8438.field_8  = a;
    data_021a8438.field_4  = b;
    data_021a8438.field_10 = c;
    return func_0209bdb8() ? 0 : 3;
}
