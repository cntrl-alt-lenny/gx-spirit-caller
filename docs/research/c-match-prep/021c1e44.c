/* CAMPAIGN-PREP candidate for func_021c1e44 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: :1 owner + :5 kind bitfields; movne/moveq -> (turn!=bit); reload id per call
 *   risk:       reshape-able: orig holds obj base in r6 and reloads ldrh [r6] before each 0202b878 call; if mwcc caches the id in a reg, 2 ldrh diverge. owner:1/kind:5 offsets struct-guessed.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c1e44 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. Drop into src/, ninja+objdiff, tweak per risk.
 *   bitfield extracts + branch dispatch. obj+0 = u16 card id, obj+2 = packed flags.
 *   0202b878(id) classifies: ==0x17 -> 021c1e20 path; else if ==0x16 OR a 5-bit
 *   field in [5,10) with 0202e234(id)!=0 -> 021c1d28 path; else return 0.
 *   r2 arg = (turn != (flags&1)) ? 1 : 0 in both call paths (movne/moveq = '!=').
 */
struct Card { unsigned short id; unsigned short owner:1; unsigned short :4; unsigned short kind:5; unsigned short :6; };

extern int func_0202b878(int id);
extern int func_0202e234(int id);
extern int func_ov002_021c1d28(int turn, int arg, int diff);
extern int func_ov002_021c1e20(int turn, int arg, int diff);

int func_ov002_021c1e44(struct Card *c, int turn, int arg)
{
    if (func_0202b878(c->id) == 0x17) {
        return func_ov002_021c1e20(turn, arg, turn != c->owner);
    }
    if (func_0202b878(c->id) != 0x16) {
        unsigned int k = c->kind;
        if (k < 5 || k >= 10)
            return 0;
        if (func_0202e234(c->id) == 0)
            return 0;
    }
    return func_ov002_021c1d28(turn, arg, turn != c->owner);
}
