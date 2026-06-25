/* CAMPAIGN-PREP candidate for func_020949f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     STORE-ORDER struct init; unsigned >>8 (lsr); field stores match asm sequence
 *   risk:       Struct offsets/widths guessed; the zero-run store scheduling (fb..fe, f8, fa) may be reordered by the compiler.
 *   confidence: med
 */
/* func_020949f0: struct field init. p->f0 = a; p->f4 = (*c) >> 8; then a
 * zero-fill of the trailing fields in the asm's exact store order
 * (fb,fc,fd,fe bytes, then f8 halfword, then fa byte). */
typedef struct {
    unsigned long  f0;   /* 0x00 */
    unsigned long  f4;   /* 0x04 */
    unsigned short f8;   /* 0x08 */
    unsigned char  fa;   /* 0x0a */
    unsigned char  fb;   /* 0x0b */
    unsigned char  fc;   /* 0x0c */
    unsigned char  fd;   /* 0x0d */
    unsigned char  fe;   /* 0x0e */
} Rec_020949f0;

void func_020949f0(Rec_020949f0 *p, unsigned long a, unsigned long *c) {
    p->f0 = a;
    p->f4 = *c >> 8;
    p->fb = 0;
    p->fc = 0;
    p->fd = 0;
    p->fe = 0;
    p->f8 = 0;
    p->fa = 0;
}
