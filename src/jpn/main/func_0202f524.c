/* func_0202f524: C-42 — conditional helper2 + literal-1 + tail-call.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_0202ea74         ; helper1(self)
 *   cmp r0, #0; movne r0, #1; popne          ; if != 0, return 1
 *   mov r0, r4
 *   bl func_0202ed3c         ; helper2(self) — tail-call return value
 *   pop {r4, pc}
 */

extern int func_0202ea74(void *self);
extern int func_0202ed3c(void *self);

int func_0202f524(void *self) {
    if (func_0202ea74(self) != 0) return 1;
    return func_0202ed3c(self);
}
