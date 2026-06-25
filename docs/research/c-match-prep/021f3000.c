/* CAMPAIGN-PREP candidate for func_021f3000 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Ov002Self.b0 bitfield (lsl31/lsr31 on u16+2); neighbour idx+/-1 guards; self bound in r6
 *   risk:       021c1ef0 is called with no register setup in asm (self/player/idx still live in r0/r5/r4 from entry) - mwcc must keep them across the b0/idx guards; if it reloads or the call gets self-only args, the arg moves diverge. reshape-able if signature is (self,player,idx); struct-guessed on b0 offset
 *   confidence: med
 */
/* func_ov002_021f3000: self=arg0 (r0/r6), player=arg1 (r5), idx=arg2 (r4).
 * Guards on self->b0==player and idx<5, a 021c1ef0 readiness call and a
 * 021c1e44 self-check, then probes neighbour idx+1 (if idx<4) and idx-1
 * (if idx>0) via 021bc55c. b0 is the bit0 of the u16 at self+2. */
typedef unsigned short u16;

extern int func_ov002_021bc55c(int player, int idx);
extern int func_ov002_021c1e44(void *self, int player, int idx);
extern int func_ov002_021c1ef0(void *self, int player, int idx);

struct Ov002Self { u16 f0; u16 b0 : 1; };

int func_ov002_021f3000(void *self, int player, int idx) {
    if (((struct Ov002Self *)self)->b0 != player)
        return 0;
    if (idx >= 5)
        return 0;
    if (func_ov002_021c1ef0(self, player, idx) == 0)
        return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0)
        return 0;
    if (idx < 4) {
        if (func_ov002_021bc55c(player, idx + 1) != 0)
            return 1;
    }
    if (idx > 0) {
        if (func_ov002_021bc55c(player, idx - 1) != 0)
            return 1;
    }
    return 0;
}
