/* CAMPAIGN-PREP candidate for func_0207651c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear call sequence then status store
 *   risk:       func_02076870 takes field_81c as 3rd arg (r2) while r1 unset — arg signature guessed; r2=[r4,#0x81c] loaded before call
 *   confidence: med
 */
extern void func_0207655c(void *a);
extern void func_02076764(void *a);
extern void func_02076870(void *a, int dummy, int v);
extern void func_02077c08(void *a, int b, int c);

struct S0207651c {
    char pad81c[0x81c];
    int field_81c;                  /* +0x81c */
    char pad455[0x455 - 0x820];
    unsigned char status;           /* +0x455 (note: precedes 0x81c in mem) */
};

void func_0207651c(char *p)
{
    func_02076870(p, 0, *(int *)(p + 0x81c));
    func_02076764(p);
    func_02077c08(p, 0, 0);
    func_0207655c(p);
    *(unsigned char *)(p + 0x455) = 5;
}
