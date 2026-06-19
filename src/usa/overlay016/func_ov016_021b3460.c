/* func_ov016_021b3460: C-43 packed stack-local struct builder (brief
 * 250 Family 5, gotcha 13). Build a 12-byte packed local from the
 * args, pass &local to the helper. The three stack value args are
 * typed `int` so mwcc loads them with `ldr` (word) — narrowing to u16
 * happens on the `strh` store; the gaps at 4/10 are explicit u16 pads.
 *
 *     push  {r3, r4, lr}
 *     sub   sp, sp, #0xc
 *     ldr   r4, [sp, #0x18]      ; A (word)
 *     ldr   lr, [sp, #0x1c]      ; B
 *     ldr   ip, [sp, #0x20]      ; C
 *     strh  r3, [sp, #0x0]       ; local@0 = a3
 *     add   r3, sp, #0x0         ; &local
 *     strh  r4, [sp, #0x2]       ; local@2 = A
 *     strh  lr, [sp, #0x6]       ; local@6 = B  (gap at 4)
 *     strh  ip, [sp, #0x8]       ; local@8 = C
 *     bl    func_ov016_021b3398  ; helper(a0, a1, a2, &local)  (gap at 10)
 *     add   sp, sp, #0xc
 *     pop   {r3, r4, pc}
 */

typedef unsigned short u16;

struct P021b3560 {
    u16 f0;
    u16 f2;
    u16 gap4;
    u16 f6;
    u16 f8;
    u16 gap10;
};

extern void func_ov016_021b3398(int a0, int a1, int a2, void *p);

void func_ov016_021b3460(int a0, int a1, int a2, u16 a3, int A, int B, int C) {
    struct P021b3560 local;
    local.f0 = a3;
    local.f2 = A;
    local.f6 = B;
    local.f8 = C;
    func_ov016_021b3398(a0, a1, a2, &local);
}
