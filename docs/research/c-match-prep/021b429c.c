/* CAMPAIGN-PREP candidate for func_021b429c (ov015, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     MMIO key flag dispatch; nested if/return chain; reload G fields
 *   risk:       permuter-class: heavy conditional-ldm tail (ldmeqia/ldmneia) — mwcc must fold each early return into a predicated pop; return-value r0 left unset on several paths (orig returns stale r0). Branch ordering may reschedule. struct-guessed offsets.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov015_021b429c (ov015, class D) — brief 494.
 * UNVERIFIED build-free draft. recipe: KEYINPUT (data_02104bac +0x54/+0x56)
 * flag dispatch; G=data_ov015_021b5e44, mode gate at G[0x898]. Many early
 * returns; nested if/else with returns preserves the ldmne tail order.
 */
extern int  data_ov015_021b5e28[];   /* +0x898 active-flag                  */
extern int  data_ov015_021b5e44[];   /* G: byte-offset word struct          */
extern unsigned short data_02104bac[]; /* KEYINPUT block, +0x54 hi, +0x56 lo */
extern int  func_ov005_021ab108(void *p, int one);
extern void func_ov005_021aca30(int a, int b);
extern void func_ov005_021aca64(int a, int b);
extern int  func_ov015_021b34a4(void *p);
extern int  func_ov015_021b34cc(void *p);

#define G8(off)  (*(int *)((char *)data_ov015_021b5e44 + (off)))
#define KEY(off) (*(unsigned short *)((char *)data_02104bac + (off)))

int func_ov015_021b429c(void) {
    int r0;
    unsigned short k;

    if (*(int *)((char *)data_ov015_021b5e28 + 0x898) == 0) {
        if (KEY(0x54) & 0x2)
            G8(0xa84) = G8(0xa84) | 0x4;
        return r0;
    }

    if (G8(0x8e8) == 1 && *(int *)((char *)G8(0x878) + 0x54) != 0)
        return r0;

    k = KEY(0x54);
    if (k & 0x2) { G8(0xa84) = G8(0xa84) | 0x4; return r0; }
    if (k & 0x1) { G8(0xa84) = G8(0xa84) | 0x8; return r0; }

    k = KEY(0x56);
    if (k & 0x40) {
        if (G8(0x8dc) >= 0) {
            if (func_ov015_021b34a4((char *)data_ov015_021b5e44 + 0x880) != 0)
                return r0;
            func_ov005_021aca30(G8(0x878), 0x8000);
            return r0;
        }
    }
    if (k & 0x80) {
        int n = G8(0x8dc);
        if (n < func_ov005_021ab108((void *)G8(0x874), 1) - 1) {
            if (func_ov015_021b34cc((char *)data_ov015_021b5e44 + 0x880) != 0)
                return r0;
            func_ov005_021aca64(G8(0x878), 0x8000);
        }
    }
    return r0;
}
