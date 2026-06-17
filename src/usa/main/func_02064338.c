/* func_02064338: C-42 — null-check + helper with literals.
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_02062888(self)
 *   cmp r0, #0; moveq r0, #0; popeq    ; orig HAS moveq -> use `return 0`
 *   mov r0, r4; mov r1, #1; mov r2, #4
 *   bl func_02064378(self, 1, 4); pop
 */

extern int func_02062888(void *self);
extern int func_02064378(void *self, int a, int b);

int func_02064338(void *self) {
    if (func_02062888(self) == 0) return 0;
    return func_02064378(self, 1, 4);
}
