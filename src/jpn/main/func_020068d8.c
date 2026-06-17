/* func_020068d8: load global field + reroute arg + tail-call.
 *
 *     ldr   r1, .L_0200690c       ; r1 = &data_02104e3c
 *     ldr   ip, .L_02006910       ; ip = func_0207d238
 *     mov   r2, r0
 *     ldr   r0, [r1, #0x1c]
 *     ldr   r1, .L_02006914       ; r1 = func_02006898 (callback)
 *     bx    ip
 */

extern void func_0207d238(int p, int callback, int orig_arg, int unused);
extern void func_02006898(void);

asm void func_020068d8(int arg) {
    nofralloc
    ldr   r1, =0x02104f1c
    ldr   ip, =func_0207d238
    mov   r2, r0
    ldr   r0, [r1, #0x1c]
    ldr   r1, =func_02006898
    bx    ip
}
