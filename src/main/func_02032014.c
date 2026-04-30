/* func_02032014: indirect-call dispatcher — invoke `p->f_14(arg)`.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r2, [r0, #0x14]    ; fn = p->f_14
 *     mov r0, r1              ; new r0 = arg
 *     blx r2                  ; fn(arg)
 *     ldmia sp!, {r3, pc}
 */

typedef int (*method_t)(int arg);

int func_02032014(void *p, int arg) {
    method_t fn = *(method_t *)((char *)p + 0x14);
    return fn(arg);
}
