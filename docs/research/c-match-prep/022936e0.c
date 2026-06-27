/* CAMPAIGN-PREP candidate for func_022936e0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     lo=packed&0xff, hi=(u16)>>8; -1 sentinel; signed <0x8fc
 *   risk:       hi extraction: orig is lsl#16;lsr#16;ASR#8;and#0xff (signed shift). '(unsigned short)x>>8' may emit LSR#8 not ASR#8 (result identical post-&0xff, byte-differs). reshape-able: cast 16-bit temp to short before >>8
 *   confidence: med
 */
/* func_ov002_022936e0 (ov002, D) - byte unpack (lo/hi) of a packed-16 return, range boolean.
 * flag0 = bit0 ushort@+2.  packed = func_0227d82c(flag0).
 * if (packed == -1) return 0.   (mvn r1,#0; cmp; moveq #0)
 * lo = packed & 0xff;  hi = ((unsigned short)packed >> 8) & 0xff   (lsl#16;lsr#16;asr#8;and#0xff).
 * r = func_021c8470(lo, hi).   (r0=lo, r1=hi)
 * return (r < 0x8fc) ? 1 : 0.   (signed movlt; 0x8fc via ldr literal) */
extern int func_ov002_0227d82c(int);
extern int func_ov002_021c8470(int, int);
struct Obj { unsigned short u0; unsigned short flag0 : 1, : 15; };

int func_ov002_022936e0(struct Obj *card) {
    int packed = func_ov002_0227d82c(card->flag0);
    int lo, hi;
    if (packed == -1) return 0;
    hi = ((unsigned short)packed >> 8) & 0xff;
    lo = packed & 0xff;
    return func_ov002_021c8470(lo, hi) < 0x8fc ? 1 : 0;
}
