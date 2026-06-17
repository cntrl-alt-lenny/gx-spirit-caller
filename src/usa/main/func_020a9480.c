/* func_020a9480: C-42 — 3-arg shuffle + 4-arg helper + cmp-set-zero.
 *
 *   push {r3, r4, r5, lr}
 *   mov r5, r0; mov r0, r1; mov r3, r5; mov r1, #1; mov r4, r2
 *   bl func_020a6d58(arg1, 1, arg2, arg0)
 *   cmp r4, r0; movne r5, #0
 *   mov r0, r5; pop
 */

extern int func_020a6d58(int a, int b, int c, int d);

int func_020a9480(int a, int b, int c) {
    int r = a;
    if (c != func_020a6d58(b, 1, c, a)) r = 0;
    return r;
}
