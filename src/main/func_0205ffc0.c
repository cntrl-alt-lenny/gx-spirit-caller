/* func_0205ffc0: tail-call into func_020604b0(*p, b, 0x100).
 *
 *     ldr ip, .L_0205ffd0
 *     ldr r0, [r0, #0x0]                  ; deref arg0
 *     mov r2, #0x100
 *     bx  ip
 *  .L_0205ffd0: .word func_020604b0
 */

extern int func_020604b0(char *dst, char *src, int n);

int func_0205ffc0(void *p, char *msg) {
    return func_020604b0(*(char **)p, msg, 0x100);
}
