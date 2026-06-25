/* CAMPAIGN-PREP candidate for func_022bd940 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Sparse cmp/beq state machine; shared fall-through tail
 *   risk:       Small case count: mwcc must emit cmp/beq chain not a jump table; if it tables, the dispatch diffs. case 2's early return ordering must hold.
 *   confidence: med
 */
/* func_ov002_022bd940: 3-state counter on p->f_c60 (cmp/beq dispatch, NOT
 * a jump table — sparse via explicit compares). Default & states 0/1 fall
 * through to the shared tail that bumps f_c64 and returns 1; state 2 sets
 * f_cc8=0xc, f_c54=0 and returns 0.
 *
 *     ldr r1,[r0,#0xc60] ; cmp r1,#0 ; beq .L_2b7c
 *     cmp r1,#1 ; beq .L_2b90
 *     cmp r1,#2 ; beq .L_2bb0
 *     b .L_2bc8
 *  .L_2b7c: f_c60=1 ; f_c64=0 ; b .L_2bc8
 *  .L_2b90: if (f_c64 < 0x96) b .L_2bc8 ; f_c60=2 ; f_c64=0 ; b .L_2bc8
 *  .L_2bb0: f_cc8=0xc ; f_c54=0 ; return 0
 *  .L_2bc8: f_c64++ ; return 1
 */

struct S022bd940 {
    char _pad0[0xc54];
    int  f_c54;   /* +0xc54 */
    char _padc58[0x8];
    int  f_c60;   /* +0xc60 */
    int  f_c64;   /* +0xc64 */
    char _padc68[0x60];
    int  f_cc8;   /* +0xcc8 */
};

int func_ov002_022bd940(struct S022bd940 *p) {
    switch (p->f_c60) {
    case 0:
        p->f_c60 = 1;
        p->f_c64 = 0;
        break;
    case 1:
        if (p->f_c64 < 0x96)
            break;
        p->f_c60 = 2;
        p->f_c64 = 0;
        break;
    case 2:
        p->f_cc8 = 0xc;
        p->f_c54 = 0;
        return 0;
    }
    p->f_c64++;
    return 1;
}
