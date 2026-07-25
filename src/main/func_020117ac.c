/* func_020117ac: 2-bound check (0, 99) + table lookup stride 4.
 *
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     bxeq  lr
 *     cmp   r0, #0x63
 *     movge r0, #0x0
 *     bxge  lr
 *     sub   r1, r0, #0x1
 *     ldr   r0, .L_020117d8       ; data_020b4bd4
 *     lsl   r1, r1, #0x2
 *     ldrh  r0, [r0, r1]
 *     bx    lr
 */

typedef struct {
    unsigned short field0;
    unsigned short field1;
} Record020b4bd4;

extern const Record020b4bd4 data_020b4bd4[];

unsigned int func_020117ac(int i) {
    if (i == 0) return 0;
    if (i >= 0x63) return 0;
    return data_020b4bd4[i - 1].field0;
}
