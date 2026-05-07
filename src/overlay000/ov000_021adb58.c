/* func_ov000_021adb58: pass-through indirect dispatcher to
 * `(*ov000_state.fnptr_1a4)(arg)`. Same shape as func_02031d80.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r1, .L_021adb6c
 *     ldr r1, [r1, #0x1a4]
 *     blx r1
 *     ldmia sp!, {r3, pc}
 *  .L_021adb6c: .word data_ov000_021c758c
 */

typedef int (*fn_int_t)(int arg);

typedef struct {
    char     _pad[0x1a4];
    fn_int_t fnptr_1a4;
} ov000_758c_1a4_t;

extern ov000_758c_1a4_t data_ov000_021c758c;

int func_ov000_021adb58(int arg) {
    return data_ov000_021c758c.fnptr_1a4(arg);
}
