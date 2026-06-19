/* func_ov002_02259190: helper-call + return 8/0 based on result.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r2, r1
 *     ldr   r1, .L_02259298           ; 0xfffe
 *     bl    func_ov002_022535a4
 *     cmp   r0, #0x0
 *     movne r0, #0x8
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern int func_ov002_022535a4(int a, int b, int c);

int func_ov002_02259190(int arg0, int arg1) {
    return func_ov002_022535a4(arg0, 0xfffe, arg1) != 0 ? 8 : 0;
}
