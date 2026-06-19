/* func_ov006_021cac98: clear obj[0x8], then delegate with the obj
 * pointer to func_ov006_021cacbc. Return 1.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   r1, #0x0
 *     str   r1, [r0, #0x8]             ; obj[0x8] = 0
 *     bl    func_ov006_021cacbc
 *     mov   r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_ov006_021cacbc(void *obj);

int func_ov006_021cac98(void *obj) {
    *(int *)((char *)obj + 0x8) = 0;
    func_ov006_021cacbc(obj);
    return 1;
}
