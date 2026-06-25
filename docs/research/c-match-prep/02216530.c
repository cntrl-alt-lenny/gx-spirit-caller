/* CAMPAIGN-PREP candidate for func_02216530 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ptr-in-global; bitfield-fold-into-cmp; shared-return-0 branches, unique-const predicates
 *   risk:       documented finicky (wave5 defer): first guard must branch to shared ret-0 (beq) while second predicates; mwcc may inline/branch differently
 *   confidence: med
 */
/* func_ov002_02216530: 0x800 iff arg0 != active-self.bit0 AND arg1 == 0xb; else 0.
 *
 *   ldr r2,=ce288; ldr r2,[r2,#0x48c]; ldrh r2,[r2,#2]
 *   mov r2,r2,lsl#31; cmp r0, r2,lsr#31; beq .L_130   ; if(arg0==bit0) return 0
 *   cmp r1,#0xb; moveq r0,#0x800; bxeq lr             ; if(arg1==0xb) return 0x800
 *   .L_130: mov r0,#0                                  ; return 0
 */
typedef unsigned short u16;

struct F02216530_Self { u16 f0; u16 b0 : 1; };

extern char data_ov002_022ce288[];

int func_ov002_02216530(int arg0, int arg1) {
    struct F02216530_Self *p =
        *(struct F02216530_Self **)(data_ov002_022ce288 + 0x48c);
    if (arg0 == p->b0) return 0;
    if (arg1 == 0xb) return 0x800;
    return 0;
}
