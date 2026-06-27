/* CAMPAIGN-PREP candidate for func_0209ecc8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order: fields stored in exact asm order; +4 u32 alignment
 *   risk:       struct-guessed: Src/Rec offsets and the 2-byte pad before c@+4 are inferred from ldr/strh widths; confirm against the real structs. Store-order itself is faithful.
 *   confidence: med
 */
/* func_0209ecc8: guard chain, then marshal a 16-byte stack record from a
 * source struct (store-order heavy) and forward it to func_0209dcb8.
 * class D store-order: fields emitted in the asm's exact sequence
 * (u16 tag, u16 b, u32 c@+4, u16 d@+8, 6 bytes e@+0xa).
 * Return: db88 result if nonzero; 6 on any guard fail; dcb8 result (0 -> 2).
 */

extern int  func_0209db88(int a, int b, int c, int d);
extern int  func_0209dcb8(void *rec, int n);
extern void func_0209de5c(int a, void *ctx);

struct Src {
    unsigned int  w0;       /* +0  */
    unsigned short h4;      /* +4  */
    unsigned short h6;      /* +6  */
    unsigned char  b8;      /* +8  */
    unsigned char  b9;      /* +9  */
    unsigned char  ba;      /* +0xa */
    unsigned char  bb;      /* +0xb */
    unsigned char  bc;      /* +0xc */
    unsigned char  bd;      /* +0xd */
};

struct Rec {
    unsigned short tag;     /* +0  */
    unsigned short b;       /* +2  */
    unsigned int   c;       /* +4  */
    unsigned short d;       /* +8  */
    unsigned char  e[6];    /* +0xa */
};

int func_0209ecc8(void *ctx, struct Src *src) {
    struct Rec rec;
    int r = func_0209db88(3, 2, 3, 5);
    if (r != 0) return r;
    if (src == 0) return 6;
    if (src->w0 == 0) return 6;
    if ((unsigned)(src->h4 - 1) > 0xd) return 6;
    func_0209de5c(0xa, ctx);
    rec.tag = 0xa;
    rec.b   = src->h4;
    rec.c   = src->w0;
    rec.d   = src->h6;
    rec.e[0] = src->b8;
    rec.e[1] = src->b9;
    rec.e[2] = src->ba;
    rec.e[3] = src->bb;
    rec.e[4] = src->bc;
    rec.e[5] = src->bd;
    {
        int rc = func_0209dcb8(&rec, 0x10);
        if (rc == 0) return 2;
        return rc;
    }
}
