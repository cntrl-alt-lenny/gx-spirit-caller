/* func_ov015_021b30b0: family 619c229d sibling of ov010_021b3564. Same
 * shape; per-overlay global is data_ov015_021b5ba0 (NOT ov010's — same
 * code, different per-overlay symbol, per the brief-251 caveat).
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   ip, .L_021b30ec      ; .word data_ov015_021b5ba0
 *     mov   r5, r1
 *     ldr   r1, [ip, #0x8]
 *     mov   r6, r0
 *     mov   r0, r2
 *     mov   r4, r3
 *     bl    func_0201ed74
 *     str   r0, [r6, #0x0]
 *     ldr   r1, .L_021b30ec
 *     mov   r0, r4
 *     ldr   r1, [r1, #0xc]
 *     bl    func_0201ed3c
 *     str   r0, [r5, #0x0]
 *     pop   {r4, r5, r6, pc}
 */

struct D619 {
    char pad[8];
    int f8;
    int fc;
};

extern struct D619 data_ov015_021b5ba0;
extern int func_0201ed74(int x, int v);
extern int func_0201ed3c(int y, int v);

void func_ov015_021b30b0(int *out0, int *out1, int x, int y) {
    *out0 = func_0201ed74(x, data_ov015_021b5ba0.f8);
    *out1 = func_0201ed3c(y, data_ov015_021b5ba0.fc);
}
