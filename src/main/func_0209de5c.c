/* func_0209de5c: 2-deref store; (data + arg*4)->f_18 = b.
 *
 *     ldr r2, =data
 *     ldr r2, [r2, #0]       ; deref to get array base
 *     add r0, r2, r0, lsl #2 ; r0 = base + idx*4
 *     str r1, [r0, #0x18]    ; (base + idx*4)->f_18 = b
 */

extern char *data_021a8d2c;

void func_0209de5c(int idx, int b) {
    int *p = (int *)(data_021a8d2c + idx * 4);
    *(int *)((char *)p + 0x18) = b;
}
