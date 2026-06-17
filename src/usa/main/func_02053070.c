/* func_02053070: C-42 — helper-check + signed field check + bool tail.
 *
 *   push {r4, lr}; mov r4, r0
 *   add r0, r4, #0x10
 *   bl func_0205312c(&self->f10)
 *   cmp r0, #0; beq L0
 *   ldr r0, [r4, #0x1c]
 *   cmp r0, #0; movgt r0, #1; popgt
 *   L0: mov r0, #0; pop
 */

struct F020530e4 {
    char pad[16];
    int f10;
    char pad2[8];
    int f1c;
};

extern int func_0205312c(int *p);

int func_02053070(struct F020530e4 *self) {
    if (func_0205312c(&self->f10) != 0) {
        if (self->f1c > 0) return 1;
    }
    return 0;
}
