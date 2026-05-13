/* func_020431a4: 2-deref read at offset 0x1004 (split add for 21-bit offset).
 *
 *     ldr r0, =data
 *     ldr r0, [r0, #0]
 *     add r0, r0, #0x1000
 *     ldr r0, [r0, #4]      ; combined: [r0, #0x1004]
 *     bx lr
 */

extern char *data_0219d910;
int func_020431a4(void) {
    return *(int *)(data_0219d910 + 0x1004);
}
