/* CAMPAIGN-PREP candidate for func_020a5f44 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: mask-then-shift (and;asr); volatile MMIO so each ldrh/strh kept; store-order
 *   risk:       reshape-able: needs each access to re-ldrh (4 reads) -> volatile forces it; non-volatile would CSE the reads away. asr depends on (mask)>>k staying signed int. Return r0 unused by callers likely.
 *   confidence: med
 */
/* func_020a5f44: read two bitfields out of EXMEMCNT (0x04000204, u16 MMIO),
 * then RMW set bits2-3 and clear bit4. Stores in exact order. (class D)
 * out[0]=(reg&0xc)>>2 ; out[1]=(reg&0x10)>>4 (masked int >> = asr). */
int func_020a5f44(int *out) {
    volatile unsigned short *reg = (volatile unsigned short *)0x04000204;

    out[0] = (*reg & 0xc) >> 2;
    out[1] = (*reg & 0x10) >> 4;
    *reg = (unsigned short)((*reg & ~0xc) | 0xc);
    *reg = (unsigned short)(*reg & ~0x10);
    return 0;
}
