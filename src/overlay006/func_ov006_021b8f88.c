/* func_ov006_021b8f88: bounds-checked u16 array read off (self+0xc000).
 *
 *     add r0, r0, #0xc000
 *     ldr r2, [r0, #0xa94]
 *     cmp r1, r2
 *     movge r0, #0x0
 *     ldrlt r2, [r0, #0xa90]
 *     movlt r0, r1, lsl #0x1
 *     ldrlth r0, [r2, r0]
 *     bx lr
 */

unsigned short func_ov006_021b8f88(char *self, int index) {
    self += 0xc000;
    if (index >= *(int *)(self + 0xa94)) return 0;
    return (*(unsigned short **)(self + 0xa90))[index];
}
