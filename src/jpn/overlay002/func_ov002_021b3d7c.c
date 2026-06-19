/* func_ov002_021b3d7c: recovered C-42 resister (brief 254). 2-D table
 * lookup: *(u16*)(base + (arg0&1)*stride + arg1*20), then
 * helper(val, arg2, arg3). base/stride pool-load into the mla.
 *
 *     push  {r4, lr}
 *     ldr   ip, .L      ; .word 0x868   (stride)
 *     mov   lr, #0x14 ; mul lr, r1, lr            ; arg1 * 20
 *     ldr   r1, .L      ; .word data_ov002_022cf0c6 (base)
 *     and   r4, r0, #0x1                          ; arg0 & 1
 *     mla   r0, r4, ip, r1                        ; (arg0&1)*stride + base
 *     mov   r1, r2                                ; arg2
 *     ldrh  r0, [lr, r0]                          ; *(u16*)(arg1*20 + ...)
 *     mov   r2, r3                                ; arg3
 *     bl    func_ov002_021b3c9c
 *     pop   {r4, pc}
 */

typedef unsigned short u16;

extern char data_ov002_022cf0c6[];
extern int func_ov002_021b3c9c(u16 val, int a2, int a3);

int func_ov002_021b3d7c(int arg0, int arg1, int a2, int a3) {
    u16 val = *(u16 *)(data_ov002_022cf0c6 + (arg0 & 1) * 0x868 + arg1 * 20);
    return func_ov002_021b3c9c(val, a2, a3);
}
