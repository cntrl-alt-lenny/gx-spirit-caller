/* CAMPAIGN-PREP candidate for func_021b9d58 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     TAIL wrapper; addr-of local + stack 5th arg; predicated mvnge
 *   risk:       5-arg stack layout / {r3,lr} push and sub sp,#8 framing may differ; first-arg-unused assumption.
 *   confidence: med
 */
/* func_ov006_021b9d58: thin wrapper around a 5-arg search helper. Stores the
 * key into a stack local and passes its address; the 5th arg (a comparator
 * func ptr) goes on the stack. r0 = func_020059b0(&local, data_..21cb3d4,
 * 0x1c, 4, func_..21b9d98); if (r0 >= 0x1c) r0 = -1 (mvnge). The first
 * parameter (r0 on entry) is unused. */

extern int func_020059b0(void *key, void *base, int count, int width,
                         int (*cmp)(void *, void *));
extern int func_ov006_021b9d98(void *a, void *b);
extern char data_ov006_021cb3d4[];

int func_ov006_021b9d58(int unused, int key) {
    int local = key;
    int r = func_020059b0(&local, data_ov006_021cb3d4, 0x1c, 4, func_ov006_021b9d98);
    if (r >= 0x1c)
        r = -1;
    return r;
}
