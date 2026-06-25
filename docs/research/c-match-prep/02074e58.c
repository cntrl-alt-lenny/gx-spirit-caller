/* CAMPAIGN-PREP candidate for func_02074e58 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard early-returns, branch-tail, call sequence
 *   risk:       two func_02075394 tails may be cross-jumped by mwcc; field_c reload vs bind; block order of else-branch
 *   confidence: med
 */
extern int func_02074ef4(void *a);
extern void func_02075394(void *a);
extern int func_020754f4(void *a);
extern int func_02075928(void *a);
extern void func_0207655c(int a);

struct S02074e58 {
    char pad_c[0xc];
    int field_c;                    /* +0xc */
};

int func_02074e58(struct S02074e58 *p)
{
    if (func_02075928(p) != 1)
        return 1;

    if (func_020754f4(p) != 0) {
        func_0207655c(p->field_c);
        func_02075394(p);
        if (func_02074ef4(p) != 0)
            return 1;
        return 0;
    }

    if (func_02075928(p) != 5)
        return 1;
    if (func_02074ef4(p) != 0)
        return 1;
    func_02075394(p);
    return 0;
}
