/* CAMPAIGN-PREP candidate for func_02023e58 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: hoist -1 const (mvn); walk +0xa7 ptr by 0x10; s16 indexed by i*0x10; ldrsh guard
 *   risk:       reshape-able: orig keeps the +0xa7 flag pointer in r5 advanced every iter (even when guard fails) — note `add r5,r5,#0x10` is OUTSIDE the predicated block. If mwcc only advances it inside the if, the loop tail diverges; matched by advancing `flag` unconditionally (as written).
 *   confidence: med
 */
/* func_02023e58: for each of 3 entries (stride 0x10): if the s16 at +0xa4 is
 * >= 0, call func_02022580(), then set that s16 = -1 and clear bit0 of the
 * byte at +0xa7. After the loop, clear bit0 of the u16 at +0xce. Returns 1.
 *
 * base self held in r6; the +0xa7 byte pointer walked in r5 (+=0x10 each
 * iter); the s16 addressed as self + i*0x10 + 0xa4 (separate base, r4 index).
 * mvn r7,#0 provides the -1 store constant (hoisted, reused).
 */

typedef struct {
    char  _pad0[0xa4];
    short f_a4;
    char  _pad1[0x01];
    unsigned char f_a7;
    char  _pad2[0x26];
    unsigned short f_ce;
} obj_02023e58_t;

extern void func_02022580(void);

int func_02023e58(obj_02023e58_t *self) {
    unsigned char *flag = (unsigned char *)self + 0xa7;
    int i;

    for (i = 0; i < 3; i++) {
        if (*(short *)((char *)self + i * 0x10 + 0xa4) >= 0) {
            func_02022580();
            *(short *)((char *)self + i * 0x10 + 0xa4) = -1;
            *flag &= ~1u;
        }
        flag += 0x10;
    }
    self->f_ce &= ~1u;
    return 1;
}
