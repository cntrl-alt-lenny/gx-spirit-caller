/* func_02053544: 4-arg tail-call w/ arg-shuffle + struct deref.
 * func_020534d4(b, c, p->f_24, p).
 *
 *     ldr ip, .L_0205355c
 *     mov r3, r0
 *     mov r0, r1
 *     mov r1, r2
 *     ldr r2, [r3, #0x24]
 *     bx  ip
 *  .L_0205355c: .word func_020534d4
 */

extern int func_020534d4(int a, int b, int c, void *d);

typedef struct {
    char _pad[0x24];
    int  f_24;
} state_02053544_t;

int func_02053544(state_02053544_t *p, int b, int c) {
    return func_020534d4(b, c, p->f_24, p);
}
