/* func_ov002_02240ee4: bounds-guarded call. If arg2 >= 5, returns
 * 0; otherwise tail-calls func_ov002_022018cc(r0, r1, r2). The
 * `movge r0, #0x0; ldmgeia` predication is the wave-6 idiom in
 * reverse — `return 0` predicated on the bounds-fail branch
 * (`movge r0, #0`) is needed because r0 isn't already 0.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r2, #0x5
 *     movge r0, #0x0
 *     ldmgeia sp!, {r3, pc}
 *     bl    func_ov002_022018cc
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_022018cc(int a, int b, int c);

int func_ov002_02240ee4(int a, int b, int c) {
    if (c >= 5) return 0;
    return func_ov002_022018cc(a, b, c);
}
