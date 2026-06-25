/* CAMPAIGN-PREP candidate for func_0207f8f8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD predicated; bitfield OR on u16; halfword setter
 *   risk:       Struct offsets guessed; block must predicate, not branch.
 *   confidence: high
 */
/* func_0207f8f8: predicated accessor. if(p->f0==1){ p->f12|=4;
 * p->f10=(u16)a; }  arg stored as halfword. */

typedef struct {
    int            f0;   /* 0x00 */
    unsigned char  _pad04[0x10 - 0x04];
    unsigned short f10;  /* 0x10 */
    unsigned short f12;  /* 0x12 */
} T;

void func_0207f8f8(T *p, int a) {
    if (p->f0 == 1) {
        p->f12 |= 4;
        p->f10 = (unsigned short)a;
    }
}
