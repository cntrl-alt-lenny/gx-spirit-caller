/* func_0200bef4: bit-position-to-index for single-bit values. Returns the
 * index 0..6 of the set bit in {0x8, 0x10, 0x20, 0x40, 0x80, 0x100, 0x200},
 * or 7 if x doesn't match any of them.
 *
 *     cmp   r0, #0x8     ; moveq r0, #0  ; bxeq lr
 *     cmp   r0, #0x10    ; moveq r0, #1  ; bxeq lr
 *     cmp   r0, #0x20    ; moveq r0, #2  ; bxeq lr
 *     cmp   r0, #0x40    ; moveq r0, #3  ; bxeq lr
 *     cmp   r0, #0x80    ; moveq r0, #4  ; bxeq lr
 *     cmp   r0, #0x100   ; moveq r0, #5  ; bxeq lr
 *     cmp   r0, #0x200
 *     moveq r0, #0x6
 *     movne r0, #0x7
 *     bx    lr
 *
 * 22 insns = 0x58 bytes. The 7-way equality ladder is the same shape as
 * func_02018abc but with EQ instead of LT, and a single-mov default at
 * the tail. Byte-identical clone of func_0200bf4c.
 */

int func_0200bef4(int x) {
    if (x == 0x008) return 0;
    if (x == 0x010) return 1;
    if (x == 0x020) return 2;
    if (x == 0x040) return 3;
    if (x == 0x080) return 4;
    if (x == 0x100) return 5;
    if (x == 0x200) return 6;
    return 7;
}
