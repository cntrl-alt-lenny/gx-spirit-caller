/* func_020388f0: store arg at +0x60, then mirror it to +0x5c.
 *
 *     ldr r1, .L_02038904
 *     str r0, [r1, #0x60]      ; data->f_60 = arg
 *     ldr r0, [r1, #0x60]      ; (re-load — see note)
 *     str r0, [r1, #0x5c]      ; data->f_5c = arg
 *     bx  lr
 *  .L_02038904: .word data_0219b2e0
 *
 * The reload `ldr r0, [r1, #0x60]` after the immediately-prior
 * `str r0, [r1, #0x60]` looks redundant but is forced by reading
 * a `volatile`-typed field — mwcc cannot CSE the read away.
 */

typedef struct {
    char         _pad[0x5c];
    volatile int f_5c;
    volatile int f_60;
} data_0219b2e0_t;

extern data_0219b2e0_t data_0219b2e0;

void func_020388f0(int arg) {
    data_0219b2e0.f_60 = arg;
    data_0219b2e0.f_5c = data_0219b2e0.f_60;
}
