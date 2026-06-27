/* CAMPAIGN-PREP candidate for func_0222b8b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     row-decode :5/:9 bitfields; off=(b0&1)*0x868 + ix=f1*0x14 reused; cf1a4 flag-gate; 021d93e0(b0,f1,1)
 *   risk:       reshape-able: off and ix held as two products (r2,r3) reused for cf16c row, cf1a4 flag and the call args; mwcc fusing base+index into one mla, or recomputing per-access, diverges the ldr/add count. f4.f6 :9 width struct-guessed.
 *   confidence: med
 */
/* func_ov002_0222b8b8 (ov002, class D, MED) brief 498. UNVERIFIED. Twin of 02229178/0222a9d0 row-decode+validate, simplest.
 * Decode (r2=f2, ip=f4): b0=f2.bit0; f1=(f2<<26)>>27 {5-bit};
 *   off=(b0&1)*0x868 (r2); ix=f1*0x14 (r3); row=*(int*)(cf16c+off+0x30+ix);
 *   if (f4.f6{(f4<<17)>>23} != ((row<<2)>>24)<<1 + (row<<18)>>31) return 0;
 *   flag=*(u16*)(cf1a4+off+ix); if(flag==0) return 0; 021d93e0(b0, f1, 1); return 0;  // r0=b0,r1=f1 leftover */
typedef unsigned short u16;
struct F0222b8b8_F2 { u16 b0 : 1; u16 f1 : 5; u16 rest : 10; };
struct F0222b8b8_F4 { u16 lo6 : 6; u16 f6 : 9; u16 top : 1; };
struct F0222b8b8_Self { u16 f0; struct F0222b8b8_F2 f2; struct F0222b8b8_F4 f4; };

extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf1a4[];
extern void func_ov002_021d93e0(int b0, int f1, int one);

int func_ov002_0222b8b8(struct F0222b8b8_Self *self) {
    int b0 = self->f2.b0;
    int f1 = self->f2.f1;
    int row = *(int *)(data_ov002_022cf16c + (b0 & 1) * 0x868 + 0x30 + f1 * 0x14);
    if ((int)self->f4.f6
        != (int)(((((unsigned)row << 2) >> 0x18) << 1) + (((unsigned)row << 0x12) >> 0x1f)))
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (b0 & 1) * 0x868 + f1 * 0x14) == 0)
        return 0;
    func_ov002_021d93e0(b0, f1, 1);
    return 0;
}
