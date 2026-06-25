/* CAMPAIGN-PREP candidate for func_0220e518 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack-temp out-param; decl-order lo(r4)/mid(r5); signed narrow + asr#8 byte
 *   risk:       reshape-able: mid = ((short)t>>8)&0xff must keep asr (orig mov lsl#0x10;lsr#0x10;asr#0x8). If mwcc treats t as unsigned and emits lsr, mid diverges; the sub sp/add sp #4 frame for the single u16 out-param should follow automatically.
 *   confidence: med
 */
/* func_ov002_0220e518 (ov002, class C, MED) -- batch p_0086.
 * stack u16 t; 0223df38(self, 0, &t); if ret==0 return 0;
 * lo = t & 0xff (r4) ; mid = (signed)((t<<16)>>16) >> 8 & 0xff (r5);
 * if 0225764c(self, lo, mid)==0 return 0;
 * return 021de4d8(self, lo, mid) != 0.
 * decl order lo(r4) then mid(r5) to match first-used-first-allocated.
 */
typedef unsigned short u16;

extern int func_ov002_0223df38(void *self, int z, u16 *out);
extern int func_ov002_0225764c(void *self, int lo, int mid);
extern int func_ov002_021de4d8(void *self, int lo, int mid);

int func_ov002_0220e518(void *self) {
    u16 t;
    int lo, mid;
    if (func_ov002_0223df38(self, 0, &t) == 0) return 0;
    lo  = t & 0xff;
    mid = (((int)(short)t >> 8)) & 0xff;
    if (func_ov002_0225764c(self, lo, mid) == 0) return 0;
    return func_ov002_021de4d8(self, lo, mid) != 0;
}
