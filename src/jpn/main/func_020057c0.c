/* func_020057c0: store-arg + zero-4-fields helper. Simple struct-init.
 *
 *     ldr   r1, .L_020057fc      ; r1 = &data_02103fcc
 *     mov   r2, #0x0
 *     str   r0, [r1, #0x0]       ; data_02103fcc.f_0 = arg
 *     str   r2, [r1, #0xb6c]     ; clear 4 fields at +0xb6c..+0xb78
 *     str   r2, [r1, #0xb70]
 *     str   r2, [r1, #0xb74]
 *     str   r2, [r1, #0xb78]
 *     bx    lr
 */

typedef struct {
    void *f_0;
    char  _pad[0xb68];
    int   f_b6c;
    int   f_b70;
    int   f_b74;
    int   f_b78;
} state_020057dc_t;

extern state_020057dc_t data_02103fcc;

void func_020057c0(void *arg) {
    data_02103fcc.f_0 = arg;
    data_02103fcc.f_b6c = 0;
    data_02103fcc.f_b70 = 0;
    data_02103fcc.f_b74 = 0;
    data_02103fcc.f_b78 = 0;
}
