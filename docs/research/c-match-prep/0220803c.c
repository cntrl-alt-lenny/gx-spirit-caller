/* CAMPAIGN-PREP candidate for func_0220803c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield :N for lsl/lsr; bind table base across loop; counted do-while
 *   risk:       Row element packed-compare ((b21>>13)&1 + field6*2) is struct-guessed: bit13/field6 field boundaries inferred from shifts, confirm against real row struct; also bls=unsigned count compare. permuter-class only if reg-alloc on mla base rotates.
 *   confidence: low
 */
/* func_ov002_0220803c: counted scan over player (bit0)'s cf178-sized
 * cf16c table; per row compare packed (b22*2+bit13) against self->f4.field9,
 * forward (f0,i) to func_ov002_022536e8 when they differ. tag6==0x23 -> 1. */
typedef unsigned short u16;

struct F0220803c_F2 { u16 bit0 : 1; u16 pad6 : 5; u16 tag6 : 6; u16 rest : 4; };
struct F0220803c_F4 { u16 pad6 : 6; u16 field9 : 9; u16 top : 1; };
struct F0220803c_Self { u16 f0; struct F0220803c_F2 f2; struct F0220803c_F4 f4; };

/* per-row element: 4-byte word, +0x120 into the row block */
struct Row0220803c { unsigned int b0_21 : 22; unsigned int field6 : 8; unsigned int hi : 2; };

extern char data_ov002_022cf16c[];
extern int data_ov002_022cf178[];
extern int func_ov002_022536e8(unsigned int bit0, unsigned int f0, unsigned int i);

int func_ov002_0220803c(struct F0220803c_Self *self) {
    int i;
    char *base;
    if (self->f2.tag6 == 0x23) return 1;
    if (*(int *)((char *)data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) == 0)
        return 0;
    base = data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0x120;
    i = 0;
    do {
        struct Row0220803c *r = (struct Row0220803c *)(base + i * 4);
        if ((unsigned int)(r->field6 * 2 + (r->b0_21 >> 13 & 1)) != self->f4.field9) {
            if (func_ov002_022536e8(self->f2.bit0, self->f0, i) != 0)
                return 1;
        }
        i++;
    } while ((unsigned int)i < (unsigned int)*(int *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0xc));
    return 0;
}
