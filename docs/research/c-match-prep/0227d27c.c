/* CAMPAIGN-PREP candidate for func_0227d27c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: range/membership tree + jump-table (j<=9 switch) so mwcc emits addls pc,pc; deltas kept exact
 *   risk:       asm TRUNCATED + _LIT0.._LIT3 numeric bases UNRECOVERED — the absolute constants are placeholders, so this will NOT match as-is; the jump-table block is genuine (addls pc,pc,r1,lsl#2). struct-guessed/incomplete: campaign must extract the full asm + pool words first.
 *   confidence: low
 */
/* func_ov002_0227d27c (ov002, class D) — large range/membership classifier.
 * NOTE: asm is TRUNCATED mid-tree (ends in the .L_120 / _LIT3 block); the full
 * case set and _LIT0.._LIT3 base constants are NOT fully recovered. Returns 1
 * (.L_160) iff arg0 falls in a set of id ranges/points relative to four pool
 * bases, else 0 (.L_168). The orig is a balanced cmp tree with one 10-entry
 * jump table (addls pc,pc,r1,lsl#2 at .L_e4). Model as switch over the visible
 * cases; the campaign must recover _LIT0.._LIT3 + the truncated tail to fill in. */
extern int data_ov002_pool0;   /* _LIT0 base (unrecovered numeric value) */

int func_ov002_0227d27c(int a)
{
    int B = (int)&data_ov002_pool0;   /* placeholder for _LIT0; deltas below are exact */
    /* visible ranges/points (relative to the four LIT bases), 1 => match: */
    if (a == B - 0x224 - 0x100) return 1;
    if (a >= B - 0x224 + 0x7 && a <= B - 0x224 + 0xa) {
        if (a == B - 0x224 + 0x8) return 0;   /* hole inside the run */
        return 1;
    }
    if (a == B - 0x11) return 1;                 /* _LIT2 - 0x11 */
    if (a == B + 0x5f) return 1;
    if (a == B + 0x184) return 1;
    if (a == B + 0x28) return 1;
    /* .L_e4 jump table: B+0x2e .. +0x37 -> match for offsets {0,1,2,3,5,6,9} */
    {
        int j = a - (B + 0x2e);
        if ((unsigned)j <= 9) {
            switch (j) { case 0: case 1: case 2: case 3:
                         case 5: case 6: case 9: return 1; }
            return 0;
        }
    }
    return 0;   /* TRUNCATED: .L_120/_LIT3 block + further cases unrecovered */
}
