/* CAMPAIGN-PREP candidate for func_0226b0d0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u16-zext tail-call shim (cast-in-call), selector immediate
 *   risk:       Two-cast shift scheduling (arg2 lsl emitted first) may reorder vs mwcc; proven on sibling 0226b274
 *   confidence: high
 */
/* func_ov002_0226afe0: forward (arg1,arg2) as zero-extended u16 payload to the
 * command sink func_ov002_0226ac08 with kind 0x13. Pure tail-call shim.
 * The (u16) casts on the two int args produce the lsl#16;lsr#16 zext pairs;
 * the sink-pointer pool load is hoisted to the top (ldr ip; ...; bx ip). */
typedef unsigned short u16;
extern int func_ov002_0226ac08(int a, int b, int c, int d);
int func_ov002_0226afe0(int arg0, int arg1, int arg2) {
    return func_ov002_0226ac08(arg0, 0x13, (u16)arg1, (u16)arg2);
}
