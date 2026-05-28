/* func_020643ac: C-42 — null-check + helper with literals.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_020628fc(self)
 *   cmp r0, #0; moveq r0, #0; popeq    ; orig HAS moveq -> use `return 0`
 *   mov r0, r4; mov r1, #1; mov r2, #4
 *   bl func_020643ec(self, 1, 4); pop
 */

extern int func_020628fc(void *self);
extern int func_020643ec(void *self, int a, int b);

int func_020643ac(void *self) {
    if (func_020628fc(self) == 0) return 0;
    return func_020643ec(self, 1, 4);
}
