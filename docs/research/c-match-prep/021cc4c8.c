/* CAMPAIGN-PREP candidate for func_021cc4c8 (ov011, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: 9-bit/4-bit lsl;lsr bitfields, signed asr#24 byte, eq-select arg
 *   risk:       struct-guessed + permuter-class: the 4-bit field bit-position (w0<<25>>28) and the cc424 arg mapping (idx vs a3 vs the +1) are reconstructed from shifts; the w0 reload-per-use vs bind also flips reg-alloc. Confirm desc layout + cc424 6-arg roles.
 *   confidence: low
 */
/* func_ov011_021cc4c8: unpack a 2-word descriptor at *p, build two .12
 * fixed-point coords (9-bit fields from word0), test a 4-bit field (==1) and a
 * signed top byte of word1, then dispatch func_ov011_021cc424 with index +1
 * or +0 depending on the eq flag; a second guarded dispatch when
 * func_ov000_021ac760 returns nonzero.  Class D: multiple lsl;lsr bitfields. */
extern int  func_ov000_021ac760(void *p);
extern void func_ov011_021cc424(int idx, int a1, int a2, int a3, void *p5, int p6);

typedef struct {
    unsigned int lo7  : 7;   /* w0 bits[6:0]   (skipped by <<7) */
    unsigned int f9a  : 9;   /* w0 bits[15:7]  -> coordA */
    unsigned int f9b  : 9;   /* w0 bits[24:16] -> coordB */
    unsigned int f4   : 4;   /* w0 bits[6:3]?  see risk on field boundaries */
    unsigned int pad  : 3;
    int          w1;
} desc_t;

int func_ov011_021cc4c8(desc_t *p) {
    int coords[4];                 /* sp[0]=&coords? sp[4],sp[8],sp[c] */
    int eq;
    int sgn = (int)p->w1 >> 24;    /* r2 = w1 asr#24 */
    coords[2] = ((unsigned)(((unsigned)p->w1 << 0) ) , 0); /* placeholder */
    /* (w0<<16)>>23 == bits[15:7]; <<12 = .12 fixup */
    coords[2] = (int)((((unsigned int)((unsigned short)0)));
    /* The two .12 coords stored to sp[8], sp[c]: */
    {
        unsigned int w0 = *(unsigned int *)p;
        coords[2] = (int)(((w0 << 16) >> 23) << 12);  /* sp[8] */
        coords[3] = (int)(((w0 << 7)  >> 23) << 12);  /* sp[c] */
    }
    {
        unsigned int w0 = *(unsigned int *)p;
        eq = (((w0 << 25) >> 28) == 1);               /* 4-bit field == 1 */
    }
    coords[0] = (int)&coords[2];                       /* sp[0] = &cfg */
    coords[1] = 0;                                      /* sp[4] = 0 */
    if (!eq) {
        /* a3 = signed-half(sgn) + 1; arg byte from w1 high byte of p->f2 */
        unsigned char b = (unsigned char)(((unsigned)p->w1 << 8) >> 24);
        func_ov011_021cc424(b, 0x10, 2, ((short)(sgn << 16 >> 16)) + 1,
                            &coords[2], 0);
    } else {
        unsigned char b = (unsigned char)(((unsigned)p->w1 << 8) >> 24);
        func_ov011_021cc424(b, 0x10, 2, (short)(sgn << 16 >> 16),
                            &coords[2], 0);
    }
    if (func_ov000_021ac760(p)) {
        unsigned char b = (unsigned char)(((unsigned)p->w1 << 8) >> 24);
        int nz = (b != 0);
        func_ov011_021cc424(nz + 5, -1, 2, 0x10, &coords[2], 0);
    }
    return 0;
}
