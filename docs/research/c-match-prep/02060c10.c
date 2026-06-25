/* CAMPAIGN-PREP candidate for func_02060c10 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted byte scan for literal sequence, signed-char loads
 *   risk:       window bound (len-6) and signed ldrsb compares fixed by asm; mwcc may unroll the 7 compares differently
 *   confidence: high
 */
/* func_02060c10: scan a buffer of length n for the 7-byte literal sequence
 * "\\final\\" (5c 66 69 6e 61 6c 5c). Walks p from start while
 * (p - start) < n - 6, comparing the 7 bytes with SIGNED char loads.
 * Returns the matching pointer, or NULL.
 *
 *   r2 = n - 6; if (r2 <= 0) return 0;
 *   for (p=start; ; p++){ if (p[0]=='\\' && p[1]=='f' && p[2]=='i' &&
 *       p[3]=='n' && p[4]=='a' && p[5]=='l' && p[6]=='\\') return p;
 *       if ((p+1 - start) >= r2) break; }
 *   return 0;
 */
char *func_02060c10(char *start, int n) {
    signed char *p = (signed char *)start;
    int limit = n - 6;

    if (limit > 0) {
        do {
            if (p[0] == 0x5c && p[1] == 0x66 && p[2] == 0x69 &&
                p[3] == 0x6e && p[4] == 0x61 && p[5] == 0x6c && p[6] == 0x5c) {
                return (char *)p;
            }
            p++;
        } while (((int)((char *)p - start)) < limit);
    }
    return 0;
}
