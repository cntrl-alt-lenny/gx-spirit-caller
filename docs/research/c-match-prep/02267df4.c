/* CAMPAIGN-PREP candidate for func_02267df4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: switch returning constants -> mwcc cmp-tree + addpl jump-table (matches branch-table)
 *   risk:       struct-guessed + TRUNCATED: literal pool _LIT0..3 absent so case IDs/default are unknown; asm cut at .L_10c. Cannot byte-match until full disasm supplies the constants.
 *   confidence: low
 */
/* func_ov002_02267df4: ID -> reward-points lookup, returns constants
 * (0x64,0x1f4,0x2bc,0x384,0x3e8,0x7d0). The orig is a binary-search cmp tree
 * plus one `addpl pc,pc,r1,lsl#2` jump table over a contiguous 7-id run.
 * WARNING: the batch asm is TRUNCATED (cuts off at .L_10c) AND the literal
 * pool (_LIT0.._LIT3) is ABSENT, so the exact case IDs are UNKNOWN. BASE
 * below must be set to _LIT0 from the full disasm; the deltas are exact, the
 * tail cases (.L_114/.L_11c/.L_124/default) need the real disasm. SCAFFOLD. */

#define BASE 0 /* TODO: = _LIT0 (card-id base) from the literal pool */

int func_ov002_02267df4(int id) {
    switch (id) {
    case BASE - 0xaf: return 0x64;   /* .L_c4 */
    case BASE - 0x99: return 0x2bc;  /* .L_cc */
    case BASE - 0x78: return 0x7d0;  /* .L_bc */
    case BASE - 0x5:  return 0x3e8;  /* .L_d4 */
    case BASE:        return 0x1f4;  /* .L_dc */
    case BASE + 0x240:return 0x3e8;  /* .L_ec */
    /* contiguous jump-table run starting at (_LIT2 - 6): */
    /* .L_f4=0x1f4 .L_fc=0x384 .L_104=0x1f4 .L_10c=0x1f4 ...truncated */
    default: return 0;               /* .L_134 (value unverified) */
    }
}
