/* CAMPAIGN-PREP candidate for func_0229cfa0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     string-copy loop, ptr-range guard, @-digit skip
 *   risk:       ldrsb sign on chars + r1+=2 skip path; resolve-guard mask 0xFFFE0000 from r2=0 must hold
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_0229cfa0 (ov002, class A).
 *   recipe:     resolve-if-id guard, then copy loop skipping '@'+digit pairs
 *   risk:       ldrsb signedness on each char; the '@'+digit skip (r1+=2)
 *               and the (src & 0xFFFE0000) resolve-guard ordering must hold
 *   confidence: med
 */
/* func_ov002_0229cfa0: dst-clear, then if src has no high bits it is an id
 * -> resolve via func_0202b7cc; copy bytes from src to dst, dropping any
 * '@' immediately followed by a decimal digit (a 2-char control escape). */

extern char *func_0202b7cc(int id);

void func_ov002_0229cfa0(char *dst, const char *src) {
    signed char c;
    *dst = 0;
    if (((int)src & 0xFFFE0000) == 0)
        src = func_0202b7cc((int)src);
    if (src == 0)
        return;
    c = *(const signed char *)src;
    if (c == 0) { *dst = 0; return; }
    do {
        if (c == '@') {
            signed char d = ((const signed char *)src)[1];
            if (d >= '0' && d <= '9') {
                src += 2;
                goto next;
            }
        }
        c = *(const signed char *)src;
        src++;
        *dst = c;
        dst++;
    next:
        c = *(const signed char *)src;
    } while (c != 0);
    *dst = 0;
}
