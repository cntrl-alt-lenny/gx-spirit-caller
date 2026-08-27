/* func_ov004_021cec98: gated by b500.f228 (active flag), dispatch on
 * b500.f22c (mode selector, 0-4): modes 0-2 compare mode==f230; mode 3
 * checks f230==4; mode 4 checks f230==3; mode>4 (or inactive) returns 0.
 *
 *     ldr   r2, .L_LIT0          ; data_ov004_0220b2a0
 *     ldr   r0, [r2, #0x228]
 *     cmp   r0, #0x0
 *     moveq r0, #0x0
 *     bxeq  lr
 *     ...
 *     bx    lr
 */

extern char data_ov004_0220b2a0[];

int func_ov004_021cec98(void) {
    char *b = data_ov004_0220b2a0;
    int sel;

    if (*(int *)(b + 0x228) == 0) return 0;

    sel = *(int *)(b + 0x22c);
    switch (sel) {
    case 0:
    case 1:
    case 2:
        return (sel == *(int *)(b + 0x230)) ? 1 : 0;
    case 3:
        return (*(int *)(b + 0x230) == 4) ? 1 : 0;
    case 4:
        return (*(int *)(b + 0x230) == 3) ? 1 : 0;
    }
    return 0;
}
