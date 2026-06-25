/* CAMPAIGN-PREP candidate for func_0203db24 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     two-call guard, mvn-compare (==-0x27), predicated returns
 *   risk:       -0x27 must form via mvn #0x26 (signed int compare); the two return-1 paths (e==0, e==-0x27) must merge as beq .L478 / fallthrough; reg-alloc on e.
 *   confidence: high
 */
/* func_0203db24: if func_0206df90()!=0 return 0; else e=func_0206e7b0();
 * return 1 when e==0 or e==-0x27 (mvn #0x26), otherwise 0.
 */
extern int func_0206df90(void);
extern int func_0206e7b0(void);

int func_0203db24(void)
{
    int e;
    if (func_0206df90() != 0) return 0;
    e = func_0206e7b0();
    if (e == 0) return 1;
    if (e != -0x27) return 0;
    return 1;
}
