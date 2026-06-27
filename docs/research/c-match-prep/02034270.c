/* CAMPAIGN-PREP candidate for func_02034270 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: signed /32 and %32 -> mwcc asr/lsr/ror divmod magic
 *   risk:       Signed `%32`/`/32` codegen is the crux: mwcc must emit the exact asr#4;add lsr#27;asr#5 quotient and ror#27 remainder. If it picks a different signed-mod sequence the whole body diverges — permuter-class / may need .s. base+0x440 array index confirmed by sibling func_020342f0.
 *   confidence: low
 */
/* func_02034270: set or clear bit `idx` (r0, SIGNED) in a u32 bit-array based
 * at singleton+0x440. flag (r1) selects set vs clear. The orig does SIGNED
 * div/mod by 32: word = idx/32, bit = idx%32 (the asr#4;lsr#27;asr#5 and the
 * ror#27 sequences are mwcc's signed /32 and %32). singleton is func_02034184().
 */
extern int *func_02034184(void);

void func_02034270(int idx, int flag) {
    int *base = func_02034184();
    if (base == 0) return;
    {
        int word = idx / 32;          /* signed div by 32 */
        int bit  = idx % 32;          /* signed mod by 32 */
        unsigned int *arr = (unsigned int *)((char *)base + 0x440);
        if (flag != 0)
            arr[word] |=  (1u << bit);
        else
            arr[word] &= ~(1u << bit);
    }
}
