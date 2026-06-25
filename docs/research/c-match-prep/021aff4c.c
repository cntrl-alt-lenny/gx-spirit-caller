/* CAMPAIGN-PREP candidate for func_021aff4c (ov002, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD early-return + byte-pack RMW into high byte of u16 (operand order)
 *   risk:       idx signedness (cmp;bxge is signed >=); if mwcc treats idx unsigned the guard could become bcs. RMW order should hold.
 *   confidence: high
 */
/* func_ov002_021aff4c: store low byte of v into the HIGH byte of the u16 at
 * index idx in data_ov002_022ce088 (idx>=256 is a no-op). Keeps the low byte.
 *
 *     cmp r0,#0x100; bxge lr
 *     ldr r2,=data_ov002_022ce088
 *     mov r3,r0,lsl#1; ldrh r0,[r2,r3]
 *     and r1,r1,#0xff; and r0,r0,#0xff
 *     orr r0,r0,r1,lsl#8; strh r0,[r2,r3]
 */

extern unsigned short data_ov002_022ce088[];

void func_ov002_021aff4c(int idx, int v) {
    if (idx >= 0x100) return;
    data_ov002_022ce088[idx] = (data_ov002_022ce088[idx] & 0xff) | ((v & 0xff) << 8);
}
