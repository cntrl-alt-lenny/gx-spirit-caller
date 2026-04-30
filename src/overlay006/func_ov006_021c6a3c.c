/* func_ov006_021c6a3c: `if (p->f_8) func_0202d9f8(p->f_8); return 1;`
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r0, [r0, #0x8]
 *     cmp r0, #0x0
 *     beq .end
 *     bl func_0202d9f8
 *   .end:
 *     mov r0, #0x1
 *     ldmia sp!, {r3, pc}
 */

extern void func_0202d9f8(void *p);

int func_ov006_021c6a3c(void *obj) {
    void *p = *(void **)((char *)obj + 0x8);
    if (p != 0) func_0202d9f8(p);
    return 1;
}
