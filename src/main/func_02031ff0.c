/* func_02031ff0: 2-u32 setter at offsets 0x10 and 0x14.
 *
 *     str r1, [r0, #0x10]
 *     str r2, [r0, #0x14]
 *     bx  lr
 */

void func_02031ff0(void *obj, int a, int b) {
    *(int *)((char *)obj + 0x10) = a;
    *(int *)((char *)obj + 0x14) = b;
}
