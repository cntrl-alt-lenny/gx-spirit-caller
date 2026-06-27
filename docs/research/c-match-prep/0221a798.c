/* CAMPAIGN-PREP candidate for func_0221a798 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     id==const dispatch; flag-vs-bitfield cmp folds >>31; unsigned>=1 movcs/movcc; intentionally-uninit flag in default; (flag&0xf)<<4|1 pack
 *   risk:       reshape-able-but-fragile: `flag` is uninitialized on the no-match path (mirrors orig's stale r3 into .L_5d4) - mwcc may zero or warn-elide it differently. Also the `>=1` unsigned may compile movne/moveq not movcs/movcc. struct-guessed: d016c+0xcec/+0xcf8.
 *   confidence: low
 */
typedef unsigned short u16;

struct Self0221a798 {
    u16 id;                                   /* +0 */
    u16 b0 : 1; u16 : 15;                     /* +2 */
    u16 : 6; u16 f6 : 9;                      /* +4 bits6-14 field */
};

extern char data_ov002_022d016c[];
extern void func_ov002_021e276c(int player, int id, int packed, int field);

int func_ov002_0221a798(struct Self0221a798 *self) {
    int flag;
    int packed;
    if (self->id == 0x137e) {
        if (*(int *)(data_ov002_022d016c + 0xcec) != self->b0) {
            flag = 1;
        } else {
            flag = ((unsigned int)*(int *)(data_ov002_022d016c + 0xcf8) >= 1 ? 1 : 0) << 1;
        }
    } else if (self->id == 0x14fd) {
        flag = (*(int *)(data_ov002_022d016c + 0xcec) == self->b0 ? 1 : 0) + 1;
    }
    packed = (u16)(((flag & 0xf) << 4) | 1);
    func_ov002_021e276c(self->b0, self->id, packed, self->f6);
    return 0;
}
