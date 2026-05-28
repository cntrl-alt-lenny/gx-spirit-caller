/* func_0207dcf8: C-42 — E5 chain (orig has redundant moveq r0, #0).
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_02097528; cmp r0, #0; moveq r0, #0; popeq
 *   mov r0, r4; bl func_02097668; mov r0, #1; pop
 *
 * Orig emits the moveq r0, #0 (redundant); recipe form `if (h() == 0)
 * return 0;` produces it. The brief 237 gotcha's `int r = h(); if (r ==
 * 0) return r;` form would SKIP the moveq, mismatching this pick.
 */

extern int func_02097528(void *self);
extern void func_02097668(void *self);

int func_0207dcf8(void *self) {
    if (func_02097528(self) == 0) return 0;
    func_02097668(self);
    return 1;
}
