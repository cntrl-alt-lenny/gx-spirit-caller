/* CAMPAIGN-PREP candidate for func_022b005c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cur cached (reuse for <0 test); f10=(cur<0)?0x80:0x100 -> movlt/lsl#7/rsb#0x100; ternary literal-select A/B; phase saved r4 (arg2-first)
 *   risk:       permuter-class: the f4 compare-store-return needs `cmp;strne;cmpne;ldmeqia` conditional-execution fusion of the 3 statements. mwcc may emit a plain branch + separate cmp instead, diverging the whole .post block.
 *   confidence: low
 */
/* func_ov002_022b005c: state-transition setter. If the state f0 changes,
 * set a direction-dependent f10 (0x80 when previous<0 else 0x100), latch
 * f0=newstate and f4=7. Then if the sub-state f4 already equals `phase`
 * (or phase==7) it stops; otherwise it (re)loads a cell from one of two
 * tables (chosen by f0==G->f4) and scrolls it via func_0208fd30.
 *
 *     ldr r3,[r0]; mov r4,r2; cmp r3,r1; beq .post   ; cur, arg2; cur==state?
 *     cmp r3,#0; movlt r2,#1; movge r2,#0
 *     mov r2,r2,lsl#7; rsb r2,r2,#0x100; str r2,[r0,#0x10] ; f10 = cur<0?0x80:0x100
 *     str r1,[r0]; mov r1,#7; str r1,[r0,#4]               ; f0=state; f4=7
 *   .post: ldr r1,[r0,#4]; cmp r1,r4; strne r4,[r0,#4]
 *     cmpne r4,#7; ldmeqia ret              ; ret if f4==phase || phase==7
 *     ldr r1,=G; ldr r2,[r0]; ldr r0,[r1,#4]; mov r1,#4
 *     cmp r2,r0; ldreq r0,=A; mov r2,#0; ldrne r0,=B
 *     bl func_02006c0c; mov r5,r0; bl func_0201d738
 *     add r0,r0,r4,lsl#0xa; mov r1,#0x2c00; mov r2,#0x400
 *     bl func_0208fd30; mov r0,r5; bl func_02006e1c
 */

struct state7 {
    int f0;       /* 0x00 : current state */
    int f4;       /* 0x04 : sub-phase */
    int pad08[2]; /* 0x08..0x0c */
    int f10;      /* 0x10 */
};

extern int data_ov002_022cd73c[];   /* G; field at +4 */
extern int data_ov002_022cc7cc[];   /* table A */
extern int data_ov002_022cc7e8[];   /* table B */

extern int  func_02006c0c(int *src, int a, int b);
extern int  func_0201d738(void);
extern void func_0208fd30(int dst, int a, int b);
extern void func_02006e1c(int handle);

void func_ov002_022b005c(struct state7 *st, int state, int phase) {
    int cur;
    int v;
    int handle;

    cur = st->f0;
    if (cur != state) {
        st->f10 = (cur < 0) ? 0x80 : 0x100;
        st->f0 = state;
        st->f4 = 7;
    }

    v = st->f4;
    if (v != phase)
        st->f4 = phase;
    if (v == phase || phase == 7)
        return;

    handle = func_02006c0c((st->f0 == data_ov002_022cd73c[1]) ? data_ov002_022cc7cc
                                                              : data_ov002_022cc7e8,
                           4, 0);
    func_0208fd30(func_0201d738() + (phase << 10), 0x2c00, 0x400);
    func_02006e1c(handle);
}
