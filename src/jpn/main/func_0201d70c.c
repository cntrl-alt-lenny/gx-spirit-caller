/* func_0201d70c: twin of func_0201d6a4 with 'PALT' (0x50414c54)
 * magic and +0xc offset. Style B.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_0201d774           ; 0x50414c54 = 'PALT'
 *     bl    func_0201d5cc
 *     add   r0, r0, #0xc
 *     ldmia sp!, {r3, pc}
 *  .L_0201d774: .word 0x50414c54
 */

extern int func_0201d5cc(int arg, int sig);

int func_0201d70c(int arg) {
    return func_0201d5cc(arg, 0x50414c54) + 0xc;
}
