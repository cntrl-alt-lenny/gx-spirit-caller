/* CAMPAIGN-PREP candidate for func_022889ec (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: b6_11 :6 guard; asymmetric (f<<23)>>21 kept as raw C (unequal shifts don't fold); :13 bitfield (symmetric folds otherwise) for ldrh id; ge-0x5dc bool
 *   risk:       the :13 ID: orig has explicit lsl19;lsr19 on the loaded halfword. struct-guessed: f14 offset (0x14) and the d0250 record stride are inferred; if d0250 stride/idx scaling differs the ldrh index diverges. Confirm f14 offset + d0250 layout against real struct.
 *   confidence: low
 */
/* func_ov002_022889ec (ov002, cls D): b6_11==0x16 guard, asymmetric-shift index,
 * :13 id extract, threshold bool. self at r0.
 *   if (self->b6_11 != 0x16) return 0;
 *   f = self->f14; idx = (unsigned)(f << 23) >> 21;   asymmetric -> NOT folded
 *   id = ((struct{u16 id:13;}*)(d0250 + idx))->id;     symmetric :13 -> lsl19/lsr19
 *   return func_0202b8f0(id) >= 0x5dc;
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct S022889ec { u16 f0; u16 bit0:1; u16 b1_5:5; u16 b6_11:6; u16 b12_15:4;
                   u16 _pad6[8]; u32 f14; };   /* f14 at offset 0x14 */
struct Id13 { u16 id : 13; };
extern char data_ov002_022d0250[];
extern int  func_0202b8f0(int a);
int func_ov002_022889ec(struct S022889ec *self) {
    u32 f;
    unsigned int idx;
    int id;
    if (self->b6_11 != 0x16) return 0;
    f = self->f14;
    idx = (unsigned int)(f << 23) >> 21;
    id = ((struct Id13 *)(data_ov002_022d0250 + idx))->id;
    return func_0202b8f0(id) >= 0x5dc;
}
