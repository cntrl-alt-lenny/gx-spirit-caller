/* CAMPAIGN-PREP candidate for func_021c24f8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 unsigned bitfield (lsl#19;lsrs#19 confirmed); single struct ptr stride 0x14; u16 short-circuit
 *   risk:       VERIFIED bitfield gate now exact; residual: orig keeps TWO walking ptrs (base + base+0x30, both +=0x14) vs my one ptr+imm offsets — strength-reduction/induction-var coin-flip, permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c24f8 (ov002, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 *   recipe:  :13 bitfield (forces lsl;lsr, not tst-mask); mla base; 11-iter loop; u16 gate
 * func_021c24f8(player): sum over 11 cells of 021b9e00(player,i) where
 *   cell.flags13[+0x30] (low 13 bits) != 0 AND cell.u16[+0x38] != 0.
 *   The :13 bitfield read is what produces the original's lsl#19;lsr#19 pair
 *   (a raw mask/shift folds to a single tst against 0x1fff — wrong encoding).
 */

struct cell_t {
    unsigned int   f30_13 : 13; /* +0x30 low 13 bits -> lsl#19;lsr#19 */
    unsigned int   f30_hi : 19;
    int            f34;         /* +0x34 */
    unsigned short f38;         /* +0x38 */
};

extern char data_ov002_022cf16c[];
extern int  func_ov002_021b9e00(int player, int idx);

int func_ov002_021c24f8(int player)
{
    struct cell_t *cell = (struct cell_t *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
    int total = 0;
    int i = 0;

    do {
        if (cell->f30_13 != 0 && cell->f38 != 0)
            total += func_ov002_021b9e00(player, i);
        i++;
        cell = (struct cell_t *)((char *)cell + 0x14);
    } while (i <= 10);

    return total;
}
