/* CAMPAIGN-PREP candidate for func_0222ad54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     32-bit w14 {f9:9,par:1,row4:4} bitfields; mla (par&1)*0x868+0x30+row4*0x14; two flag-table guards; compare cmpR-LEFT
 *   risk:       struct-guessed: w14 sub-field layout (f9@0:9, par@9:1, row4@10:4) inferred from (w<<22)>>31/(w<<18)>>28/(w<<23)>>23 -- confirm against real struct; if a field is signed or differently placed the shift sequence diverges. 4th call arg 0 via pushed-r3 slot.
 *   confidence: med
 */
/* func_ov002_0222ad54 (ov002, class D, MED) brief 498. UNVERIFIED. Row-decode+validate twin keyed on a 32-bit word at self+0x14 (not f2/f4), TWO flag tables.
 * Decode (lr=self->w14, 32-bit): par=(w<<22)>>31 -> w bit9; row4=(w<<18)>>28 -> w bits[13:10] (4-bit);
 *   off=(par&1)*0x868 (r3); ix=row4*0x14 (ip); row=*(int*)(cf16c+off+0x30+ix);
 *   cmpL=(w<<23)>>23 -> w bits[8:0] (9-bit);
 *   if (((row<<2)>>24)<<1 + (row<<18)>>31 != cmpL) return 0;
 *   if (*(u16*)(cf1a4+off+ix)==0) return 0; if (*(u16*)(cf1a2+off+ix)!=0) return 0;
 *   021d6808(self, par, row4, 0); return 0;  // r0=self,r1=par,r2=row4 leftover
 * NOTE: compare operand order = cmpR(row decode) LEFT vs w.f9 RIGHT. */
typedef unsigned short u16;
typedef unsigned int   u32;
struct F0222ad54_W { u32 f9 : 9; u32 par : 1; u32 row4 : 4; u32 rest : 18; };
struct F0222ad54_Self { u32 pad0[5]; struct F0222ad54_W w14; };

extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf1a4[];
extern unsigned char data_ov002_022cf1a2[];
extern void func_ov002_021d6808(struct F0222ad54_Self *self, int par, int row4, int zero);

int func_ov002_0222ad54(struct F0222ad54_Self *self) {
    int par  = self->w14.par;
    int row4 = self->w14.row4;
    int off  = (par & 1) * 0x868;
    int ix   = row4 * 0x14;
    int row  = *(int *)(data_ov002_022cf16c + off + 0x30 + ix);
    if ((int)(((((unsigned)row << 2) >> 0x18) << 1) + (((unsigned)row << 0x12) >> 0x1f))
        != (int)self->w14.f9)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + ix) == 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + off + ix) != 0)
        return 0;
    func_ov002_021d6808(self, par, row4, 0);
    return 0;
}
