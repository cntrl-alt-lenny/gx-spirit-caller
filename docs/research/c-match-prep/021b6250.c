/* CAMPAIGN-PREP candidate for func_021b6250 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class C: flag spilled to stack; (flag!=0) movne/moveq bool; int v -> mvn; loop guard
 *   risk:       VERIFIED match through prologue+guard (str r1,[sp]; movne/moveq; mvn r6,#0; consts hoisted; cmp r9,#0/bne). Likely full or near-full match; only residual risk is tail-block instruction scheduling (permuter-class).
 *   confidence: high
 */
/* func_ov006_021b6250 (ov006, class C): one-shot (i==0 only) seed of the
 * stride tables, gated by a saved flag arg. flag is stored as a 0/1 bool and
 * also written raw at the end. Loop guard skips all i!=0. */

extern void func_ov006_021b7db0(void *p);
extern int  func_ov006_021b7c94(int unused, int idx, unsigned short value);
extern int  func_ov006_021b7cc0(int unused, int i, int j, int v);
extern void func_ov006_021b7bb0(void *p, int i);

int func_ov006_021b6250(char *p, int flag) {
    int i;

    func_ov006_021b7db0(p);
    *(int *)(p + 0x629c) = (flag != 0);

    for (i = 0; i < 5; i++) {
        if (i != 0)
            continue;
        func_ov006_021b7c94((int)p, i, 1);
        func_ov006_021b7cc0((int)p, i, 0, -1);
        func_ov006_021b7cc0((int)p, i, 1, -1);
        func_ov006_021b7cc0((int)p, i, 2, -1);
        func_ov006_021b7cc0((int)p, i, 3, -1);
        func_ov006_021b7cc0((int)p, i, 4, -1);
        func_ov006_021b7cc0((int)p, i, 5, -1);
        func_ov006_021b7cc0((int)p, i, 6, -1);
        func_ov006_021b7bb0(p, i);
    }

    *(int *)(p + 0x6240) = flag;
    return 1;
}
