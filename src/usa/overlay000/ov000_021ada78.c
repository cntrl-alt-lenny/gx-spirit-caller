/* func_ov000_021ada78: pass-through indirect dispatcher to
 * `(*ov000_state.fnptr_1a4)(arg)`. Same shape as func_02031d2c.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r1, .L_021adb6c
 *     ldr r1, [r1, #0x1a4]
 *     blx r1
 *     ldmia sp!, {r3, pc}
 *  .L_021adb6c: .word data_ov000_021c74ac
 */

typedef int (*fn_int_t)(int arg);

typedef struct {
    char     _pad[0x1a4];
    fn_int_t fnptr_1a4;
} ov000_758c_1a4_t;

extern ov000_758c_1a4_t data_ov000_021c74ac;

int func_ov000_021ada78(int arg) {
    return data_ov000_021c74ac.fnptr_1a4(arg);
}
