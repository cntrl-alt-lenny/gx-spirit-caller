/* func_ov002_02257cac: clone of func_ov002_02257ba0 testing field +0x4.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov002_0225737c
 *     cmp   r0, #0x0
 *     ldrne r0, [r0, #0x4]
 *     cmpne r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

typedef struct {
    char _pad[0x4];
    int  f_4;
} state_ov002_02257d94_t;

extern state_ov002_02257d94_t *func_ov002_0225737c(void);

int func_ov002_02257cac(void) {
    state_ov002_02257d94_t *p = func_ov002_0225737c();
    return (p != 0) && (p->f_4 != 0);
}
