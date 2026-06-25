/* CAMPAIGN-PREP candidate for func_02038b94 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ldmia pair via 2-field struct; lsr#0x18&1 discriminant; (v<<8)>>8 mask; bind r6 across uses
 *   risk:       struct-guessed: sp+0x34 block size (0x48?) and a-struct layout inferred; frame is 0x7c so buf/struct extents and field offsets (8/1c/4) must match real structs or stack slot order shifts
 *   confidence: low
 */
#include <stdio.h>

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef int s32;

struct A_2098 {
    u8 _pad0[0x4];
    u32 field_4;       /* +0x4 -> r1 to func_02038ad4 */
    u32 field_8;       /* +0x8 -> fallback r6 */
    u8 _pad0c[0x1c - 0xc];
    u32 field_1c;      /* +0x1c: lsr#0x18 tst#1; else lsl8/lsr8 */
};

struct Pair_2038b94 {
    u32 a, b;
};

extern int func_02098a4c(struct A_2098 *dst, int z, int src);
extern void func_02098388(void *p);
extern void func_02098c70(struct Pair_2038b94 *out, struct A_2098 *a);
extern int func_02098088(void *p, u32 x, u32 y);
extern void func_02098c98(struct A_2098 *a);
extern int func_02038ad4(void *p, u32 r1, int r6);
extern void func_02097ff0(void *p);
extern void func_020988a8(struct A_2098 *a);

int func_02038b94(int src) {
    struct A_2098 a;          /* sp+0x8, size up to 0x2c */
    struct Pair_2038b94 pr;   /* sp+0x0 */
    u8 buf34[0x48];           /* sp+0x34 */
    u32 v;
    int r6;
    int r4;

    if (func_02098a4c(&a, 0, src) == 0) return 0;
    func_02098388(buf34);
    func_02098c70(&pr, &a);
    if (func_02098088(buf34, pr.a, pr.b) == 0) return 0;

    v = a.field_1c;
    if ((v >> 0x18) & 1) {
        r6 = (v << 8) >> 8;
    } else {
        r6 = a.field_8;
    }
    func_02098c98(&a);
    r4 = func_02038ad4(buf34, a.field_4, r6);
    func_02097ff0(buf34);
    if (r4 != r6) return 0;
    func_020988a8(&a);
    return 1;
}
