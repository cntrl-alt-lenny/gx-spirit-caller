/* CAMPAIGN-PREP candidate for func_021f664c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch ce288+0x5b4, (bit0&1)*0x868 index keeps redundant and, tag6 guard
 *   risk:       struct-guessed: verified BYTE-MATCH at ov002 cflags (the &1 yields orig's lsl#31;lsr#31;and;mul; state RMW + dispatch all match). Only ce288 +0x5b4 / cf178 stride conventions to confirm.
 *   confidence: high
 */
/* func_ov002_021f664c: tag6 guard then 3-way state machine on ce288+0x5b4. cls D
 * (bitfield mul-index 0x868 guard).
 *   if (f2.tag6 == 0x23) return 1;
 *   case 0: 021e2b3c(); state++; return 0;
 *   case 1: if (*(int*)(cf178 + (f2.bit0 & 1)*0x868) != 0) { 021d7a1c(f2.bit0,0); return 0; }
 *           021e2c5c(); state++; return 0;
 *   default: return 1;
 * The (f2.bit0 & 1) reproduces orig's separate `and r2,r0,#1` before the *0x868. */
typedef unsigned short u16;

extern char data_ov002_022ce288[];   /* state @ +0x5b4 */
extern char data_ov002_022cf178[];   /* per-player table, 0x868/player */
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_021d7a1c(int bit0, int b);

struct F021f664c_F2 {
    u16 bit0 : 1;
    u16 mid5 : 5;
    u16 tag6 : 6;
    u16 top4 : 4;
};
struct F021f664c {
    u16 pad0;
    struct F021f664c_F2 f2;
};

int func_ov002_021f664c(struct F021f664c *self) {
    if (self->f2.tag6 == 0x23) return 1;
    switch (*(int *)(data_ov002_022ce288 + 0x5b4)) {
    case 0:
        func_ov002_021e2b3c();
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    case 1:
        if (*(int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) != 0) {
            func_ov002_021d7a1c(self->f2.bit0, 0);
            return 0;
        }
        func_ov002_021e2c5c();
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    default:
        return 1;
    }
}
