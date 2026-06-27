/* CAMPAIGN-PREP candidate for func_02232b60 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-shift extracts; inline mla base (no bind); reload attr per block; key0<<16 arg
 *   risk:       r4 must stay callee-saved (r4) live across 3 calls; mwcc may spill if it reloads attr into r4 first -> ldr/reg divergence. permuter-class (liveness/reg-alloc).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02232b60 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. attr=u16@+2, key0=u16@+0, w14=word@+0x14.
 * if ((attr>>12)&3)==2: gated chain (021c3b60>=0, 021ff3bc, 021ca3f0) then
 * 0227adb8(attr&1, &cf16c[(attr&1)*0x868+0x120+r4*4], 1, key0<<16) and
 * 021e276c(attr&1,key0,1,(u16)w14); else dispatch on 0202b878(w14).
 * cf16c base formed by mla inline each use (NOT bound); attr reloaded per block. */
typedef unsigned short u16;

extern char data_ov002_022cf16c[];
extern int  func_0202b878(int);
extern int  func_ov002_021c3b60(int, int);
extern int  func_ov002_021ca3f0(int, int);
extern int  func_ov002_021e276c(int, int, int, int);
extern int  func_ov002_021ff3bc(void *, void *);
extern int  func_ov002_0220e74c(void *, void *);
extern int  func_ov002_02210104(void *, void *);
extern int  func_ov002_02214720(void *, void *);
extern int  func_ov002_0227adb8(int, void *, int, int);

struct Card2b60 { u16 key0; u16 attr; char pad4[0x14 - 4]; int w14; };

int func_ov002_02232b60(struct Card2b60 *card, void *a1) {
    u16 attr = card->attr;
    if (((attr >> 12) & 3) == 2) {
        int r4 = func_ov002_021c3b60(attr & 1, card->key0);
        if (r4 < 0)
            return 0;
        if (func_ov002_021ff3bc(card, a1) == 0)
            return 0;
        attr = card->attr;
        if (func_ov002_021ca3f0(attr & 1, card->key0) == 0)
            return 0;
        attr = card->attr;
        func_ov002_0227adb8(attr & 1,
            data_ov002_022cf16c + (attr & 1) * 0x868 + 0x120 + r4 * 4,
            1, card->key0 << 16);
        attr = card->attr;
        func_ov002_021e276c(attr & 1, card->key0, 1, (u16)card->w14);
        return 0;
    }
    if (func_0202b878(card->w14) == 0x16)
        return func_ov002_02210104(card, a1);
    if (func_0202b878(card->w14) == 0x17)
        return func_ov002_0220e74c(card, a1);
    return func_ov002_02214720(card, a1);
}
