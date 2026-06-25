/* CAMPAIGN-PREP candidate for func_021b45fc (ov019, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     nested counted strh fill; COMMUTATIVE orr (value|(arg<<12)); u16 wrap via <<16>>16
 *   risk:       the (val+1)&0xffff u16-increment may emit differently; outer pointer += 0x40 vs index*0x40 may reshape; reg-alloc on lr/ip temps
 *   confidence: med
 */
/* func_ov019_021b45fc: fill a grid of u16 tile entries. For each of a3 rows,
 * write a2 halfwords of (val | (a4<<12)) incrementing val (mod 0x10000) per
 * cell; each row's base advances 0x40 bytes (0x20 halfwords).
 *
 *   orr r4,r1,r6,lsl#0xc ; strh r4,[r0,r8,lsl#1]
 *   add r1,(r1+1) ; r1 = r1<<16>>16   (u16 wrap)
 *   outer: add r0,r0,#0x40
 */

typedef unsigned short u16;

void func_ov019_021b45fc(u16 *dst, int val, int inner, int rows, int a4) {
    int oi;
    int ii;

    if (rows <= 0) {
        return;
    }
    for (oi = 0; oi < rows; oi++) {
        for (ii = 0; ii < inner; ii++) {
            dst[ii] = (u16)(val | (a4 << 0xc));
            val = (u16)(val + 1);
        }
        dst += 0x20;
    }
}
