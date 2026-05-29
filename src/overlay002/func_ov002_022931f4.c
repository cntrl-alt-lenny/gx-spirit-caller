/* func_ov002_022931f4: family 86235 sibling of 02203db4 — fnptr
 * func_0202e42c, tail helper func_022930ec.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0 ; ldrh r0, [r5, #0x2] ; mov r4, r1
 *     ldr   r1, .L      ; .word func_0202e42c
 *     lsl   r0, r0, #0x1f ; lsr r0, r0, #0x1f
 *     bl    func_ov002_021bc000
 *     cmp r0, #0x0 ; moveq r0, #0x0 ; popeq {r3, r4, r5, pc}
 *     mov r0, r5 ; mov r1, r4 ; bl func_ov002_022930ec
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S022931f4 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern void func_0202e42c(void);
extern int func_ov002_021bc000(int bit, void *fn);
extern int func_ov002_022930ec(struct S022931f4 *self, int arg);

int func_ov002_022931f4(struct S022931f4 *self, int arg) {
    if (func_ov002_021bc000(self->bit0, (void *)func_0202e42c) == 0) return 0;
    return func_ov002_022930ec(self, arg);
}
