/* func_02037328: P-9 early-return — negative-flag path + array lookup + 0xff sentinel.
 *
 *     push  {r4, lr}
 *     movs  r4, r1
 *     bpl   .L_020373b8           ; if arg >= 0, skip
 *     bl    func_02034a34
 *     tst   r0, #0x1000000
 *     lsreq r1, r0, #0x14
 *     andeq r1, r1, #0xf
 *     cmpeq r1, #0x1
 *     bne   .L_020373b8
 *     ldr   r1, .L_020373c8
 *     lsl   r0, r0, #0x10
 *     ldr   r2, [r1, #0x34]
 *     lsr   r1, r0, #0x10
 *     mov   r0, #0xc
 *     mla   r0, r1, r0, r2
 *     ldrb  r4, [r0, #0x6]
 * .L_020373b8:
 *     cmp   r4, #0xff
 *     mvneq r4, #0x0
 *     mov   r0, r4
 *     pop   {r4, pc}
 * .L_020373c8: .word data_0219b200
 */

typedef struct {
    char                _pad[0x34];
    unsigned char      *array;       /* +0x34 */
} container_02037378_t;

extern container_02037378_t data_0219b200;
extern unsigned int func_02034a34(void);

int func_02037328(int unused, int arg1) {
    int v = arg1;
    if (arg1 < 0) {
        unsigned int x = func_02034a34();
        if ((x & 0x01000000) == 0 && ((x >> 0x14) & 0xf) == 1) {
            unsigned short idx = (unsigned short)x;
            unsigned char *p = &data_0219b200.array[idx * 0xc];
            v = p[6];
        }
    }
    if (v == 0xff) v = -1;
    return v;
}
