/* CAMPAIGN-PREP candidate for func_022ae718 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Guard-chain returning 0/1; cmp;moveq bool result
 *   risk:       Final `== 1` may emit moveq/movne differently vs the asm's moveq+fallthrough-to-0; if not byte-exact, reshape to nested if.
 *   confidence: med
 */
/* func_ov002_022ae718: leaf guard returning 0/1. If arg->f0 (halfword)
 * is zero -> 0. Else read global data_022d016c.f_d48; return 1 iff it == 1,
 * else 0.
 *
 *     ldrh  r0, [r0]
 *     cmp   r0, #0x0
 *     beq   .L_308
 *     ldr   r0, =data_ov002_022d016c
 *     ldr   r0, [r0, #0xd48]
 *     cmp   r0, #0x1
 *     moveq r0, #0x1 ; bxeq lr
 *  .L_308:
 *     mov   r0, #0x0 ; bx lr
 */

struct G022d016c {
    char _pad0[0xd48];
    int  f_d48;
};
extern struct G022d016c data_ov002_022d016c;

struct S022ae718 {
    unsigned short f0;
};

int func_ov002_022ae718(struct S022ae718 *p) {
    if (p->f0 == 0)
        return 0;
    return data_ov002_022d016c.f_d48 == 1;
}
