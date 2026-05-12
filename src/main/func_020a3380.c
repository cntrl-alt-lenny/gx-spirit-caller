/* func_020a3380: halfword strlen. Shared epilogue (single `mov r0, r2;
 * bx lr` at tail; `beq` skips the loop to land there).
 *
 *     ldrh r1, [r0], #0x2
 *     mov  r2, #0x0
 *     cmp  r1, #0x0
 *     beq  .L_020a33a0
 *  .L_020a3390:
 *     ldrh r1, [r0], #0x2
 *     add  r2, r2, #0x1
 *     cmp  r1, #0x0
 *     bne  .L_020a3390
 *  .L_020a33a0:
 *     mov  r0, r2
 *     bx   lr
 */

int func_020a3380(const unsigned short *s) {
    unsigned short c = *s++;
    int n = 0;
    if (c != 0) {
        do {
            c = *s++;
            n++;
        } while (c != 0);
    }
    return n;
}
