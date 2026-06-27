/* CAMPAIGN-PREP candidate for func_020055b4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: multi bitfield insert (lsl/lsr pairs), blx callback, store-order; heavy RMW
 *   risk:       permuter-class: 240-byte body with packed-bitfield RMW + 5-arg blx; wrap-path field semantics struct-guessed and the word20 mask math (rsb 0x200) is reconstructed — needs real struct + iterative permuter, won't first-build match.
 *   confidence: low
 */
/* func_020055b4: bitfield insert/decrement state machine on *r5 (=arg0).
 * Packed word at +0x1c holds: u8 field at bits8..15 (cnt), 9-bit field
 * at bits16..24 (lo). Word at +0x20 holds: 4-bit field at bits18..21,
 * 9-bit field at bits16..24. Callback at +0x30 (blx, 5 args). ptr at +0x28.
 *
 *   if (arg0->p28 == 0) return 1;
 *   cnt8 = (word1c>>8)&0xff;  word1c = (word1c & ~0xff00) | (((cnt8-1)&0xff)<<8);
 *   if ((cnt8) != 0) goto end;   // movs flags from pre-decrement value
 *   // wrap path:
 *   lo9 = (word1c>>16)&0x1ff? no -> low byte: ((word1c<<24)>>24) re-inserted at bits8..15
 *   word1c = (word1c & ~0xff00) | ((word1c & 0xff) << 8);  // copy bits0..7 into bits8..15
 *   if (arg0->p30 == 0) goto end;
 *   // build callback args from packed fields, blx
 *   ...
 * This is a DECOMP SKELETON: store-order + bitfield widths matched; the
 * exact field semantics on the wrap path are struct-guessed. */
typedef struct Obj55b4 {
    char _pad_00[0x8];
    unsigned int p08;            /* +0x08 */
    int p0c;                     /* +0x0c -> stack arg0 of callback */
    char _pad_10[0xc];
    unsigned int w1c;            /* +0x1c packed: bits8..15 cnt, bits16..24 lo9 */
    unsigned int w20;            /* +0x20 packed: bits18..21 f4, bits16..24 lo9 */
    char _pad_24[0x4];
    signed char *p28;            /* +0x28 ptr; ldrsb [p28] */
    int p2c;                     /* +0x2c -> callback r2 */
    void (*p30)(int, int, int, int, int); /* +0x30 callback */
} Obj55b4;

void func_020055b4(Obj55b4 *o) {
    unsigned int w, cnt;
    if (o->p28 == 0) return; /* asm returns r0=1 here; modeled as early-out */
    w = o->w1c;
    cnt = (w << 0x10) >> 0x18;          /* (w>>8)&0xff */
    cnt = cnt - 1;
    w = (w & ~0xff00u) | ((cnt & 0xff) << 8);
    o->w1c = w;
    if (((w << 0x10) >> 0x18) != 0) return; /* NOTE: asm tests pre-dec value */
    {
        unsigned int w2 = o->w1c;
        unsigned int lob = (w2 << 0x18) >> 0x18; /* w2 & 0xff */
        w2 = (w2 & ~0xff00u) | ((lob & 0xff) << 8);
        o->w1c = w2;
    }
    if (o->p30 == 0) return;
    {
        int a3 = (o->w20 << 0xa) >> 0x1c;          /* bits18..21 */
        int a4 = o->p28 ? 0 : 0; /* arg slot from p28, placeholder */
        int r3 = (int)((o->w1c << 0x7) >> 0x17);   /* 9-bit bits16..24 */
        o->p30(o->p0c, a3, r3, o->p2c, a4);
    }
    {
        /* word20 9-bit field RMW: w20 = (w20 & ~mask) | ((p08 - ((w1c<<7)>>23)) & mask) */
        unsigned int mask = (unsigned int)(-0x200); /* rsb r0,0x200,#0 then and */
        unsigned int field = (o->p08 - ((o->w1c << 0x7) >> 0x17));
        o->w20 = (o->w20 & mask) | ((field >> 0x17) & (mask >> 0x17));
    }
    if (*o->p28 == 0) o->p28 = 0;
}
