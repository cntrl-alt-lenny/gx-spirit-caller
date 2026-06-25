/* CAMPAIGN-PREP candidate for func_0203cbc0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     sequential cmp/predicated-return ladder (NOT switch); unsigned compares; tail call
 *   risk:       n must be unsigned for ls/cc (not le/lt); ladder must stay an if-chain, not collapse to a jump table; final tail-call returns func_0203de2c.
 *   confidence: high
 */
/* func_0203cbc0: classify func_0203c888()'s result via a sequential
 * cmp/predicated-return ladder; unmatched values tail-call func_0203de2c.
 * Unsigned compares (ls/cc) => the value is unsigned.
 */
extern unsigned int func_0203c888(void);
extern int func_0203de2c(void);

int func_0203cbc0(void)
{
    unsigned int n = func_0203c888();
    if (n <= 1)  return 0;
    if (n < 7)   return 1;
    if (n == 9)  return 4;
    if (n < 10)  return 2;
    if (n == 11) return 4;
    if (n < 16)  return 3;
    if (n == 16) return 5;
    if (n == 17) return 4;
    return func_0203de2c();
}
