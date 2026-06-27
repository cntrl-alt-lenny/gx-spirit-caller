/* CAMPAIGN-PREP candidate for func_021aa5b8 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order/sign-extend; blocked: asm truncated mid-switch
 *   risk:       struct-guessed + TRUNCATED: body cut off inside .L_204 arm; switch arms .L_270/.L_2d8, the data_020bef80 LUT-index math tail and epilogue are absent, so no byte-exact C is possible until re-extraction.
 *   confidence: low
 */
/* func_ov000_021aa5b8 (ov000, D) -- PARTIAL: the batch asm is TRUNCATED.
 * The JSON body ends mid-function inside the .L_204 switch arm (last insn
 * `str r1,[r0,#0x2c]`, no epilogue, switch targets .L_270/.L_2d8 bodies and
 * the bx lr are all missing). NOT byte-reproducible until re-extracted.
 *
 * Reconstructed prefix (verified against neighbours func_ov000_021aa7e0 /
 * _021aa840, which share the same struct):
 *   obj = *data_ov000_021c73e0 (struct Ov000ObjF*).
 *   r1 = obj->facing (+0x140, signed :4). if (facing==4) early-return.
 *   r3 = (*data_ov000_021c73e0) again; t = r3->facing.
 *   if (t==1||t==2||t==3) read shorts at r3+0x100+{0x2c,0x2e,0x30} and NEGATE
 *     the first two (rsb), else read them straight.
 *   each short -> sign-extend(<<16>>16), >>4, *2+1, *2 byte-index into
 *   _LIT1 = data_020bef80 (the sin/cos LUT) via ldrsh -> 6 table samples.
 *   then `cmp facing,#3; addls pc,pc,facing<<2` 4-way jump building a matrix:
 *   .L_204 arm multiplies samples by (obj[0x120] (fixed-point) >> 12) and
 *   stores to obj+0x24/0x28/0x2c ... (remaining arms + pool cut off).
 * DO NOT BUILD AS-IS -- re-extract the full disassembly first. */
extern unsigned char data_020bef80[]; /* sin/cos LUT (_LIT1) */
struct Ov000ObjF {
    char pad[318];          /* +0x000 */
    unsigned short status;  /* +0x13e */
    int facing : 4;         /* +0x140 */
};
extern struct Ov000ObjF *data_ov000_021c73e0;
extern void *data_ov000_021c73e0_LIT1;
/* INCOMPLETE -- full reconstruction blocked on truncated asm. */
