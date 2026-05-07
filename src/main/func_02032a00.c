/* func_02032a00: stack-arg dispatcher — `((arg4)->fn_edc)()` if non-null.
 * Variant of brief-029 func_02032a18 with offset 0xedc instead of 0xee0,
 * and indexes through r3 (4th caller arg) rather than via stack.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r3, [r3, #0xedc]
 *     cmp r3, #0x0
 *     ldmeqia sp!, {r3, pc}
 *     blx r3
 *     ldmia sp!, {r3, pc}
 *
 * 4-arg signature: r0..r2 pass through to the called fnptr; r3 is
 * dereferenced to load the function pointer at offset 0xedc.
 */

typedef int (*fn3_t)(int, int, int);

typedef struct {
    char  _pad[0xedc];
    fn3_t fn_edc;
} ctx_edc_t;

void func_02032a00(int a, int b, int c, ctx_edc_t *ctx) {
    fn3_t f = ctx->fn_edc;
    if (f != 0) f(a, b, c);
}
