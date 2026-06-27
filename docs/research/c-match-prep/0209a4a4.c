/* CAMPAIGN-PREP candidate for func_0209a4a4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order verbatim; spin-loop invariants in callee-saved r5/r4; guard early-return
 *   risk:       Store order 0x32,0x36,0xc,0,0x10,0x30,0x34 is non-monotonic; if mwcc sorts the global stores by offset, ~7 str/strh reorder. reshape-able (reorder C statements to match).
 *   confidence: med
 */
/* func_0209a4a4: init guard + clear block + channel-spin loop. */

extern unsigned short data_021a8390;

typedef struct {
    /* 0x00 */ int   field_0;
    /* 0x04 */ char  pad_4[8];
    /* 0x0c */ short field_c;
    /* 0x0e */ char  pad_e[2];
    /* 0x10 */ int   field_10;
    /* 0x14 */ char  pad_14[0x1c];
    /* 0x30 */ short field_30;
    /* 0x32 */ short field_32;
    /* 0x34 */ short field_34;
    /* 0x36 */ short field_36;
} Struct_021a8394;
extern Struct_021a8394 data_021a8394;

extern void func_02096228(void);
extern int  func_0209640c(int ch, int on);
extern void func_02096434(int ch, void *cb);
extern void func_0209a534(void);

void func_0209a4a4(void) {
    if (data_021a8390 != 0) return;
    data_021a8390 = 1;
    func_02096228();
    data_021a8394.field_32 = 0;
    data_021a8394.field_36 = 0;
    data_021a8394.field_c  = 0;
    data_021a8394.field_0  = 0;
    data_021a8394.field_10 = 0;
    data_021a8394.field_30 = 0;
    data_021a8394.field_34 = 0;
    while (func_0209640c(6, 1) == 0)
        ;
    func_02096434(6, (void *)func_0209a534);
}
