/* CAMPAIGN-PREP candidate for func_0207f8d8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD predicated; bitfield OR on u16; STORE-ORDER
 *   risk:       Struct offsets guessed; if-block must stay predicated (eq) not branched.
 *   confidence: high
 */
/* func_0207f8d8: predicated accessor. if(p->f0==1){ p->f12|=2;
 * p->f4=a; p->f8=b; }  store order f12,f4,f8. */

typedef struct {
    int            f0;   /* 0x00 */
    int            f4;   /* 0x04 */
    int            f8;   /* 0x08 */
    unsigned char  _pad0c[0x12 - 0x0c];
    unsigned short f12;  /* 0x12 */
} T;

void func_0207f8d8(T *p, int a, int b) {
    if (p->f0 == 1) {
        p->f12 |= 2;
        p->f4 = a;
        p->f8 = b;
    }
}
