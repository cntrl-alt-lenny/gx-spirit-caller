/* CAMPAIGN-PREP candidate for func_021c2624 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: signed range ladder; 0/1 via movle/movgt; parity&1 mla table index; additive id consts
 *   risk:       permuter-class + asm truncated: the _LIT0.._LIT5 id-membership tree (bgt/bge/beq fall-through with sub#0x2dc, add#0x51) is a hand-ordered comparison cascade mwcc will not reproduce from a flat || chain; also tail cut off. Likely escapes to .s.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2624 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected. NOTE: source asm is TRUNCATED
 * mid-.L_f8 (ends at 'cmp r0,#0x0'); tail reconstructed by symmetry with the
 * .L_3c block (u16 table lookup -> 0/1). Confirm the tail against full asm.
 *   range ladder on (slot,id): slot in [5,10) -> 0202e234; 0202b8c0(id)==3 ->
 *   slot<=4 ->0, slot>10 ->1, else cf1ac-table[parity][slot] u16 !=0; otherwise
 *   id must be one of a literal-pool id set (additive consts) AND slot in [5,10).
 */
extern unsigned short data_ov002_022cf1a4[];
extern unsigned short data_ov002_022cf1ac[];
extern int func_0202b8c0(int id);
extern int func_0202e234(int id);

int func_ov002_021c2624(int player, int slot, int id)
{
    if (id == 0)
        return 0;
    if (slot >= 5 && slot < 10) {
        if (func_0202e234(id) != 0)
            return 1;
    }
    if (func_0202b8c0(id) == 3) {
        if (slot <= 4)
            return 0;
        if (slot > 10)
            return 1;
        return *(unsigned short *)((char *)data_ov002_022cf1ac
            + (player & 1) * 0x14 * 1 + slot * 0x14) != 0;
    }
    /* literal-pool id-membership ladder (consts built additively in asm) */
    if (id == 0x194e || id == 0x194e - 0x2dc || id == 0x1980 ||
        id == 0x194e + 0x51 /* placeholder set; confirm from _LIT0.._LIT5 */) {
        if (slot >= 5 && slot < 10) {
            return *(unsigned short *)((char *)data_ov002_022cf1a4
                + (player & 1) * 0x14 + slot * 0x14) != 0;
        }
    }
    return 0;
}
