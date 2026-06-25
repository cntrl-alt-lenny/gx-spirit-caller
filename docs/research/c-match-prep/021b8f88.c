/* CAMPAIGN-PREP candidate for func_021b8f88 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ACCESSOR + bounds guard; predicated cond-moves
 *   risk:       mwcc may branch instead of predicating (movge/ldrlt); the i*2 scale could fold into the load differently.
 *   confidence: high
 */
/* func_ov006_021b8f88: bounds-checked u16 accessor. n = *(int*)(base+0xca94);
 * if (i >= n) return 0; else { arr = *(u16**)(base+0xca90); return arr[i]; }.
 * The +0xc000 base is split off once (rot-8) and reused for both 12-bit
 * offsets 0xa94/0xa90. The whole select is predicated (movge #0 vs
 * ldrlt/movlt/ldrlth), so an if/else with an early 0 reproduces it. */

unsigned short func_ov006_021b8f88(char *base, int i) {
    int n = *(int *)(base + 0xca94);
    if (i >= n)
        return 0;
    return ((unsigned short **)(base + 0xca90))[0][i];
}
