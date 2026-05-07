/* func_020aee3c: halfword (wide-char) strlen — counts u16 elements
 * until the zero terminator.
 *
 *     mvn r2, #0x0
 *  .L_020aee40:
 *     ldrh r1, [r0], #0x2    ; r1 = *(u16*)r0; r0 += 2
 *     add r2, r2, #0x1
 *     cmp r1, #0x0
 *     bne .L_020aee40
 *     mov r0, r2
 *     bx  lr
 */

int func_020aee3c(const unsigned short *s) {
    int n = -1;
    do {
        n++;
    } while (*s++);
    return n;
}
