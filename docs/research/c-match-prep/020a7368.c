/* CAMPAIGN-PREP candidate for func_020a7368 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted do/while memcpy (ldrsb/strb), return dst
 *   risk:       return-dst forces mov ip,r0; if mwcc reuses r0 as cursor the save/copy reg-alloc flips (the brief-294 wall)
 *   confidence: med
 */
/* func_020a7368 (main, class A) — counted memcpy; source read as SIGNED
 * byte (ldrsb), dst written with strb. r0 saved to ip and used as the
 * write cursor, so r0 is preserved across the body -> returns dst.
 *   recipe: counted do/while copy, post-increment cursors, return dst
 */
void *func_020a7368(void *dst, const void *src, int n)
{
    char *d = (char *)dst;
    const signed char *s = (const signed char *)src;
    if (n != 0) {
        do {
            *d++ = (char)*s++;
        } while (--n);
    }
    return dst;
}
