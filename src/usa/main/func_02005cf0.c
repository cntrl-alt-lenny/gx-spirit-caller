/* func_02005cf0: 3-way switch + 3-arg tail-call. Same shape as wave-21's
 * func_02005c44 but with 2 fixed-arg constants (0xc0, 0x400).
 *
 *     cmp r0, #0x1   ; beq .L_case1
 *     cmp r0, #0x2   ; beq .L_case2
 *     b   .L_default
 *  .L_case1: ldr r0, .L_data ; ldr r1, [r0, #0]  ; b .L_tail
 *  .L_case2: ldr r0, .L_data ; ldr r1, [r0, #4]  ; b .L_tail
 *  .L_default: mov r1, #0
 *  .L_tail:
 *     ldr ip, .L_func
 *     mov r0, #0xc0
 *     mov r2, #0x400
 *     bx  ip
 */

typedef struct {
    int f_0;
    int f_4;
} state_02005d0c_t;

extern state_02005d0c_t data_02103c8c;
extern int func_02094410(int a, int b, int c);

int func_02005cf0(int kind) {
    int arg;
    switch (kind) {
    case 1: arg = data_02103c8c.f_0; break;
    case 2: arg = data_02103c8c.f_4; break;
    default: arg = 0; break;
    }
    return func_02094410(0xc0, arg, 0x400);
}
