/* CAMPAIGN-PREP candidate for func_02209d04 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind p*0x868 + idx*0x14 bases reused; bitfield kind/low13; reload G fields
 *   risk:       permuter-class: regs hold cf16c-add result plus p*0x868 and idx*0x14; the add-CSE order and which reg carries entry-ptr is a scheduling coin-flip if mwcc reassociates the two muls.
 *   confidence: low
 */
/* func_ov002_02209d04 (ov002, class C, MED) -- batch p_0086.
 * kind in {0xd,0x14} guard; global G(cd3f4): G->busy==0, G->a==p reject, G->b==p require;
 * idx=G->slot; entry=*(int*)(cf16c + p*0x868 + idx*0x14 + 0x30) low13 != 0;
 * return *(u16*)(cf1a4 + p*0x868 + idx*0x14) != 0.
 * Bind base2=p*0x868 and base3=idx*0x14 (orig reuses r2,r3 across both derefs).
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self02209d04 {
    u16 f0;
    struct { u16 p : 1; u16 _m : 5; u16 kind : 6; u16 _t : 4; } f2; /* +0x2 */
};

struct G02209d04 { int a; int b; int busy; u8 _c[0x14]; int slot; }; /* +0x0,+0x4,+0x8,+0x20 */

extern struct G02209d04 data_ov002_022cd3f4;
extern u8 data_ov002_022cf16c[]; /* field base, stride 0x868 */
extern u8 data_ov002_022cf1a4[]; /* alias member, stride 0x868, sub-stride 0x14 */

int func_ov002_02209d04(struct Self02209d04 *self) {
    int kind = self->f2.kind;
    int p;
    int idx;
    int base2, base3;
    int v;
    if (kind != 0xd && kind != 0x14) return 0;
    if (data_ov002_022cd3f4.busy != 0) return 0;
    p = self->f2.p;
    if (data_ov002_022cd3f4.a == p) return 0;
    if (data_ov002_022cd3f4.b != p) return 0;
    idx = data_ov002_022cd3f4.slot;
    base2 = (p & 1) * 0x868;
    base3 = idx * 0x14;
    v = *(int *)(data_ov002_022cf16c + base2 + base3 + 0x30);
    v = (v << 19) >> 19;
    if (v == 0) return 0;
    return *(u16 *)(data_ov002_022cf1a4 + base2 + base3) != 0;
}
