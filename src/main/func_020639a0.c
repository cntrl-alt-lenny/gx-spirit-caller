/* func_020639a0: C-42 — null-check + struct field write + helper.
 *
 *   push {r4, lr}; mov r4, r0
 *   ldr r0, [r4, #144]; cmp r0, #0; popne
 *   mov r0, #1; str r0, [r4, #144]
 *   bl func_02055330
 *   str r0, [r4, #148]
 *   pop
 */

struct F020639a0 {
    char pad[144];
    int f144;
    int f148;
};

extern int func_02055330(void);

void func_020639a0(struct F020639a0 *self) {
    if (self->f144 != 0) return;
    self->f144 = 1;
    self->f148 = func_02055330();
}
