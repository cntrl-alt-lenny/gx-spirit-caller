/* CAMPAIGN-PREP candidate for func_02286a20 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldmia loads a,b together (struct first two ints); mul idx*0x14 + mla per-player base; ldrh slot+0; chained guard returns
 *   risk:       VERIFIED EXACT mwcc 2.0/sp1p5 (byte-identical modulo cf1a2/cf1a2 pool relocs; ip/lr/mla allocation all match). struct-guessed: cd3f4 layout (a/b at +0/+4 from ldmia, idxA/idxB at +0x1c/+0x20) and cf1a2 slot stride 0x14 inferred -- confirm vs real structs.
 *   confidence: high
 */
typedef unsigned short u16;
/* cd3f4 control block: a@+0, b@+4, idxA@+0x1c, idxB@+0x20. */
struct ctrl { int a; int b; char _p8[0x14]; int idxA; int idxB; };
extern struct ctrl data_ov002_022cd3f4;
/* cf1a2 per-player 0x868 table; 0x14-byte slots, u16 at slot+0. */
extern char data_ov002_022cf1a2[];

int func_ov002_02286a20(void) {
    if (data_ov002_022cd3f4.a == data_ov002_022cd3f4.b)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + (data_ov002_022cd3f4.a & 1) * 0x868 +
                 data_ov002_022cd3f4.idxA * 0x14) != 0)
        return 0;
    if (*(u16 *)(data_ov002_022cf1a2 + (data_ov002_022cd3f4.b & 1) * 0x868 +
                 data_ov002_022cd3f4.idxB * 0x14) != 0)
        return 0;
    return 1;
}
