/* CAMPAIGN-PREP candidate for func_0204682c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     leaf table-scan returning index / -1; sp3 tier (no frame)
 *   risk:       leaf has no push/sub-sp; if mwcc emits a frame it diverges. data_0219daf4 element type must be 4-byte for lsl#2.
 *   confidence: high
 */
/* func_0204682c: leaf. Return the index of the first NULL slot in the
 * 32-entry pointer table data_0219daf4, or -1 if all are non-null.
 *
 *     ldr r2, =data_0219daf4 ; mov r0, #0
 *  .L_8: ldr r1,[r2,r0,lsl#2]; cmp r1,#0; bxeq lr   ; return i
 *        add r0,#1; cmp r0,#0x20; blt .L_8
 *        mvn r0,#0 ; bx lr                           ; return -1 */

extern void *data_0219daf4[];

int func_0204682c(void) {
    int i;
    for (i = 0; i < 0x20; i++) {
        if (data_0219daf4[i] == 0) return i;
    }
    return -1;
}
