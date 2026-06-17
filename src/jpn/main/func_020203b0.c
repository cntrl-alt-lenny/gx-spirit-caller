/* func_020203b0: C-42 — u16-field branch + helper(10 or 0).
 *
 *   push {r3, lr}
 *   ldrh r0, [r0, #2]
 *   cmp r0, #0
 *   beq .else
 *   mov r0, #10; bl func_0201f0e4; pop
 *   .else: mov r0, #0; bl func_0201f0e4; pop
 */

struct F02020404 {
    unsigned short pad0;
    unsigned short f2;
};

extern void func_0201f0e4(int x);

void func_020203b0(struct F02020404 *self) {
    if (self->f2 != 0) {
        func_0201f0e4(10);
    } else {
        func_0201f0e4(0);
    }
}
