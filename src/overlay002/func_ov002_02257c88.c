/* func_ov002_02257c88: call helper, return 1 iff returned ptr is non-null
 * AND its field at +0x10 is non-zero.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov002_02257464
 *     cmp   r0, #0x0
 *     ldrne r0, [r0, #0x10]
 *     cmpne r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

typedef struct {
    char _pad[0x10];
    int  f_10;
    int  f_14;
} state_ov002_02257c88_t;

extern state_ov002_02257c88_t *func_ov002_02257464(void);

int func_ov002_02257c88(void) {
    state_ov002_02257c88_t *p = func_ov002_02257464();
    return (p != 0) && (p->f_10 != 0);
}
