/* CAMPAIGN-PREP candidate for func_02286e54 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bit0 :1; arg pass-through (022576d8 result kept in r1); table[1-bit0]; movle => <=
 *   risk:       permuter-class: 0228c864 takes a fn-ptr (_LIT0) + the pass-through r1; if mwcc colors the kept r1/r2 (022576d8 result, fnptr) differently the bl setup diverges. Asm tail truncated - the post-movle return path (final mov r0) is unconfirmed.
 *   confidence: low
 */
/* func_ov002_02286e54 (cls D): sequential guard calls; final table[1-bit0] <= last ? 1 : (fallthrough).
 * stmdb {r4,lr}; r4=self; bl 022576d8()->r1; load func ptr _LIT0=0228db8c into r2; 0228c864(bit0, r1, fnptr).
 * movs r1,r0; bmi ret0. Then 021c848c(bit0); table[1-bit0]<=r0 ? return 1 (movle). Truncated tail. */
typedef unsigned short u16;
struct S86e54 { u16 f0; u16 bit0:1; u16 rest:15; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c848c(unsigned int bit);
extern int func_ov002_022576d8(void);
extern int func_ov002_0228c864(unsigned int bit, int a, int (*fn)(void));
extern int func_ov002_0228db8c(void);
int func_ov002_02286e54(struct S86e54 *self) {
    int a = func_ov002_022576d8();
    int r = func_ov002_0228c864(self->bit0, a, func_ov002_0228db8c);
    if (r < 0) return 0;
    {
        int v = func_ov002_021c848c(self->bit0);
        if (*(int *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868) <= v) return 1;
    }
    return 0;
}
