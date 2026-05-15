/* func_0207e828: call + conditional clear. If func_0207e9fc(p)
 * returns non-zero, clear p->f_c. Style B (predicated movne/strne
 * for the conditional).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_0207e9fc
 *     cmp   r0, #0x0
 *     movne r1, #0x0
 *     strne r1, [r4, #0xc]
 *     ldmia sp!, {r4, pc}
 */

extern int func_0207e9fc(void *p);

typedef struct {
    char  _pad[0xc];
    int   f_c;
} state_0207e910_t;

int func_0207e828(state_0207e910_t *p) {
    int r = func_0207e9fc(p);
    if (r != 0) {
        p->f_c = 0;
    }
    return r;
}
