/* CAMPAIGN-PREP candidate for func_0223dc14 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield struct for slot fields + counter; preserve insert/store order
 *   risk:       orig RMWs ONE stack u16 across 4 bic/orr inserts in source order; mwcc will likely build v in regs and reorder the bitfield inserts. permuter-class (siblings 0223db04/dad0 shipped as .s).
 *   confidence: low
 */
/* func_ov002_0223dc14: build a packed u16 slot value from (a,b,c) and append
 * it to self->ring at index = self->hdr.count (bits8-15 of +6), then count++.
 * Sibling of 0223db04 / 0223dad0 (both shipped as .s, reg-alloc walls). */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Slot8 { u16 a:1; u16 b:4; u16 c:9; u16 d:2; };

struct Ent0223dc14 {
    u16 f0;
    u16 f2;
    u16 f4;
    struct { u16 lo:8; u16 count:8; } hdr;   /* +6 */
    struct Slot8 ring[5];                     /* +8 */
};

void func_ov002_0223dc14(struct Ent0223dc14 *self, int a, int b, int c) {
    struct Slot8 v;
    int idx;
    v.a = a & 1;
    v.b = b & 0xf;
    v.c = c & 0x1ff;
    v.d = 0;
    idx = self->hdr.count;
    self->hdr.count = idx + 1;
    self->ring[idx] = v;
}
