/* CAMPAIGN-PREP candidate for func_02028024 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order + bind sel/val once pre-switch; dense switch -> addls jump-table
 *   risk:       Per-case MMIO addrs go to a literal pool; mwcc may share/reorder the 8 _LIT words vs the orig's trailing per-case order. reshape-able (pool layout follows case order).
 *   confidence: med
 */
/* func_02028024 (main, class D): 8-way switch on signed-short field 0xd4.
 * Each case RMWs a REG_BLDCNT-pair MMIO half: *reg = (*reg & ~3) | val,
 * val = signed-short field 0xd6 (loaded once, before the dispatch).
 * Cases 0..7 -> 0x04000008,0a,0c,0e / 0x04001008,0a,0c,0e.
 * struct-guessed: 0xd4 selector, 0xd6 value offsets inferred. */
typedef volatile unsigned short vu16;

struct Obj02028024 {
    char _p[0xd4];
    short sel;   /* +0xd4, ldrsh */
    short val;   /* +0xd6, ldrsh */
};

int func_02028024(struct Obj02028024 *p) {
    int sel = p->sel;
    int val = p->val;

    switch (sel) {
    case 0: *(vu16 *)0x04000008 = (*(vu16 *)0x04000008 & ~3) | val; break;
    case 1: *(vu16 *)0x0400000a = (*(vu16 *)0x0400000a & ~3) | val; break;
    case 2: *(vu16 *)0x0400000c = (*(vu16 *)0x0400000c & ~3) | val; break;
    case 3: *(vu16 *)0x0400000e = (*(vu16 *)0x0400000e & ~3) | val; break;
    case 4: *(vu16 *)0x04001008 = (*(vu16 *)0x04001008 & ~3) | val; break;
    case 5: *(vu16 *)0x0400100a = (*(vu16 *)0x0400100a & ~3) | val; break;
    case 6: *(vu16 *)0x0400100c = (*(vu16 *)0x0400100c & ~3) | val; break;
    case 7: *(vu16 *)0x0400100e = (*(vu16 *)0x0400100e & ~3) | val; break;
    }
    return 1;
}
