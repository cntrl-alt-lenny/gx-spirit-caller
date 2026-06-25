/* CAMPAIGN-PREP candidate for func_02077094 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     strchr-style scan loop (ldrsb signed char), b-into-test
 *   risk:       loop entered via mid-test (b .L_c) — mwcc may emit pre-test header differently; order of '.' vs NUL compares
 *   confidence: med
 */
int func_02077094(const char *s)
{
    const char *p = s;

    while (*p != '.' && *p != '\0')
        p++;

    return (int)(p - s);
}
