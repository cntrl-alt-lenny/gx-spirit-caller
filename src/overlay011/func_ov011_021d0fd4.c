/* func_ov011_021d0fd4: bitfield RMW into row of 0x28-byte structs. Uses
 * `mla` for the row-address computation. Byte-pointer arithmetic in C
 * source encourages mwcc to fuse mul+add into mla.
 *
 *     ldr   r3, .L_021d0ff8           ; data_021d4660 (base)
 *     mov   r2, #0x28                  ; stride
 *     mla   r3, r0, r2, r3             ; row = idx*stride + base
 *     ldr   r2, [r3, #0x8]
 *     and   r0, r1, #0x3
 *     bic   r1, r2, #0x3
 *     orr   r0, r1, r0
 *     str   r0, [r3, #0x8]
 *     bx    lr
 */

extern char data_ov011_021d4660[];

void func_ov011_021d0fd4(int idx, unsigned int val) {
    unsigned int *p = (unsigned int *)(data_ov011_021d4660 + idx * 0x28 + 0x8);
    *p = (*p & ~0x3u) | (val & 0x3u);
}
