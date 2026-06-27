/* CAMPAIGN-PREP candidate for func_021c2eac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if(count!=0){loop} shares zero tail; base held in blk; bound *(blk+0x14) reloaded each iter (kept inline)
 *   risk:       VERIFIED matches incl base-held + per-iter bound reload + shared zero tail; ONLY residual: pre-check emits cmp;beq, orig emits cmp;bls (same effect, different cc byte) — 1-instr permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2eac (ov002, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 *   recipe:  parity*0x868 base held in r7; forward scan arr[+0x418]; bound *(blk+0x14) RELOADED each iter
 * func_021c2eac(player, arg1): forward scan player's elem array; first i with
 *   021b91f8(&elem[i], arg1)!=0 -> return i+1; else 0. Pre-check count(cf180)!=0;
 *   loop bound re-read from blk[+0x14] every iteration (unsigned compare).
 */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_ov002_021b91f8(int *elem, int arg1);

int func_ov002_021c2eac(int player, int arg1)
{
    int base = (player & 1) * 0x868;
    char *blk = data_ov002_022cf16c + base;
    int *elem;
    int i = 0;

    if (*(unsigned int *)(data_ov002_022cf180 + base) != 0) {
        elem = (int *)(blk + 0x418);
        do {
            if (func_ov002_021b91f8(elem, arg1) != 0)
                return i + 1;
            i++;
            elem++;
        } while ((unsigned int)i < *(unsigned int *)(blk + 0x14));
    }

    return 0;
}
