/* func_0209dd68: 2-deref store; (data + arg*4)->f_18 = b.
 *
 *     ldr r2, =data
 *     ldr r2, [r2, #0]       ; deref to get array base
 *     add r0, r2, r0, lsl #2 ; r0 = base + idx*4
 *     str r1, [r0, #0x18]    ; (base + idx*4)->f_18 = b
 */

extern char *data_021a8c4c;

void func_0209dd68(int idx, int b) {
    int *p = (int *)(data_021a8c4c + idx * 4);
    *(int *)((char *)p + 0x18) = b;
}
