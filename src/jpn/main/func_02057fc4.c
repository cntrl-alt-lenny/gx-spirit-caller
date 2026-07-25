/* CAMPAIGN-PREP candidate for func_02057fc4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     stack-buffer format then tail call (wrapper)
 *   risk:       stack frame must size to 0x14; buffer-passed-as-&buf[0] must yield add r0,sp,#0; reg cache of r0/r1 order may differ
 *   confidence: med
 */
/* func_02057fc4: small wrapper. Format a 0x14 stack record via
 * func_020a9698, then call func_02057ffc(arg0, arg1, &record).
 *   stmdb {r4,r5,lr}; sub sp,#0x14; mov r4,r1; mov r5,r0
 *   ldr r1,=data_021000e8; add r0,sp,#0; bl func_020a9698
 *   add r2,sp,#0; mov r0,r5; mov r1,r4; bl func_02057ffc
 */

extern unsigned char data_021000e8[];
extern void func_020a9698(void *dst, const void *src);
extern void func_02057ffc(void *a0, void *a1, void *rec);

void func_02057fc4(void *a0, void *a1) {
    unsigned char buf[0x14];
    func_020a9698(buf, data_021000e8);
    func_02057ffc(a0, a1, buf);
}
