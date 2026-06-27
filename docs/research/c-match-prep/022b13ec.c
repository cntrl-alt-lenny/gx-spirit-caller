/* CAMPAIGN-PREP candidate for func_022b13ec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if/else-if mode chain (==1 / ==2||==3); two separate short externs indexed [idx*2] -> shared r2=idx<<2 + two ldrsh literals; -hi passed with v still live in r0
 *   risk:       struct-guessed: lo/hi modeled as two stride-4 short arrays 2 bytes apart to force the two literal loads the asm shows; a single {s16 lo,hi;}[] would emit one literal instead. Confirm which.
 *   confidence: low
 */
/* func_ov002_022b13ec: clamp/score lookup for an index `idx`. Gates on
 * the global mode G->d00 (mode 1 with sub-mode 3 and idx>0 -> 0; modes
 * 2/3 with idx>5 -> 0). Otherwise scores idx via func_ov002_022b0484,
 * floors against lo[idx], then either scales by hi[idx] (hi>0) or
 * routes the magnitude through func_020b3870.
 *
 *     ldr r1,=G; mov r4,r0; ldr r0,[r1,#0xd00]
 *     cmp r0,#1; beq .m1; cmp r0,#2; cmpne r0,#3; beq .m23; b .body
 *   .m1: ldr r0,[r1,#0xd04]; cmp r0,#3; bne .body
 *        cmp r4,#0; ble .body; mov r0,#0; ret
 *   .m23: cmp r4,#5; movgt r0,#0; ldmgtia ret
 *   .body: mov r0,r4; bl func_ov002_022b0484
 *        ldr r1,=lo; mov r2,r4,lsl#2; ldrsh r1,[r1,r2]; cmp r0,r1; blt .zero
 *        ldr r1,=hi; ldrsh r1,[r1,r2]; cmp r1,#0; mulgt r1,r0,r1; bgt .done
 *        rsb r1,r1,#0; bl func_020b3870; mov r1,r0
 *   .done: mov r0,r1; ret
 *   .zero: mov r0,#0; ret
 */

struct gstate8 {
    int pad[832];   /* 0x000..0xcfc */
    int d00;        /* 0xd00 */
    int d04;        /* 0xd04 */
};

extern struct gstate8 data_ov002_022d016c;
extern short data_ov002_022ca59c[];   /* lo[]; stride-4 (paired with hi) */
extern short data_ov002_022ca59e[];   /* hi[]; = lo base + 2 */

extern int func_ov002_022b0484(int idx);
extern int func_020b3870(int a, int b);

int func_ov002_022b13ec(int idx) {
    int mode = data_ov002_022d016c.d00;
    int v;
    int lo;
    int hi;

    if (mode == 1) {
        if (data_ov002_022d016c.d04 == 3 && idx > 0)
            return 0;
    } else if (mode == 2 || mode == 3) {
        if (idx > 5)
            return 0;
    }

    v = func_ov002_022b0484(idx);
    lo = data_ov002_022ca59c[idx * 2];
    if (v < lo)
        return 0;

    hi = data_ov002_022ca59e[idx * 2];
    if (hi > 0)
        return v * hi;
    return func_020b3870(v, -hi);
}
