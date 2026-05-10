/* func_0207fce8: call + store + call. Calls func_0207e840(p),
 * then stores 1 to p->f_8, then calls func_0207fda4(p).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207e840
 *     mov   r1, #0x1
 *     mov   r0, r4
 *     str   r1, [r4, #0x8]
 *     bl    func_0207fda4
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207e840(void *p);
extern int func_0207fda4(void *p);

typedef struct {
    char _pad[0x8];
    int  f_8;
} state_0207fce8_t;

int func_0207fce8(state_0207fce8_t *p) {
    func_0207e840(p);
    p->f_8 = 1;
    return func_0207fda4(p);
}
