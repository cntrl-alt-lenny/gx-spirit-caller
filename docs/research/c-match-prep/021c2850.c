/* CAMPAIGN-PREP candidate for func_021c2850 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: halfword bitfield inserts in store-order; obj->f0 reloaded per extract; :13 and 9-bit packs
 *   risk:       struct-guessed + permuter-class: the +4 field math (lsl#2;lsr#18 then *2 + bit31-of(f<<18), masked 0xffff803f) is an exact shift sequence; the interleaved str-zero / strh order across +2 and +4 will reorder, and obj->f0 is reloaded (ldr [r0]) twice not cached.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2850 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected.
 *   like 021c229c but a richer packet built from func_ov002_021c93f0()'s result obj.
 *   guard: if slot(arg1)<=4 return 0. Build 0x18 stack struct, zeroed (6 words),
 *   with halfword bitfield inserts (store-order!): +2 bit0=(arg0&1), bits1..5=slot,
 *   clears bits12..13; word0 = obj->f0 low 13b; +4 halfword packs a 9-bit field from
 *   obj rounded, masked with 0xffff803f. Tail-call func_ov002_021fca38(&struct).
 */
struct Obj  { unsigned int f0; };
struct Pkt2 {
    unsigned short w0;      /* +0: obj :13 field         */
    unsigned short a:1;     /* +2 bit0 = arg0&1          */
    unsigned short b:5;     /* +2 bits1..5 = slot        */
    unsigned short :6;
    unsigned short c:2;     /* +2 bits12..13 cleared     */
    unsigned short :2;
    unsigned short w4;      /* +4: 9-bit packed, &803f   */
    unsigned char  rest[18];
};
extern struct Obj *func_ov002_021c93f0(void);
extern int func_ov002_021fca38(struct Pkt2 *p);

int func_ov002_021c2850(int arg0, int slot)
{
    struct Pkt2 p;
    struct Obj *o;
    unsigned int f;
    if (slot <= 4)
        return 0;
    o = func_ov002_021c93f0();
    *(int *)&p = 0;
    p.a = arg0 & 1;
    p.b = slot;
    *(int *)((char *)&p + 0x8) = 0;
    *(int *)((char *)&p + 0xc) = 0;
    f = o->f0;
    p.w0 = (unsigned short)((f << 0x13) >> 0x13);   /* low 13 bits */
    f = o->f0;
    *(int *)((char *)&p + 0x10) = 0;
    *(int *)((char *)&p + 0x14) = 0;
    /* +4: ((f>>22)&0xff)*2 + bit0(f) packed at bits 6..14, keep 0xffff803f */
    p.w4 = (unsigned short)((p.w4 & 0xffff803f)
         | (((((f << 2) >> 0x18) << 1) + ((f << 0x12) >> 0x1f)) << 6));
    p.c = 0;
    return func_ov002_021fca38(&p);
}
