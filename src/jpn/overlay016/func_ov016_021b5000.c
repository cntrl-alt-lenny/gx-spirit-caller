/* func_ov016_021b5000: C-43 packed stack-local struct builder (brief
 * 250 Family 5, gotcha 13). Sibling of 021b3560 — identical 13-insn
 * body, helper func_ov016_021b4f48. Stack value args typed `int`
 * (-> ldr), narrow on the strh store, explicit u16 pad gaps at 4/10.
 *
 *     push  {r3, r4, lr}
 *     sub   sp, sp, #0xc
 *     ldr   r4, [sp, #0x18]
 *     ldr   lr, [sp, #0x1c]
 *     ldr   ip, [sp, #0x20]
 *     strh  r3, [sp, #0x0]
 *     add   r3, sp, #0x0
 *     strh  r4, [sp, #0x2]
 *     strh  lr, [sp, #0x6]
 *     strh  ip, [sp, #0x8]
 *     bl    func_ov016_021b4f48
 *     add   sp, sp, #0xc
 *     pop   {r3, r4, pc}
 */

typedef unsigned short u16;

struct P021b5154 {
    u16 f0;
    u16 f2;
    u16 gap4;
    u16 f6;
    u16 f8;
    u16 gap10;
};

extern void func_ov016_021b4f48(int a0, int a1, int a2, void *p);

void func_ov016_021b5000(int a0, int a1, int a2, u16 a3, int A, int B, int C) {
    struct P021b5154 local;
    local.f0 = a3;
    local.f2 = A;
    local.f6 = B;
    local.f8 = C;
    func_ov016_021b4f48(a0, a1, a2, &local);
}
