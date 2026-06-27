/* CAMPAIGN-PREP candidate for func_021aa9b8 (ov018, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     constant-divisor smull-magic as plain /60 and /30; %60 via total-(total/60)*60; v*255 = (v<<8)-v
 *   risk:       reshape-able: `sec*255` must lower to `rsb x,sec,sec lsl#8` and `v/30` reuse the 0x88888889 magic (asr#4). If mwcc emits `mul`/_s32_div_f instead, write `(sec<<8)-sec`. min(total/60) is computed-then-discarded — keep the expression so the /60 magic emits. ctx(r0) saved across — bind ok.
 *   confidence: med
 */
/* func_ov018_021aa9b8: format a fixed-point clock value into a ping-pong
 * 0..255 ramp (sec<30 ? sec : 60-sec), scale /30, pack to u16|0xb and submit.
 * total = *(g+0x9cc) >> 12 seconds; min=total/60 dropped, sec=total%60. */
extern unsigned char data_ov018_021ad860[];
extern unsigned char data_ov018_021ad8a8[];
extern void func_ov018_021ad118(void *p, int packed, int ctx);

void func_ov018_021aa9b8(int ctx) {
    int total = *(int *)(data_ov018_021ad860 + 0x9cc) >> 12;
    int sec = total - (total / 60) * 60;
    int v;
    int packed;
    if (sec < 30)
        v = sec * 255;
    else
        v = (60 - sec) * 255;
    packed = ((unsigned short)(v / 30) << 16) | 0xb;
    func_ov018_021ad118(data_ov018_021ad8a8 + 0x966, packed, ctx);
}
