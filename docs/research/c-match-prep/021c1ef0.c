/* CAMPAIGN-PREP candidate for func_021c1ef0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :13 bitfield for +0x30; separate cf16c/cf1a4/cf1ac base reads; negated &&-chain; if-assign ladder
 *   risk:       VERIFIED near-exact: the sentinel-match early-out compiles inline (moveq;popeq) but orig branches to a shared .L_c0 join (bne); inline-vs-shared-tail layout flip = permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c1ef0 (ov002, class C) — MED tier.
 * UNVERIFIED build-free draft. Drop into src/, ninja+objdiff, tweak per risk.
 *   recipe:  decl-order r5=player,r4=idx,r6=self; bind (player&1)*0x868 once; if-assign ladder
 * func_021c1ef0(self, player, idx): a move/cell legality guard ladder.
 *   read cell flags[+0x30] low13 bitfield; 0 -> return 0
 *   cf1a4 u16[+0x38] == 0 -> return 1
 *   global cf16c[+0x5c0] != 0 -> return 1
 *   if idx<=4 and !(cf1ac[+0x40]>>6 & 1):
 *       v=021b9ecc(player,idx); if v!=K && v!=K+1 && v!=K+2 -> return 0
 *   v2 = 021c8940(player,idx)
 *   if v2==1: if 021bb068(C)!=0 return 0; return 021bae7c(1-self->f2b0, -1, ...)
 *   else:     return 021bae7c(1-self->f2b0, -1, ...)
 */

struct self_t { unsigned short pad0; unsigned short f2; };

/* +0x30 flags word: low 13 bits are a bitfield (read -> lsl#19;lsr#19). */
struct flags30_t { unsigned int f13 : 13; unsigned int hi : 19; };

extern char data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int  func_ov002_021b9ecc(int player, int idx);
extern int  func_ov002_021bae7c(int a, int b, int c);
extern int  func_ov002_021bb068(int code);
extern int  func_ov002_021c8940(int player, int idx);

int func_ov002_021c1ef0(struct self_t *self, int player, int idx)
{
    int base = (player & 1) * 0x868;
    int off  = idx * 0x14;
    int v;

    if (((struct flags30_t *)(data_ov002_022cf16c + base + off + 0x30))->f13 == 0)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + base + off) == 0)
        return 1;
    if (*(int *)(data_ov002_022ce288 + 0x5c0) != 0)
        return 1;

    if (idx <= 4) {
        if (((*(unsigned int *)(data_ov002_022cf1ac + base + off)) >> 6 & 1) == 0) {
            v = func_ov002_021b9ecc(player, idx);
            if (!(v != 0x1a90 && v != 0x1a90 + 1 && v != 0x1a90 + 2))
                return 0;
        }
    }

    if (func_ov002_021c8940(player, idx) == 1) {
        if (func_ov002_021bb068(0x1a90) != 0)
            return 0;
        return func_ov002_021bae7c(1 - (((unsigned int)self->f2 << 0x1f) >> 0x1f), -1, 0);
    }
    return func_ov002_021bae7c(1 - (((unsigned int)self->f2 << 0x1f) >> 0x1f), -1, 0);
}
