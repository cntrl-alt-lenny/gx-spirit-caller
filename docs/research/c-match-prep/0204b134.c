/* CAMPAIGN-PREP candidate for func_0204b134 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     start-index if-assign (moveq/movne); do-while i<=[+0xd]; int-array index +0xf4; reload bound each iter
 *   risk:       orig allocates a 4-byte stack slot (sub sp,#4) it never stores into - likely a spilled/aligned local mwcc won't emit for this C. The dead stack slot is the most probable byte divergence (struct-guessed / frame-size; may need a dummy local to force the reservation).
 *   confidence: med
 */
/* func_0204b134 - main - class C
 * linear search: r5=key. start index = (a1==0)?1:0. scan i.. while i<=[+0xd]
 * over int array [+0xf4] (stride 4); hit returns byte [+0x2d0][i]; miss 0xff.
 * Note: function reserves sub sp,#4 (unused slot). Offsets per src/main/func_0204b134.s.
 */
extern unsigned char *func_020498f0(void);

int func_0204b134(int a0, int a1)
{
    int key;
    int i;

    key = a0;
    i = (a1 == 0) ? 1 : 0;
    if (i <= func_020498f0()[0xd]) {
        do {
            if (key == ((int *)(func_020498f0() + 0xf4))[i])
                return func_020498f0()[i + 0x2d0];
            i++;
        } while (i <= func_020498f0()[0xd]);
    }
    return 0xff;
}
