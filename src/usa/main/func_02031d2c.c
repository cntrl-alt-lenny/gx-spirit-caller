/* func_02031d2c: pass-through indirect dispatcher to data->fnptr_0xc(arg).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr r1, .L_02031d94
 *     ldr r1, [r1, #0xc]       ; r1 = data->fnptr_0xc
 *     blx r1                    ; (r0 already holds caller's arg)
 *     ldmia sp!, {r3, pc}
 *  .L_02031d94: .word data_0219acd8
 *
 * mwcc materializes the fn-ptr into r1 (not r0) because r0 is reserved
 * for the unmodified caller argument that is forwarded to the callee.
 */

typedef int (*fn_int_t)(int arg);

typedef struct {
    char     _pad[0xc];
    fn_int_t fnptr_c;
} data_0219adb8_t;

extern data_0219adb8_t data_0219acd8;

int func_02031d2c(int arg) {
    return data_0219acd8.fnptr_c(arg);
}
