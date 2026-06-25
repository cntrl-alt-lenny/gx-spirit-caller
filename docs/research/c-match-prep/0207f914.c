/* CAMPAIGN-PREP candidate for func_0207f914 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD predicated; bitfield OR on u16; two halfword stores
 *   risk:       Struct offsets guessed; block must predicate; fc/fe store order fixed.
 *   confidence: high
 */
/* func_0207f914: predicated accessor. if(p->f0==1){ p->f12|=8;
 * p->fc=(u16)a; p->fe=(u16)b; }  store order f12,fc,fe. */

typedef struct {
    int            f0;   /* 0x00 */
    unsigned char  _pad04[0x0c - 0x04];
    unsigned short fc;   /* 0x0c */
    unsigned short fe;   /* 0x0e */
    unsigned char  _pad10[0x12 - 0x10];
    unsigned short f12;  /* 0x12 */
} T;

void func_0207f914(T *p, int a, int b) {
    if (p->f0 == 1) {
        p->f12 |= 8;
        p->fc = (unsigned short)a;
        p->fe = (unsigned short)b;
    }
}
