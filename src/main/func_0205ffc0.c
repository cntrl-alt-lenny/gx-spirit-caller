/* func_0205ffc0: tail-call into func_020604b0(*p, b, 0x100).
 *
 *     ldr ip, .L_0205ffd0
 *     ldr r0, [r0, #0x0]                  ; deref arg0
 *     mov r2, #0x100
 *     bx  ip
 *  .L_0205ffd0: .word func_020604b0
 */

extern int func_020604b0(int a, int b, int c);

int func_0205ffc0(int *p, int b) {
    return func_020604b0(*p, b, 0x100);
}
