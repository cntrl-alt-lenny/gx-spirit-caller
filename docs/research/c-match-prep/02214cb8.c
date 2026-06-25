/* CAMPAIGN-PREP candidate for func_02214cb8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     twin of 02214aa0 + 2nd halfword guard (cf1a4 then cf1a2); shared off/row regs; stacked arg=1
 *   risk:       permuter-class: same composite-fusion risk as 02214aa0; orig reuses off (r3) and row (ip) across cf16c+cf1a4+cf1a2 -- if mwcc rematerializes bit0*0x868 or idx*20 per table, several mul/add diverge. struct-guessed offsets.
 *   confidence: low
 */
/* func_ov002_02214cb8: twin of 02214aa0 plus an extra table guard. Resolve
 * per-player slot (base cf16c + bit0*0x868, idx5*20 +0x30), composite
 * ((dword<<2>>24)<<1)|bit13 vs self->f4 bits14:8; if != return 0. Then if
 * data_022cf1a2[off+idx*20] (ldrh) == 0 return 0. Then if
 * data_022cf1a4[off+idx*20] (ldrh) != 0 skip; else func_021d6808(self,0,0,0,stack=1).
 * Returns 0. off and idx*20 are held in single regs and reused across all three
 * table accesses (add r4/r3 + ldrh [ip,...]). */

typedef unsigned short u16;

struct Slot02214cb8 { u16 f0; u16 bit0 : 1; u16 idx5 : 5; };
struct Self02214cb8 {
    u16 f0;
    struct Slot02214cb8 f2;   /* +2 */
    u16 f4;                   /* +4 */
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern char data_ov002_022cf1a4[];
extern int  func_ov002_021d6808(struct Self02214cb8 *self, int a, int b, int c, int d);

int func_ov002_02214cb8(struct Self02214cb8 *self) {
    int off = (self->f2.bit0 & 1) * 0x868;
    int row = self->f2.idx5 * 20;
    unsigned int d = *(unsigned int *)(data_ov002_022cf16c + off + row + 0x30);
    int comp = (int)(((d << 2) >> 24) << 1) + (int)((d << 18) >> 31);
    int fld  = ((unsigned int)(self->f4 << 17)) >> 23;
    if (fld != comp) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + row) == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + off + row) != 0) return 0;
    func_ov002_021d6808(self, 0, 0, 0, 1);
    return 0;
}
