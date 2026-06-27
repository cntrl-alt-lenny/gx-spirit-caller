/* CAMPAIGN-PREP candidate for func_022ae9c0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if/else with identical clear-loop body to force the two duplicated loops; reload f0 via ldrh for guard; explicit bic/orr 0x3e; tail-call bx
 *   risk:       reshape-able: orig keeps two byte-identical clear loops. mwcc may collapse the if/else into ONE loop (branch structure diverges). If so, hide the merge behind a side-effect or distinct slot writes per arm.
 *   confidence: med
 */
/* func_ov002_022ae9c0: reset a record's header (f0=arg1, f44=0, f3c=0,
 * field bits 1..5 of f2 forced to 0x1f), clear its 3 slots to -1 (the
 * clear loop is duplicated across the f0!=0 / f0==0 arms), then
 * tailcall func_ov002_022a82c4(&data_ov002_022d1410).
 *
 *     strh r1,[r0]; mov r3,#0
 *     str r3,[r0,#0x44]; str r3,[r0,#0x3c]
 *     ldrh r1,[r0,#0x2]; mvn r2,#0
 *     bic r1,#0x3e; orr r1,#0x3e; strh r1,[r0,#0x2]
 *     ldrh r1,[r0]; cmp r1,#0; beq .else
 *   .then: add r1,r0,r3,lsl#2; add r3,#1; str r2,[r1,#0x1c]; cmp r3,#3; blt .then; b .tail
 *   .else: add r1,r0,r3,lsl#2; add r3,#1; str r2,[r1,#0x1c]; cmp r3,#3; blt .else
 *   .tail: ldr ip,=func_ov002_022a82c4; ldr r0,=data_ov002_022d1410; bx ip
 */

struct rec {
    unsigned short f0;  /* 0x00 */
    unsigned short f2;  /* 0x02 : bits 1..5 form a 5-bit field */
    int pad04[6];       /* 0x04..0x18 */
    int slot[3];        /* 0x1c..0x24 */
    int pad28[5];       /* 0x28..0x38 */
    int f3c;            /* 0x3c */
    int pad40;          /* 0x40 */
    int f44;            /* 0x44 */
};

extern int data_ov002_022d1410[];
extern int func_ov002_022a82c4(int *p);

int func_ov002_022ae9c0(struct rec *base, int arg1) {
    base->f0 = (unsigned short)arg1;
    base->f44 = 0;
    base->f3c = 0;
    base->f2 = (base->f2 & ~0x3e) | 0x3e;
    if (base->f0 != 0) {
        int i;
        for (i = 0; i < 3; i++)
            base->slot[i] = -1;
    } else {
        int i;
        for (i = 0; i < 3; i++)
            base->slot[i] = -1;
    }
    return func_ov002_022a82c4(data_ov002_022d1410);
}
