/* func_02005c60: 3-way switch (1 → field0, 2 → field4, default → 0)
 * then tail-call Task_InvokeLocked. Each case branches to a shared
 * tail-call setup.
 *
 *     cmp r0, #0x1
 *     beq .L_case1
 *     cmp r0, #0x2
 *     beq .L_case2
 *     b   .L_default
 *  .L_case1:
 *     ldr r0, .L_data
 *     ldr r0, [r0, #0x0]
 *     b   .L_tail
 *  .L_case2:
 *     ldr r0, .L_data
 *     ldr r0, [r0, #0x4]
 *     b   .L_tail
 *  .L_default:
 *     mov r0, #0x0
 *  .L_tail:
 *     ldr ip, .L_Task_InvokeLocked
 *     bx  ip
 *  .L_data:                .word data_02103d6c
 *  .L_Task_InvokeLocked:   .word Task_InvokeLocked
 */

typedef struct {
    int f_0;
    int f_4;
} state_02005c60_t;

extern state_02005c60_t data_02103d6c;
extern int Task_InvokeLocked(int x);

int func_02005c60(int kind) {
    int arg;
    switch (kind) {
    case 1: arg = data_02103d6c.f_0; break;
    case 2: arg = data_02103d6c.f_4; break;
    default: arg = 0; break;
    }
    return Task_InvokeLocked(arg);
}
