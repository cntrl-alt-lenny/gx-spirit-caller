/* func_020068fc: 3-iteration loop calling func_0207d238(*p, callback, i).
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   r5, .L_02006948       ; r5 = func_02006898 (callback)
 *     ldr   r4, .L_0200694c       ; r4 = &data_02104e3c
 *     mov   r6, #0x0
 *   .L_02006928:
 *     ldr   r0, [r4, #0x1c]
 *     mov   r1, r5
 *     mov   r2, r6
 *     bl    func_0207d238
 *     add   r6, r6, #0x1
 *     cmp   r6, #0x3
 *     blt   .L_02006928
 *     pop   {r4, r5, r6, pc}
 */

typedef struct {
    char _pad0[0x1c];
    int  f_1c;
} state_02006918_t;

extern state_02006918_t data_02104e3c;
extern void func_02006898(void);
extern void func_0207d238(int p, void *cb, int i);

void func_020068fc(void) {
    int i;
    for (i = 0; i < 3; i++) {
        func_0207d238(data_02104e3c.f_1c, func_02006898, i);
    }
}
