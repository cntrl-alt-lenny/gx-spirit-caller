/* func_ov006_021c81a4: 4-field setter (3 reg args + 1 stack arg),
 * return 1.
 *
 *     str r1, [r0, #0x54]               ; obj[0x54] = a
 *     str r2, [r0, #0x58]               ; obj[0x58] = b
 *     ldr r1, [sp, #0x0]                ; r1 = d (stack arg)
 *     str r3, [r0, #0x5c]               ; obj[0x5c] = c
 *     str r1, [r0, #0x60]               ; obj[0x60] = d
 *     mov r0, #0x1
 *     bx  lr
 *
 * Note the store order: mwcc reorders the stack-arg load to fit the
 * sequential store stream. Writes are still in address order
 * (0x54, 0x58, 0x5c, 0x60).
 */

int func_ov006_021c81a4(void *obj, int a, int b, int c, int d) {
    *(int *)((char *)obj + 0x54) = a;
    *(int *)((char *)obj + 0x58) = b;
    *(int *)((char *)obj + 0x5c) = c;
    *(int *)((char *)obj + 0x60) = d;
    return 1;
}
