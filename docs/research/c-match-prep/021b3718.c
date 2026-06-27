/* CAMPAIGN-PREP candidate for func_021b3718 (ov015, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: signed-char scan; hoist both bases; if(d)*d++=c cond store; 2-byte token path
 *   risk:       reshape-able/permuter-class: the two identical else-arms (`cmp r6,#0; strneb r1,[r6],#1`) come from `if(d)*d++=c` - mwcc may merge/duplicate them differently. g_104f4c held in r7, g_105989 in r8 across the loop; if mwcc reloads, ldr count diverges. f4 :3 read each iter.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov015_021b3718 (ov015, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: CLASS D: signed char (ldrsb) scan; hoist g_104f4c & g_105989 bases out of loop (held in r7/r8); store-order strb dst then advance; cond byte-store via if(dst)*dst++=c.
 */
/* func_ov015_021b3718: copy a control string src(r5) to dst(r6), returning the
 * output length(r4). When a 3-bit mode field of g_104f4c is 0 and the char has
 * bit7 set, copy the char + its successor (2-byte token). '^p' triggers a
 * width measure (020a6a00 g_105989) + insert (020a6afc). dst may be NULL
 * (measure-only). */

extern int func_020a6a00(const signed char *s);          /* token width */
extern int func_020a6afc(signed char *dst, const signed char *s);

typedef struct { unsigned int f4 : 3; unsigned int : 29; } G104f4c;
extern G104f4c data_02104f4c;                 /* _LIT1 (held in r7) */
extern signed char data_02105989[];           /* _LIT0 (held in r8) */

int func_ov015_021b3718(signed char *dst, signed char *src)
{
    signed char *d = dst;
    signed char *s = src;
    int n = 0;
    signed char c = *s;
    if (c != 0) {
        do {
            if (data_02104f4c.f4 == 0 && (c & 0x80)) {
                if (d != 0) {
                    d[0] = c;
                    d[1] = s[1];
                    d += 2;
                }
                s += 2;
                n += 2;
            } else if (c == 0x5e /* '^' */) {
                if (s[1] == 0x70 /* 'p' */) {
                    int w = func_020a6a00(data_02105989);
                    if (d != 0) {
                        func_020a6afc(d, data_02105989);
                        d += w;
                    }
                    n += w;
                    s += 2;
                } else {
                    if (d != 0) *d++ = c;
                    s += 1;
                    n += 1;
                }
            } else {
                if (d != 0) *d++ = c;
                s += 1;
                n += 1;
            }
            c = *s;
        } while (c != 0);
    }
    return n;
}
