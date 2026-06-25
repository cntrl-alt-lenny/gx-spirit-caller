/* CAMPAIGN-PREP candidate for func_022152fc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     tag6 bitfield; && short-circuit guard; tail-call return
 *   risk:       && must emit beq-to-tail then predicated moveq/popeq; if mwcc inverts the branch polarity, swap to nested ifs
 *   confidence: high
 */
/* func_ov002_022152fc: if tag6 != 0x23, gate on func_021bb91c(0x128b)==0 -> ret 0;
 * else tail-call func_02210810(self, arg1).
 *
 *   ldrh r0,[r5,#2]; tag6=bits[11:6]; cmp #0x23; beq tail
 *   bl func_021bb91c(0x128b); cmp #0; moveq r0,#0; popeq
 *   tail: return func_02210810(self, arg1)
 */
typedef unsigned short u16;

struct F022152fc_F2 {
    u16 b0_5 : 6;
    u16 tag6 : 6;
    u16 rest : 4;
};
struct F022152fc_Self {
    u16 f0;
    struct F022152fc_F2 f2;
};

extern int func_ov002_021bb91c(int magic);
extern int func_ov002_02210810(struct F022152fc_Self *self, int arg1);

int func_ov002_022152fc(struct F022152fc_Self *self, int arg1) {
    if (self->f2.tag6 != 0x23 && func_ov002_021bb91c(0x128b) == 0)
        return 0;
    return func_ov002_02210810(self, arg1);
}
