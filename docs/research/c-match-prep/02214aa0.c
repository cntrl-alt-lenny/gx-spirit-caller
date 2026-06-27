/* CAMPAIGN-PREP candidate for func_02214aa0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     per-player 0x868 off reused as cf16c dword + cf1a4 idx; asymmetric-shift composite; stacked arg=1
 *   risk:       permuter-class: orig keeps off (mul r3=bit0*0x868) live in one reg, reused for both cf16c and cf1a4 (add r4,r4,r3 / add r3,lr,r3) AND ip holds idx*20; if mwcc recomputes per table, ldr/mul diverge.
 *   confidence: low
 */
/* func_ov002_02214aa0: resolve per-player slot row (base cf16c + bit0*0x868, sub-row
 * idx5*20 at +0x30), reconstruct composite ((dword<<2>>24)<<1)|bit13, compare to
 * self->f4 bits14:8; if != return 0. Then gate on a parallel halfword table
 * data_022cf1a4[base + idx*20] (ldrh via ip,r3); if 0 return 0. Else
 * func_021d6808(self, 0, 0, 0, stack=1). Returns 0.
 *
 * Decl/bind order mirrors orig: r2=0x868, ip=0x14 set early; cf16c base bound to
 * r4 and reused as the +0x30 dword AND as the cf1a4 index. */

typedef unsigned short u16;

struct Slot02214aa0 { u16 f0; u16 bit0 : 1; u16 idx5 : 5; };
struct Self02214aa0 {
    u16 f0;
    struct Slot02214aa0 f2;   /* +2 */
    u16 f4;                   /* +4 */
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d6808(struct Self02214aa0 *self, int a, int b, int c, int d);

int func_ov002_02214aa0(struct Self02214aa0 *self) {
    int off = (self->f2.bit0 & 1) * 0x868;
    unsigned int d = *(unsigned int *)(data_ov002_022cf16c + off + self->f2.idx5 * 20 + 0x30);
    int comp = (int)(((d << 2) >> 24) << 1) + (int)((d << 18) >> 31);
    int fld  = ((unsigned int)(self->f4 << 17)) >> 23;
    if (fld != comp) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + self->f2.idx5 * 20) == 0) return 0;
    func_ov002_021d6808(self, 0, 0, 0, 1);
    return 0;
}
