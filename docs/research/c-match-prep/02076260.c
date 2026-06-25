/* CAMPAIGN-PREP candidate for func_02076260 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     pre-decrement carry-propagate increment loop
 *   risk:       ands;strb;bxne ordering — mwcc may emit cmp instead of reusing ands flags; pre-dec [r0,#-1]! form
 *   confidence: med
 */
void func_02076260(unsigned char *p)
{
    int n = 8;

    do {
        unsigned char v = (unsigned char)(*--p + 1);
        *p = v;
        if (v != 0)
            return;
    } while (--n != 0);
}
