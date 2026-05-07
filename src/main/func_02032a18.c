/* func_02032a18: stack-arg dispatcher — call `((arg5).fn_ee0)()` if non-null.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr ip, [sp, #0x8]               ; r12 = stack arg (5th arg, sp+8 after push)
 *     ldr ip, [ip, #0xee0]             ; r12 = arg5->fn_ee0
 *     cmp ip, #0x0
 *     ldmeqia sp!, {r3, pc}            ; if null, return
 *     blx ip                            ; else call (with r0..r3 from caller)
 *     ldmia sp!, {r3, pc}
 *
 * Stack-passed argument (5th param) is dereferenced and a function
 * pointer at offset 0xee0 is fetched + called. r0..r3 are caller-
 * preserved arg passthrough.
 */

typedef int (*fn4_t)(int, int, int, int);

typedef struct {
    char  _pad[0xee0];
    fn4_t fn_ee0;
} ctx_t;

void func_02032a18(int a, int b, int c, int d, ctx_t *ctx) {
    fn4_t f = ctx->fn_ee0;
    if (f != 0) f(a, b, c, d);
}
