/* func_0201d6a4: tail-call wrapper into func_0201d5cc with the
 * 'BGDT' (0x42474454) magic, returning result + 0x1c. Style B
 * with r3-spill push.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_0201d70c           ; 0x42474454 = 'BGDT'
 *     bl    func_0201d5cc
 *     add   r0, r0, #0x1c
 *     ldmia sp!, {r3, pc}
 *  .L_0201d70c: .word 0x42474454
 */

extern int func_0201d5cc(int arg, int sig);

int func_0201d6a4(int arg) {
    return func_0201d5cc(arg, 0x42474454) + 0x1c;
}
