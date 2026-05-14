/* func_02006918: 3-iteration loop calling func_0207d320(*p, callback, i).
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   r5, .L_02006948       ; r5 = func_020068b4 (callback)
 *     ldr   r4, .L_0200694c       ; r4 = &data_02104f1c
 *     mov   r6, #0x0
 *   .L_02006928:
 *     ldr   r0, [r4, #0x1c]
 *     mov   r1, r5
 *     mov   r2, r6
 *     bl    func_0207d320
 *     add   r6, r6, #0x1
 *     cmp   r6, #0x3
 *     blt   .L_02006928
 *     pop   {r4, r5, r6, pc}
 */

typedef struct {
    char _pad0[0x1c];
    int  f_1c;
} state_02006918_t;

extern state_02006918_t data_02104f1c;
extern void func_020068b4(void);
extern void func_0207d320(int p, void *cb, int i);

void func_02006918(void) {
    int i;
    for (i = 0; i < 3; i++) {
        func_0207d320(data_02104f1c.f_1c, func_020068b4, i);
    }
}
