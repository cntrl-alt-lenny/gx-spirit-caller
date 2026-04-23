/* func_ov011_021d091c: 2-field setter on data_021040ac at +0x3c, +0x40.
 *
 *     ldr r0, .L = data_021040ac
 *     mov r1, #0x17
 *     str r1, [r0, #0x3c]           ; data.a = 0x17
 *     mov r1, #0x0
 *     str r1, [r0, #0x40]           ; data.b = 0
 *     bx  lr
 *
 * Uses struct typedef to force base+offset codegen (see ov015_021b3f80).
 */

typedef struct {
    char _pad[0x3c];
    int field_3c;
    int field_40;
} data_021040ac_t;

extern data_021040ac_t data_021040ac;

void func_ov011_021d091c(void) {
    data_021040ac.field_3c = 0x17;
    data_021040ac.field_40 = 0;
}
