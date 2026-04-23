/* func_ov006_021cada4: clear obj[0x8], then delegate with the obj
 * pointer to func_ov006_021cadc8. Return 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x8]             ; obj[0x8] = 0
 *     bl    func_ov006_021cadc8
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov006_021cadc8(void *obj);

int func_ov006_021cada4(void *obj) {
    *(int *)((char *)obj + 0x8) = 0;
    func_ov006_021cadc8(obj);
    return 1;
}
