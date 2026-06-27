/* CAMPAIGN-PREP candidate for func_020aaf40 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     first-byte fast diff; magic-mask word compare; ldrb unsigned; goto tail/bytewise
 *   risk:       control-flow has 5 exit points and reuses r2/r4 (loaded words) as the bytewise pointers after `sub r0,r0,#1`. The exact label fanout (.L_204/210/224/230) and the predicated `subs/movne` byte-diff idiom is very unlikely to match from structured C first build. permuter-class / may escape to .s; the magic-mask + align prologue can match but the loop+tail merge is the wall.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020aaf40 (main, class D) - brief p_0053.
 * UNVERIFIED build-free draft. Classic MSL word-at-a-time strcmp.
 *   recipe:     fast first-byte diff; magic-mask 0xfefefeff/0x80808080 word compare
 *   confidence: low (unrolled word loop is mwcc-version sensitive)
 */
/* strcmp(a=r0, b=r1) word-at-a-time. Returns *au - *bu at first diff, else 0. */

int func_020aaf40(const char *a, const char *b)
{
    int d = (unsigned char)*a - (unsigned char)*b;
    unsigned int c0;
    if (d != 0) return d;
    c0 = (unsigned char)*a;

    if ((((unsigned int)a ^ (unsigned int)b) & 3) == 0) {
        unsigned int al = (unsigned int)a & 3;
        if (al != 0) {
            if (c0 == 0) return 0;
            for (al = 3 - al; al != 0; al--) {
                d = (unsigned char)*++a - (unsigned char)*++b;
                if (d != 0) return d;
                if ((unsigned char)*a == 0) return 0;
            }
            a++; b++;
        }
        {
            const unsigned int *wa = (const unsigned int *)a;
            const unsigned int *wb = (const unsigned int *)b;
            unsigned int x = *wa, y;
            if (((x + 0xfefefeffU) & ~x & 0x80808080U) == 0) {
                y = *wb;
                if (x == y) {
                    do {
                        x = *++wa; y = *++wb;
                        if (((x + 0xfefefeffU) & 0x80808080U) != 0) goto tail;
                    } while (x == y);
                }
                a = (const char *)wa; b = (const char *)wb;
                if (x != y) goto bytewise;
                /* fallthrough to tail */
            } else {
                y = *wb; (void)y;
            }
        }
    tail:
        {
            int t = (unsigned char)*a - (unsigned char)*b;
            if (t != 0) return t;
        }
    }
bytewise:
    if ((unsigned char)*a == 0) return 0;
    do {
        d = (unsigned char)*++a - (unsigned char)*++b;
        if (d != 0) return d;
    } while ((unsigned char)*a != 0);
    return 0;
}
