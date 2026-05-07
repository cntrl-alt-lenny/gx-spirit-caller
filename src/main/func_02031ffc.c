/* func_02031ffc: indirect-call dispatcher — `p->fn_10(arg, 4)`.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r2, [r0, #0x10]      ; r2 = p->fn_10
 *     mov r0, r1                ; r0 = arg
 *     mov r1, #0x4              ; r1 = 4 (const second arg)
 *     blx r2
 *     ldmia sp!, {r3, pc}
 *
 * Reuses brief-020 / brief-022 indirect-dispatcher pattern: caller
 * passes p in r0, arg in r1; the function loads p->fn_10, shuffles
 * args (arg → r0, const 4 → r1), and tail-blx-calls.
 */

typedef int (*fn2_t)(int, int);

typedef struct {
    char  _pad[0x10];
    fn2_t fn_10;
} state_fn10_t;

int func_02031ffc(state_fn10_t *p, int arg) {
    return p->fn_10(arg, 4);
}
