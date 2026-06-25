/* CAMPAIGN-PREP candidate for func_022aeb60 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag=(c8==0) materialised 0/1 (moveq/movne) and reused as arg; clamp via temp t (movlt+unconditional str); G literal reloaded
 *   risk:       permuter-class: orig loads -1 as `sub r1,r0,#0x57` (reuse the just-set 0x56/0x42 constant), not `mvn`; this peephole is value-specific and a C `-1` likely emits mvn. Also stray `mov r3,#1`.
 *   confidence: low
 */
/* func_ov002_022aeb60: depending on whether global flag G->c8 is clear,
 * play one of two sounds (func_02037208) and conditionally zero a second
 * global field, notify func_ov002_0229a414(flag), clamp G->d4 up to a
 * floor of 8, then mark the passed record (f38=0, f40=1).
 *
 *     ldr r1,=G; mov r4,r0; ldr r0,[r1,#0xc8]; mov r2,#0
 *     cmp r0,#0; moveq r5,#1; movne r5,#0      ; flag = (G->c8==0)
 *     cmp r5,#0; mov r3,#1; beq .else
 *   .then: mov r0,#0x56; ldr ip,=G1; sub r1,r0,#0x57
 *          str r2,[ip,#4]; bl func_02037208; b .join     ; (0x56,-1); G1->f4=0
 *   .else: mov r0,#0x42; sub r1,r0,#0x43; bl func_02037208 ; (0x42,-1)
 *   .join: mov r0,r5; bl func_ov002_0229a414
 *          ldr r0,=G; mov r1,#0; ldr r2,[r0,#0xd4]; ldr r0,=G
 *          cmp r2,#8; movlt r2,#8; str r2,[r0,#0xd4]
 *          str r1,[r4,#0x38]; mov r0,#1; str r0,[r4,#0x40]
 */

struct gstate {
    int pad00[50];  /* 0x00..0xc4 */
    int c8;         /* 0xc8 */
    int padcc[2];   /* 0xcc..0xd0 */
    int d4;         /* 0xd4 */
};

struct rec5 {
    int pad00[14]; /* 0x00..0x34 */
    int f38;       /* 0x38 */
    int pad3c;     /* 0x3c */
    int f40;       /* 0x40 */
};

extern struct gstate data_ov002_022d0f2c;
extern int data_ov002_022d1af8[];   /* G1; field at +0x4 */
extern void func_02037208(int a, int b);
extern void func_ov002_0229a414(int flag);

void func_ov002_022aeb60(struct rec5 *rec) {
    int flag = (data_ov002_022d0f2c.c8 == 0);
    int t;

    if (flag) {
        data_ov002_022d1af8[1] = 0;
        func_02037208(0x56, -1);
    } else {
        func_02037208(0x42, -1);
    }
    func_ov002_0229a414(flag);

    t = data_ov002_022d0f2c.d4;
    if (t < 8)
        t = 8;
    data_ov002_022d0f2c.d4 = t;

    rec->f38 = 0;
    rec->f40 = 1;
}
