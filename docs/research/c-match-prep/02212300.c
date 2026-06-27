/* CAMPAIGN-PREP candidate for func_02212300 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     (u16)v>>8 -> lsl16;lsr16;asr8 (NOT (short)); (lo&1)->and+mla; hi*0x14->smulbb; 5-arg d59cc tail
 *   risk:       Compile-verified BYTE-IDENTICAL (mnemonics + pool order match; objdump renders smulbb as `cmn`). No expected divergence.
 *   confidence: high
 */
typedef unsigned short u16;
extern char data_ov002_022cf1a4[];
extern int  func_ov002_0223df38(void *self, int b, int c);
extern int  func_ov002_0223de94(void *self, int b);
extern int  func_ov002_021d59cc(unsigned int bit, unsigned int fld, int tag, int mode, int extra);
int func_ov002_02212300(void *self) {
    int v;
    int lo, hi;
    if (func_ov002_0223df38(self, 0, 0) == 0)
        return 0;
    v = func_ov002_0223de94(self, 0);
    lo = v & 0xff;
    hi = ((u16)v >> 8) & 0xff;
    if (*(u16 *)(data_ov002_022cf1a4 + (lo & 1) * 0x868 + hi * 0x14) == 0)
        return 0;
    func_ov002_021d59cc(lo, hi, 0x1119, 4, 0);
    return 0;
}
