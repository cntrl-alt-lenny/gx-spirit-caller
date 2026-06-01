/* func_ov011_021d0f8c: store a coordinate pair into the two parallel
 * stride-0x28 actor arrays at +0x4670 / +0x4674.
 *
 *     mov   r3, #0x28
 *     mul   ip, r0, r3
 *     ldr   r3, =data_ov011_021d4670
 *     ldr   r0, =data_ov011_021d4674
 *     str   r1, [r3, ip]
 *     str   r2, [r0, ip]
 *     bx    lr
 */

extern char data_ov011_021d4670[];
extern char data_ov011_021d4674[];

void func_ov011_021d0f8c(int idx, int x, int y) {
    *(int *)(data_ov011_021d4670 + idx * 0x28) = x;
    *(int *)(data_ov011_021d4674 + idx * 0x28) = y;
}
