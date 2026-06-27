/* CAMPAIGN-PREP candidate for func_02229178 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     row-decode :5/:9 bitfields; mla (b0&1)*0x868+0x30+f1*0x14; repacked-compare; leftover b0/f1 to call
 *   risk:       reshape-able: cmpR repack ((row<<2)>>24)<<1+(row<<18)>>31 is the matched 02262fd0 idiom but mwcc may CSE/reorder the two shift-extracts; also f4.f6 :9 width struct-guessed.
 *   confidence: med
 */
/* func_ov002_02229178 (ov002, class D, MED) brief 498. UNVERIFIED.
 * Decode (r1=f2, ip=f4): b0=(f2<<31)>>31 -> f2.b0:1; f1=(f2<<26)>>27 -> f2 bits[5:1] (5-bit);
 *   row=*(int*)(cf16c+(b0&1)*0x868+0x30+f1*0x14);
 *   cmpL=(f4<<17)>>23 -> f4 bits[14:6] (9-bit); cmpR=((row<<2)>>24)<<1 + (row<<18)>>31;
 *   if (cmpL!=cmpR) return 0; 021e2d94(b0, f1, 6, f4.bit2); return 0;
 * NOTE: r0=b0,r1=f1 are LEFTOVER from index calc at the call (not recomputed); 4th arg is f4 bit2 (triage ':3' approximate). */
typedef unsigned short u16;
struct F02229178_F2 { u16 b0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F02229178_F4 { u16 bit2lo : 2; u16 b2 : 1; u16 lo6 : 3; u16 f6 : 9; u16 top : 1; };
struct F02229178_Self { u16 f0; struct F02229178_F2 f2; struct F02229178_F4 f4; };

extern unsigned char data_ov002_022cf16c[];
extern void func_ov002_021e2d94(int b0, int f1, int six, int bit2);

int func_ov002_02229178(struct F02229178_Self *self) {
    int b0 = self->f2.b0;
    int f1 = self->f2.f1;
    int row = *(int *)(data_ov002_022cf16c + (b0 & 1) * 0x868 + 0x30 + f1 * 0x14);
    if ((int)self->f4.f6
        != (int)(((((unsigned)row << 2) >> 0x18) << 1) + (((unsigned)row << 0x12) >> 0x1f)))
        return 0;
    func_ov002_021e2d94(b0, f1, 6, self->f4.b2);
    return 0;
}
