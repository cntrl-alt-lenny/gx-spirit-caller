/* CAMPAIGN-PREP candidate for func_02029b6c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     u16-cast args = lsl16/lsr16; signed idx drives branch; count-reloaded loop
 *   risk:       permuter-class: r4/r5/r6 hold a/b/c and get RE-SHUFFLED via lsl/lsr movs into the same regs in the loop arm; this register-renaming dance is scheduling/alloc-driven, unlikely to fall out of straight C.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02029b6c (main, class C) — brief p_0010.
 * UNVERIFIED build-free draft. Drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     s16 sign-extend via lsl16/lsr16 = u16 cast of args; r3 sign drives branch (movs/bpl); two loops
 *   risk:       the lsl#0x10/lsr#0x10 pairs come from u16 args; reg-alloc of r4..r6 across the two arms
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef signed short s16;

extern void func_0201e7ec(void *obj, int a);
extern void func_0201e800(void *obj, int a);

typedef struct Obj29b6c {
    char  _pad0[0x79];
    u8    f79;            /* 0x79 loop count (signed compared) */
} Obj29b6c;

/* r0=self, r1=a, r2=b, r3=idx(signed), [sp,#0x28]=c (5th arg, u16) */
int func_02029b6c(char *self, int a, int b, int idx, int c) {
    char *base = self + 0x98;
    signed char cnt;

    if (idx < 0) {                      /* movs r4,r3; bpl .L_52c => taken when >=0 */
        cnt = (signed char)self[0x79];
        if (cnt > 0) {
            u16 c16 = (u16)c;           /* r1<<16>>16 */
            u16 a16 = (u16)a;
            u16 b16 = (u16)b;
            int i;
            for (i = 0; i < cnt; i++) {
                void *obj = ((void **)(base + i * 4))[0x8 / 4];
                func_0201e800(obj, c16);
                func_0201e7ec(obj, 1);
                *(u16 *)(base + i * 2 + 0x70) = a16;
                *(u16 *)(base + i * 2 + 0xa0) = b16;
                cnt = (signed char)self[0x79];
            }
        }
    } else {
        void *obj = ((void **)(base + idx * 4))[0x8 / 4];
        func_0201e800(obj, (u16)c);
        func_0201e7ec(obj, 1);
        *(u16 *)(base + idx * 2 + 0x70) = (u16)a;
        *(u16 *)(base + idx * 2 + 0xa0) = (u16)b;
    }
    return 1;
}
