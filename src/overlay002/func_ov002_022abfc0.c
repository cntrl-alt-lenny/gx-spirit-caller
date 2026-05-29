/* func_ov002_022abfc0: recovered C-42 resister (brief 254). The orig
 * keeps 3 explicit compares; mwcc -O4 fuses an `==`-chain into a range
 * check, so use the SWITCH form (defeats the fusion — brief 254 got
 * 13/13 byte-identical).
 *
 *     push  {r3, lr}
 *     ldr   r2, [r0, #0x4]
 *     rsb   r2, r2, #0x0        ; n = -self->f4
 *     cmp   r2, #0x4b
 *     cmpne r2, #0x4c
 *     cmpne r2, #0x4d
 *     bne   .L
 *     mov   r0, #0x0 ; pop {r3, pc}     ; return 0
 *  .L:
 *     ldr   r0, [r0, #0x68]
 *     ldr   r0, [r0, r1, lsl #0x2]      ; self->f68[idx]
 *     bl    func_ov002_021afc6c
 *     pop   {r3, pc}
 */

struct S2b07 {
    char _pad4[4];
    int f4;
    char _pad8[0x60];
    int *f68;
};

extern int func_ov002_021afc6c(int v);

int func_ov002_022abfc0(struct S2b07 *self, int idx) {
    int n = -self->f4;
    switch (n) {
    case 0x4b:
    case 0x4c:
    case 0x4d:
        return 0;
    }
    return func_ov002_021afc6c(self->f68[idx]);
}
