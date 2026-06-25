/* CAMPAIGN-PREP candidate for func_02072544 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed-short bswap16 for asr; four 0/1 flag locals in decl order ip/r3/r6/r5
 *   risk:       Final 32-bit big-endian compose uses a tight 3-temp interleave (r2 reused mid-expression) — mwcc's instruction scheduling of the two swaps + shifts almost certainly differs; permuter-class, likely stays .s. Also flag-var alloc order (ip first) is fragile.
 *   confidence: low
 */
/* func_02072544: 4-stage short-circuit equality predicate over
 * big-endian (byte-swapped) packet fields. r0=a, r1=b, r2=obj.
 *  c1 = (obj->_8 != 0xa && obj->_8 != 0xb)
 *  c2 = c1 && (bswap16(b->_2) == obj->fa)
 *  c3 = c2 && (bswap16(b->_0) == obj->f18)
 *  res= c3 && (obj->f1c == ((bswap16(a->_c)<<16) | bswap16(a->_e)))
 *  return res
 *
 * bswap16 reads a SIGNED short field so mwcc emits 'asr #8' (not lsr)
 * for the >>8 half, then 'lsl#16;lsr#16' is the (u16) cast on the
 * result. The 32-bit compose reads two adjacent u16s a->_c / a->_e and
 * builds a big-endian dword to compare against the u32 obj->f1c.
 * Stage results are accumulated in separate 0/1 flags (ip,r3,r6,r5 in
 * orig) — keep four named locals initialised to 0.
 */

typedef struct PktA {
    char  _pad0c[0xc];
    short hc;              /* +0xc (signed for asr) */
    short he;              /* +0xe */
} PktA;

typedef struct PktB {
    short h0;              /* +0x0 */
    short h2;              /* +0x2 */
} PktB;

typedef struct Obj {
    char  _pad08[0x8];
    unsigned char state;   /* +0x8 */
    char  _pad09[0x1];
    unsigned short fa;     /* +0xa */
    char  _pad0c[0xc];
    unsigned short f18;    /* +0x18 */
    char  _pad1a[0x2];
    unsigned int   f1c;    /* +0x1c */
} Obj;

int func_02072544(PktA *a, PktB *b, Obj *obj) {
    int c1 = 0, c2 = 0, c3 = 0, res = 0;

    if (obj->state != 0xa && obj->state != 0xb) c1 = 1;

    if (c1) {
        if ((unsigned short)((b->h2 >> 8) | (b->h2 << 8)) == obj->fa)
            c2 = 1;
    }
    if (c2) {
        if ((unsigned short)((b->h0 >> 8) | (b->h0 << 8)) == obj->f18)
            c3 = 1;
    }
    if (c3) {
        unsigned int hi = (unsigned short)((a->hc >> 8) | (a->hc << 8));
        unsigned int lo = (unsigned short)((a->he >> 8) | (a->he << 8));
        if (obj->f1c == ((hi << 16) | lo)) res = 1;
    }
    return res;
}
