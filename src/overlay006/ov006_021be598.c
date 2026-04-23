/* func_ov006_021be598: 3-field setter with literal values, return 1.
 *
 *     mov r1, #0x6                     ; literal 6
 *     str r1, [r0, #0x88]              ; obj[0x88] = 6
 *     mov r1, #0x15                    ; literal 21
 *     str r1, [r0, #0x8c]              ; obj[0x8c] = 21
 *     mov r1, #0x0                     ; literal 0
 *     str r1, [r0, #0x90]              ; obj[0x90] = 0
 *     mov r0, #0x1
 *     bx  lr
 */

int func_ov006_021be598(void *obj) {
    *(int *)((char *)obj + 0x88) = 6;
    *(int *)((char *)obj + 0x8c) = 0x15;
    *(int *)((char *)obj + 0x90) = 0;
    return 1;
}
