/* CAMPAIGN-PREP candidate for func_021b75c8 (ov016, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two counted copy loops; store-order preserved; ldrsh => signed short cells; pointer base bound once (r4)
 *   risk:       struct-guessed: cells base +0x34 and the second loop's <<3 stride (8 bytes/iter, 4 shorts) plus the *(int*)rec=0 store are inferred; offsets must be confirmed. Header store-order (_4,count,_c,_10) follows asm exactly.
 *   confidence: med
 */
/* func_ov016_021b75c8 (ov016, class C) — struct-copy (10 u32 = 20 u16)
 * from a const table into a 0x28 stack scratch, then if src->_8 > 6 a
 * second loop maps 5x 4-shorts into a global record at +0x34, and writes
 * a 5-field header. clone of 021b66a8.
 */
extern short data_ov016_021b8e34[];   /* source table: 10 x {u16,u16} */
extern void func_ov005_021aa4b0(void *rec);

typedef struct {
    unsigned char _pad0[0x4];
    int  _4;              /* +0x4 */
    int  count;           /* +0x8 */
    int  _c;              /* +0xc */
    int  _10;             /* +0x10 */
    unsigned char _pad14[0x20];
    short cells[/*5*4*/ 20]; /* +0x34 */
} Rec;
extern Rec data_ov000_021b1d4c;       /* destination record (r4) */

typedef struct {
    unsigned char _pad0[0x8];
    int count;            /* +0x8 */
    int _c;               /* +0xc */
} Src;

int func_ov016_021b75c8(Src *src) {
    Rec *rec = &data_ov000_021b1d4c;
    short scratch[20];    /* 0x28-byte stack copy */
    int i;

    for (i = 0; i < 10; i++) {
        scratch[i*2]   = data_ov016_021b8e34[i*2];
        scratch[i*2+1] = data_ov016_021b8e34[i*2+1];
    }

    if (src->count > 6) {
        func_ov005_021aa4b0(rec);
        *(int *)rec = 0;
        for (i = 0; i < 5; i++) {
            rec->cells[i*4]   = scratch[i*4];
            rec->cells[i*4+1] = scratch[i*4+1];
            rec->cells[i*4+2] = scratch[i*4+2];
            rec->cells[i*4+3] = scratch[i*4+3];
        }
        rec->_4   = src->_c;
        rec->count = src->count - 6;
        rec->_c   = 6;
        rec->_10  = 0;
    }
    return 1;
}
