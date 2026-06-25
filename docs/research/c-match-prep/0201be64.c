/* CAMPAIGN-PREP candidate for func_0201be64 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard (==2) + bit-extract-to-bool via shift pair (lsl#7;lsrs#0x1f)
 *   risk:       func_020139b4 arg passing incidental (r0=leftover ptr); +0x900 offset and bit-24 test guessed.
 *   confidence: med
 */
/* func_0201be64: leaf predicate.
 *   p = GetSystemWork() (saved r4); n = func_020139b4();
 *   if (n != 2) return 0;
 *   x = *(int*)(p+0x900); bit = (x<<7)>>31  (bit 24, 0x01000000);
 *   if (bit == 0) return 1;
 *   return 0;
 */

extern char *GetSystemWork(void);
extern int func_020139b4(void);

int func_0201be64(void) {
    char *p = GetSystemWork();
    if (func_020139b4() == 2) {
        if ((*(int *)(p + 0x900) << 7) >> 31 == 0) {
            return 1;
        }
    }
    return 0;
}
