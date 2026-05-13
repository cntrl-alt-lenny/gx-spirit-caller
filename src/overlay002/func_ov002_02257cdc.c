/* func_ov002_02257cdc: clone of func_ov002_02257c88 testing field +0x14.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov002_02257464
 *     cmp   r0, #0x0
 *     ldrne r0, [r0, #0x14]
 *     cmpne r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

typedef struct {
    char _pad[0x14];
    int  f_14;
} state_ov002_02257cdc_t;

extern state_ov002_02257cdc_t *func_ov002_02257464(void);

int func_ov002_02257cdc(void) {
    state_ov002_02257cdc_t *p = func_ov002_02257464();
    return (p != 0) && (p->f_14 != 0);
}
