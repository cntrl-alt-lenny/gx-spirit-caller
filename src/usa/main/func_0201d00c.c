/* func_0201d00c: returns 1 iff `data_0218fddc.f_c > 0` (signed).
 *
 *     ldr r0, .L_0201d078
 *     ldr r0, [r0, #0xc]
 *     cmp r0, #0x0
 *     movgt r0, #0x1
 *     movle r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0xc];
    int  f_c;
} state_0218febc_t;

extern state_0218febc_t data_0218fddc;

int func_0201d00c(void) {
    return data_0218fddc.f_c > 0;
}
