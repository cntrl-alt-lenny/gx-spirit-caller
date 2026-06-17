/* func_0206e4bc: alloc-and-init. Calls func_0206e490(x) and if
 * result is non-null, stores arg1->f_7c there. Returns the
 * pointer (or 0). Style A epilogue → .legacy.c.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r1
 *     bl    func_0206e490
 *     cmp   r0, #0x0
 *     ldrne r1, [r4, #0x7c]
 *     strne r1, [r0, #0x0]
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 */

extern int *func_0206e490(int x);

typedef struct {
    char _pad[0x7c];
    int  f_7c;
} state_0206e530_t;

int *func_0206e4bc(int x, state_0206e530_t *p) {
    int *r = func_0206e490(x);
    if (r != 0) *r = p->f_7c;
    return r;
}
