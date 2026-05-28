/* func_02088518: C-42 — null-check + helper(field) + zero fields.
 *
 *   push {r4, lr}; mov r4, r0
 *   ldr r0, [r4, #68]; cmp r0, #0; popeq
 *   bl func_020873cc
 *   mov r0, #0; str r0, [r4, #68]; str r0, [r4, #72]; pop
 */

struct F02088518 {
    char pad[68];
    int f44;
    int f48;
};

extern void func_020873cc(int x);

void func_02088518(struct F02088518 *self) {
    if (self->f44 == 0) return;
    func_020873cc(self->f44);
    self->f44 = 0;
    self->f48 = 0;
}
