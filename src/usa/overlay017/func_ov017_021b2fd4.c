/* func_ov017_021b2fd4: scene controller tick — if a transfer is pending
 * (ctrl->f8c), run func_0201eee8 and clear it; then clear the BG0 mosaic
 * field on both the main and sub display. Returns 1.
 *
 *     ldr r0,[r4,#0x8c]; cmp r0,#0; beq .skip
 *     ldr r0,[r4,#0x10]; add r1,r4,#0x18; add r2,r4,#0x8c; bl func_0201eee8
 *     mov r0,#0; str r0,[r4,#0x90]; str r0,[r4,#0x8c]
 *  .skip: 0x04000000 &= ~0x1f00; 0x04001000 &= ~0x1f00; return 1
 */

extern void func_0201eee8(int a, void *b, void *c);

int func_ov017_021b2fd4(char *ctrl) {
    if (*(int *)(ctrl + 0x8c) != 0) {
        func_0201eee8(*(int *)(ctrl + 0x10), ctrl + 0x18, ctrl + 0x8c);
        *(int *)(ctrl + 0x90) = 0;
        *(int *)(ctrl + 0x8c) = 0;
    }
    *(volatile int *)0x04000000 &= ~0x1f00;
    *(volatile int *)0x04001000 &= ~0x1f00;
    return 1;
}
