/* CAMPAIGN-PREP candidate for func_021f7f08 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :6 guard; bind ip=b0<<4 (CSE for mvn shift + 0xffff<<ip mask); shifted-and operand-first; state switch
 *   risk:       struct-guessed/fold: case1 (self->b0 & 1) on a :1 bitfield — mwcc folds the &1 away, MISSING orig 'and r3,r0,#1'. Needs a wider holder or int copy to keep the and; the mvn/and mask shape is otherwise faithful.
 *   confidence: low
 */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self {
    u16 f0;
    u16 b0  : 1;
    u16 b1  : 5;
    u16 b6  : 6;
    u16 b12 : 2;
};

extern char data_ov002_022ce288[];
extern char data_ov002_022cf178[];

extern int func_ov002_021d7c88(int a, int b);
extern int func_ov002_021de8fc(int a, int b, int c);

int func_ov002_021f7f08(struct Self *self) {
    int *state;
    if (self->b6 == 0x23) return 1;
    state = (int *)(data_ov002_022ce288 + 1460);
    switch (*state) {
    case 0: {
        int ip = self->b0 << 4;
        int sh = ip + self->b1;
        func_ov002_021de8fc((int)self, (~(1 << sh)) & (0xffff << ip), 0);
        *state += 1;
        return 0;
    }
    case 1:
        if (*(int *)(data_ov002_022cf178 + (self->b0 & 1) * 0x868) != 0) {
            func_ov002_021d7c88(self->b0, 0);
            return 0;
        }
        *state += 1;
        return 0;
    default:
        return 1;
    }
}
