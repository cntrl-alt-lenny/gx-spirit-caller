/* func_ov010_021b3464: family 619c229d — write func_0201ed20(x,
 * data->f8) to *out0 and func_0201ece8(y, data->fc) to *out1. The base
 * pool is reloaded per access (the first call clobbers it).
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   ip, .L_021b35a0      ; .word data_ov010_021b8960
 *     mov   r5, r1               ; out1
 *     ldr   r1, [ip, #0x8]
 *     mov   r6, r0               ; out0
 *     mov   r0, r2               ; x
 *     mov   r4, r3               ; y
 *     bl    func_0201ed20        ; (x, data->f8)
 *     str   r0, [r6, #0x0]
 *     ldr   r1, .L_021b35a0
 *     mov   r0, r4
 *     ldr   r1, [r1, #0xc]
 *     bl    func_0201ece8        ; (y, data->fc)
 *     str   r0, [r5, #0x0]
 *     pop   {r4, r5, r6, pc}
 */

struct D619 {
    char pad[8];
    int f8;
    int fc;
};

extern struct D619 data_ov010_021b8960;
extern int func_0201ed20(int x, int v);
extern int func_0201ece8(int y, int v);

void func_ov010_021b3464(int *out0, int *out1, int x, int y) {
    *out0 = func_0201ed20(x, data_ov010_021b8960.f8);
    *out1 = func_0201ece8(y, data_ov010_021b8960.fc);
}
