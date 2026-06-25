/* CAMPAIGN-PREP candidate for func_020a6a28 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed char (ldrsb) loads; s[i+j] fresh index not walking ptr; inner while-precondition
 *   risk:       permuter-class: the `mov lr,r3; b .L_4c` mid-loop entry and r3 dedicated-zero for j-reset; mwcc's loop-rotation / where it places the inner pre-test branch is a scheduling coin-flip a C reshape won't pin.
 *   confidence: low
 */
/* func_020a6a28 — strstr: first occurrence of pat in s, returns s+i or 0.
 *
 *   if (s[0] == 0) return 0;
 *   i = 0;
 *   do {
 *       j = 0;
 *       while ((c = pat[j]) != 0) {
 *           if (s[i + j] != c) break;
 *           j++;
 *       }
 *       if (c == 0) return s + i;       // whole pattern matched
 *       i++;
 *   } while (s[i] != 0);
 *   return 0;
 *
 * All char reads are ldrsb -> signed char. r4=i, lr=j, ip=c, r2=temp;
 * r3 holds the inner-start constant 0 (j reset each outer pass). The
 * `mov lr,r3; b .L_4c` is the while-precondition entry.
 */

signed char *func_020a6a28(signed char *s, signed char *pat) {
    int i;
    int j;
    signed char c;

    if (s[0] == 0) return 0;

    i = 0;
    do {
        j = 0;
        while ((c = pat[j]) != 0) {
            if (s[i + j] != c) break;
            j++;
        }
        if (c == 0) {
            return s + i;
        }
        i++;
    } while (s[i] != 0);

    return 0;
}
