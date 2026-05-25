/* func_ov008_021b1ee0: double-deref + read offset 0x5c.
 *
 *     ldr r0, .L_021b1ef0    ; data_ov008_021b270c
 *     ldr r0, [r0, #0x0]
 *     ldr r0, [r0, #0x5c]
 *     bx  lr
 */

extern char *data_ov008_021b270c;

int func_ov008_021b1ee0(void) {
    return *(int *)(data_ov008_021b270c + 0x5c);
}
