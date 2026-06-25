/* CAMPAIGN-PREP candidate for func_02074938 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain; reload-after-call; conditional-diff return; sentinel tail
 *   risk:       mwcc predicated-return (ldrne/subne/bxne) block layout and the w824 re-test at .L_238 likely diverge -> permuter-class
 *   confidence: low
 */
/* func_02074938: status/diff query over a sub-object.
 * If either gate (w824, b456) is clear, run func_020749d4(owner) first
 * (it may mutate the sub-object, so the fields are re-read afterwards).
 * Then: active && armed -> return w828 - w82c; active && !armed -> 0;
 * inactive -> -1 unless (owner.b8==4 && sub.b455!=9) which yields 0.
 */
typedef struct Sub {
    unsigned char _p455[0x455];
    unsigned char b455;                 /* 0x455 */
    unsigned char b456;                 /* 0x456 */
    unsigned char _p457[0x824 - 0x457];
    int w824;                           /* 0x824 */
    int w828;                           /* 0x828 */
    int w82c;                           /* 0x82c */
} Sub;

typedef struct Owner {
    char _p0[0x8];
    unsigned char b8;                   /* 0x8 */
    char _p9[0xc - 0x9];
    Sub *sub;                           /* 0xc */
} Owner;

extern void func_020749d4(Owner *owner);

int func_02074938(Owner *owner) {
    Sub *sub = owner->sub;

    if (sub->w824 == 0 || sub->b456 == 0)
        func_020749d4(owner);

    if (sub->w824 != 0) {
        if (sub->b456 != 0)
            return sub->w828 - sub->w82c;
        return 0;
    }

    if (owner->b8 == 4 && sub->b455 != 9)
        return 0;
    return -1;
}
