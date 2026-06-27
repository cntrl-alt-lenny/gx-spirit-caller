/* CAMPAIGN-PREP candidate for func_021ad5e4 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     raw logical shift-pairs for each bitfield extract (overlapping fields); ==1 flag as bool; stack struct as local[2]
 *   risk:       permuter-class: orig RELOADS word0 (ldr r0 thrice) and computes the ==1 flag mid-sequence (moveq r1) before loading word1; mwcc may CSE w0 into one reg and reorder the flag/arg evaluation, shifting reg-alloc.
 *   confidence: low
 */
/* func_ov000_021ad5e4: extract two 9-bit fields from *p (word0), each <<12 into
 * a 2-word stack struct; extract a 4-bit field (bits3..6) of word0 and test ==1;
 * extract an 8-bit field (bits16..23) of word1 (*(p+4)); then call the object
 * builder with (w1field, flag, 0, 0x10, &local, 1); return 0.
 *
 *   ldr r2,[r0]; r2<<0x10; r2>>0x17; r2<<0xc; str [sp,#0x8]   ; bits7..15 (<<12)
 *   ldr r2,[r0]; r2<<0x7;  r2>>0x17; r2<<0xc; str [sp,#0xc]   ; bits16..24 (<<12)
 *   ldr r2,[r0]; r2<<0x19; r2>>0x1c; cmp r2,#1; moveq r1,#1   ; bits3..6 == 1
 *   ldr r0,[r0,#0x4]; r0<<0x8; r0>>0x18                       ; word1 bits16..23
 *   r2=0; r3=0x10; [sp]=&local; [sp+4]=1; bl func_ov000_021ad540; return 0
 */

extern int func_ov000_021ad540(int idx, int a1, int a2, int a3, void *a4, int a5);

int func_ov000_021ad5e4(unsigned int *p) {
    int local[2];
    unsigned int w0 = *p;
    local[0] = ((w0 << 0x10) >> 0x17) << 0xc;
    local[1] = ((w0 << 0x07) >> 0x17) << 0xc;
    func_ov000_021ad540(((unsigned int)p[1] << 8) >> 0x18,
                        ((w0 << 0x19) >> 0x1c) == 1,
                        0, 0x10, local, 1);
    return 0;
}
