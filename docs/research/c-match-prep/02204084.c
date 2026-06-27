/* CAMPAIGN-PREP candidate for func_02204084 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     guard && table>500; two 021ca698 arms (1-bit0/bit0); 022536e8!=0->2; final b12_13==0
 *   risk:       reshape-able(operand-order): &&-nested guard + repeated bit0 extracts; if mwcc reorders the 021bbc58-vs-table guard or the 1-bit0 rsb placement, expect a few movcc/reg diffs.
 *   confidence: med
 */
/* func_ov002_02204084: cls D. If 021bbc58(bit0,3) and cf16c[bit0*0x868] > 500,
 * probe two 021ca698 partners; a hit whose 022536e8 fires returns 2.
 * Otherwise return (b12_13 == 0). self held in r4. */
typedef unsigned short u16;

struct S02204084 {
    u16 f0;
    u16 bit0 : 1;
    u16 b1_5 : 5;
    u16 b6_11 : 6;
    u16 b12_13 : 2;
    u16 b14_15 : 2;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021bbc58(int bit, int k);
extern int func_ov002_021ca698(int a, int b);
extern int func_ov002_022536e8(unsigned int bit, u16 a, int b);

int func_ov002_02204084(struct S02204084 *self) {
    if (func_ov002_021bbc58(self->bit0, 3) != 0 &&
        *(int *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868) > 0x1f4) {
        if (func_ov002_021ca698(self->bit0, 1 - self->bit0) != 0) {
            if (func_ov002_022536e8(self->bit0, self->f0, 0) != 0) return 2;
        } else if (func_ov002_021ca698(self->bit0, self->bit0) != 0) {
            if (func_ov002_022536e8(1 - self->bit0, self->f0, 0) != 0) return 2;
        }
    }
    return self->b12_13 == 0;
}
