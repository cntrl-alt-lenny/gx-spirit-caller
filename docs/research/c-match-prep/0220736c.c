/* CAMPAIGN-PREP candidate for func_0220736c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: mla table base b0*0x868; bind stage1, RELOAD @+2 stage2; tail call
 *   risk:       permuter-class: high reg pressure (r4-r6,ip,lr) around two mla bases + entry packing; register rotation/scheduling likely diverges even with correct decl-order. Also struct-guessed offsets/strides.
 *   confidence: low
 */
/* func_ov002_0220736c (ov002, cls D): two-stage bitfield/table validation, tail
 * call. Entity *r0 bound in r5; arg1 saved early (r4). STRUCT/TABLE OFFSETS GUESSED.
 *  v=u16@+2: b0=bit0, idx5=bits[5:1]; h4=u16@+4: f9=bits[14:6].
 *  base1=cf16c, base2=cf1ac (=base1+0x40). Both are int tables selected by
 *  b0*0x868 (mla/mul, not pow2). Stage1 entry @ +0x30+idx5*0x14; rhs packs
 *  ((entry>>22)&0xff)*2 + ((entry>>13)&1) vs f9. Stage2 RELOADS @+2 and reads
 *  entry2 @ +idx5*0x14 (no +0x30), tests bit23. b0/idx5 passed to 021b4054. */
struct Ent { char _0[2]; unsigned short f2; unsigned short f4; char _6[0xe]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern int  func_ov002_021b4054(int a, int b, int c, int d);
extern int  func_ov002_021ff320(struct Ent *c, int arg1);

int func_ov002_0220736c(struct Ent *c, int arg1) {
    unsigned short v;
    int b0;
    int idx5;
    int f9;
    int entry;
    int rhs;
    unsigned short v2;
    int b0b;
    int idx5b;
    int entry2;
    v    = c->f2;
    b0   = ((unsigned)(v << 0x1f) >> 0x1f) & 1;
    idx5 = (unsigned)(v << 0x1a) >> 0x1b;
    entry = *(int *)((char *)data_ov002_022cf16c + b0 * 0x868 + 0x30 + idx5 * 0x14);
    f9   = (unsigned)(c->f4 << 0x11) >> 0x17;
    rhs  = (((unsigned)entry >> 0x16) & 0xff) * 2 + (((unsigned)entry >> 0xd) & 1);
    if (f9 != rhs)
        return 0;
    if (func_ov002_021b4054(b0, idx5, 0x16cb, 2) != 0)
        return 0;
    v2    = c->f2;
    b0b   = ((unsigned)(v2 << 0x1f) >> 0x1f) & 1;
    idx5b = (unsigned)(v2 << 0x1a) >> 0x1b;
    entry2 = *(int *)((char *)data_ov002_022cf1ac + b0b * 0x868 + idx5b * 0x14);
    if (((unsigned)entry2 >> 0x17) & 1)
        return 0;
    return func_ov002_021ff320(c, arg1);
}
