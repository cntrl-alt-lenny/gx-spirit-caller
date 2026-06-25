/* CAMPAIGN-PREP candidate for func_021ac810 (ov000, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD insert (:4 field) + shifted RHS value
 *   risk:       Field at +0x4 inferred; mwcc may pad-model the struct differently or fold lsl#12 into the mask.
 *   confidence: med
 */
/* func_ov000_021ac810: insert (arg << 12) into the :4 bitfield at +0x4 of
 * data_ov000_021c758c.
 *
 *     ldr r1, =data_ov000_021c758c
 *     mov r0, r0, lsl #0xc
 *     ldr r2, [r1, #0x4]
 *     and r0, r0, #0xf
 *     bic r2, r2, #0xf
 *     orr r0, r2, r0
 *     str r0, [r1, #0x4]
 *     bx  lr
 */

struct ov000_021c758c_s {
    char _pad0[0x4];
    unsigned int f_4 : 4;
};

extern struct ov000_021c758c_s data_ov000_021c758c;

void func_ov000_021ac810(int v) {
    data_ov000_021c758c.f_4 = v << 12;
}
