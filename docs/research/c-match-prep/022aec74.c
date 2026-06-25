/* CAMPAIGN-PREP candidate for func_022aec74 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed slot[idx]<0 early-return guard; f44=7 store before clamp; clamp via temp t (movlt+uncond str); G literal reloaded for read vs write
 *   risk:       struct-guessed: slot[] at 0x1c, f2c at 0x2c, f44 at 0x44, and gstate c8/d4 offsets inferred. Codegen shape is faithful; only the offsets need confirming against the real structs.
 *   confidence: med
 */
/* func_ov002_022aec74: if the selected slot is still pending
 * (base->slot[idx] >= 0), record idx, optionally notify
 * func_ov002_0229a414(0) when the global flag G->c8 is set, force
 * base->f44=7, then clamp G->d4 up to a floor of 8.
 *
 *     mov r4,r0; add r0,r4,r1,lsl#2; ldr r0,[r0,#0x1c]
 *     cmp r0,#0; ldmltia ret              ; if (slot[idx] < 0) return
 *     ldr r0,=G; str r1,[r4,#0x2c]        ; base->f2c = idx
 *     ldr r0,[r0,#0xc8]; cmp r0,#0; beq .skip
 *     mov r0,#0; bl func_ov002_0229a414
 *   .skip: ldr r0,=G; mov r1,#0x7; str r1,[r4,#0x44]
 *     ldr r1,[r0,#0xd4]; ldr r0,=G; cmp r1,#8; movlt r1,#8; str r1,[r0,#0xd4]
 */

struct gstate {
    int pad00[50];  /* 0x00..0xc4 */
    int c8;         /* 0xc8 */
    int padcc[2];   /* 0xcc..0xd0 */
    int d4;         /* 0xd4 */
};

struct rec6 {
    int pad00[7];  /* 0x00..0x18 */
    int slot[3];   /* 0x1c..0x24 */
    int pad28;     /* 0x28 */
    int f2c;       /* 0x2c */
    int pad30[5];  /* 0x30..0x40 */
    int f44;       /* 0x44 */
};

extern struct gstate data_ov002_022d0f2c;
extern void func_ov002_0229a414(int flag);

void func_ov002_022aec74(struct rec6 *base, int idx) {
    int t;

    if (base->slot[idx] < 0)
        return;

    base->f2c = idx;
    if (data_ov002_022d0f2c.c8 != 0)
        func_ov002_0229a414(0);

    base->f44 = 7;

    t = data_ov002_022d0f2c.d4;
    if (t < 8)
        t = 8;
    data_ov002_022d0f2c.d4 = t;
}
