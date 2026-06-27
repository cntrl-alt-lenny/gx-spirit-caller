/* CAMPAIGN-PREP candidate for func_0222a9d0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     row-decode+repacked-compare twin; cf1a4 flag-gate; 5-arg tail 021d59cc(b0,f1,0x16cb,4,stack 0)
 *   risk:       reshape-able: off=(b0&1)*0x868 and ix=f1*0x14 are kept as two separate products (r2,r3) reused for cf16c, cf1a4 and the call; if mwcc fuses base+index into one mla or recomputes, addressing diverges. f4.f6 :9 width struct-guessed.
 *   confidence: med
 */
/* func_ov002_0222a9d0 (ov002, class D, MED) brief 498. UNVERIFIED. Twin of 0222b8b8 + 5-arg tail call (stack arg).
 * Decode (r2=f2, ip=f4): b0=f2.bit0; f1=(f2<<26)>>27 {5-bit};
 *   off=(b0&1)*0x868 (r2); ix=f1*0x14 (r3); row=*(int*)(cf16c+off+0x30+ix);
 *   if (f4.f6{(f4<<17)>>23} != ((row<<2)>>24)<<1 + (row<<18)>>31) return 0;
 *   flag=*(u16*)(cf1a4+off+ix); if(flag) 021d59cc(b0, f1, 0x16cb, 4, 0); return 0;  // r0=b0,r1=f1 leftover, 5th via stack=0
 * NOTE: sub sp,#4 holds the stack arg; 021d59cc also seen 5-arg in matched 022297e0. */
typedef unsigned short u16;
struct F0222a9d0_F2 { u16 b0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F0222a9d0_F4 { u16 lo6 : 6; u16 f6 : 9; u16 top : 1; };
struct F0222a9d0_Self { u16 f0; struct F0222a9d0_F2 f2; struct F0222a9d0_F4 f4; };

extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf1a4[];
extern void func_ov002_021d59cc(int b0, int f1, int c, int d, int e);

int func_ov002_0222a9d0(struct F0222a9d0_Self *self) {
    int b0 = self->f2.b0;
    int f1 = self->f2.f1;
    int row = *(int *)(data_ov002_022cf16c + (b0 & 1) * 0x868 + 0x30 + f1 * 0x14);
    if ((int)self->f4.f6
        != (int)(((((unsigned)row << 2) >> 0x18) << 1) + (((unsigned)row << 0x12) >> 0x1f)))
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (b0 & 1) * 0x868 + f1 * 0x14) != 0)
        func_ov002_021d59cc(b0, f1, 0x16cb, 4, 0);
    return 0;
}
