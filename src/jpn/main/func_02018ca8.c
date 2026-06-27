/* CAMPAIGN-PREP candidate for func_02018ca8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla stride-0x18 entry (k-1)*0x18+base; signed (x<<16)>>16 -> lsl;asr; `<=0` as cmp+movle#1/movgt#0
 *   risk:       reshape-able: signed (int<<16)>>16 should give lsl;asr (matches), and `return v<=0` gives movle#1/movgt#0. struct-guessed: 0x18 stride + 0xc field offset inferred; confirm against SysWork entry struct
 *   confidence: med
 */
/* func_02018ca8 (main, class D, MED) — stride-0x18 SysWork entry, signed 16-bit
 * field read, <=0 test. entry = GetSystemWork() + (func_020191dc(p0)-1)*0x18;
 * v = (short)entry->field@0xc (lsl#0x10;asr#0x10 sign-extend); return v <= 0.
 * Stride-24 family (cf. src/main/func_02018b8c.c, func_02018d64.c). The mla
 * `(k-1)*0x18 + base` and signed (x<<16)>>16 are the load-bearing shapes. */
extern char *GetSystemWork(void);
extern int  func_020191dc(int);

int func_02018ca8(int p0) {
    char *sys = GetSystemWork();
    int k = func_020191dc(p0);
    int v = ((int)(*(int *)(sys + (k - 1) * 0x18 + 0xc)) << 0x10) >> 0x10;
    return v <= 0;
}
