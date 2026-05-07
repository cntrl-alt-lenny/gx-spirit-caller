/* func_02008598: returns 1 iff `data_02104f3c.f_c >= 0` (signed).
 *
 *     ldr r0, .L_020085b0
 *     ldr r0, [r0, #0xc]
 *     cmp r0, #0x0
 *     movge r0, #0x1
 *     movlt r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0xc];
    int  f_c;
} state_02104f3c_t;

extern state_02104f3c_t data_02104f3c;

int func_02008598(void) {
    return data_02104f3c.f_c >= 0;
}
