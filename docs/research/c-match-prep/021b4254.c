/* CAMPAIGN-PREP candidate for func_021b4254 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     accessor (ldrh, stride-4) + frameless tail-call
 *   risk:       tail-call may emit bl;bx lr instead of ldr ip;bx ip; (arg0<<2) index form
 *   confidence: high
 */
/* func_ov002_021b4254: leaf — load a u16 from a stride-4 table indexed by
 * arg0, then tail-call func_ov002_021b3d2c with it.
 *   ldr r2,=tbl ; mov r0,r0,lsl#2 ; ldrh r0,[r2,r0] ; bx =func_021b3d2c
 */
extern unsigned short data_ov002_022d0252[];
extern int func_ov002_021b3d2c(int a);

int func_ov002_021b4254(int arg0) {
    return func_ov002_021b3d2c(
        *(unsigned short *)((char *)data_ov002_022d0252 + (arg0 << 2)));
}
