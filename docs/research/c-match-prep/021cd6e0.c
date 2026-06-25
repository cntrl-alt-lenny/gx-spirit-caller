/* CAMPAIGN-PREP candidate for func_021cd6e0 (ov011, class D) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR + mla row-index (idx*0x14) + scaled ldr
 *   risk:       mwcc may compute (arg1-1) into a reg then ldr [r0,r1,lsl#2] vs a different fold; row mla ordering stable. Offset 0x14/struct shape inferred from asm.
 *   confidence: high
 */
/* func_ov011_021cd6e0: 2D table accessor. Rows of 0x14 (5 ints) at
 * data_021d31d8; returns table[arg0-1][arg1-1] as int. The (arg0-1)*0x14
 * row stride fuses to mla; (arg1-1) indexes by <<2 in the ldr. */
extern unsigned char data_ov011_021d31d8[];

int func_ov011_021cd6e0(int arg0, int arg1) {
    int *row = (int *)(data_ov011_021d31d8 + (arg0 - 1) * 0x14);
    return row[arg1 - 1];
}
