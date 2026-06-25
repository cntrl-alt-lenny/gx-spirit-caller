/* CAMPAIGN-PREP candidate for func_021cbe8c (ov003, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     DISPATCH switch (cmp/beq chain) + conditional-store + early-return tail
 *   risk:       mwcc could emit a jump table instead of the cmp/beq chain for 0/1/2; otherwise movne/streq conditional stores should match
 *   confidence: med
 */
/* func_ov003_021cbe8c: 3-state machine on *s. 0: advance to 1 if 021cbf08 fires.
 * 1: advance to 2 if poll done or 021cc0d8 fires. 2: report 1 if 021cc010 fires. */
extern int func_ov003_021cbf08(void);
extern int func_ov003_021ceeb4(void);
extern int func_ov003_021cc010(void);
extern int func_ov003_021cc0d8(int *s);

int func_ov003_021cbe8c(int *s) {
    switch (*s) {
    case 0:
        if (func_ov003_021cbf08() != 0)
            *s = 1;
        break;
    case 1:
        if (func_ov003_021ceeb4() == 0)
            *s = 2;
        if (func_ov003_021cc0d8(s) != 0)
            *s = 2;
        break;
    case 2:
        if (func_ov003_021cc010() != 0)
            return 1;
        break;
    }
    return 0;
}
