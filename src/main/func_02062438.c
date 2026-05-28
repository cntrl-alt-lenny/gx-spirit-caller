/* func_02062438: pattern 6 — pointer-double-store with reg-swap.
 *
 *     push  {r4, lr}
 *     mov   r4, r1
 *     bl    helper
 *     cmp   r0, #0
 *     popne {r4, pc}
 *     ldr   r0, [r4]               ; 1st reload to r0
 *     mov   r1, #2
 *     str   r1, [r0, #12]
 *     ldr   r1, [r4]               ; 2nd reload to r1 (swapped!)
 *     mov   r0, #0
 *     str   r0, [r1, #16]
 *     pop   {r4, pc}
 *
 * Brief 244 pattern 6 (pointer-double-store reg choice). Recipe:
 * `int func + return helper_ret` form (gotcha 8 family). Keeps the
 * helper's return value "live" until the end, forcing the 2nd
 * reload to a different register from r0.
 */
struct Func02062438Target {
    char pad[12];
    int f12;
    int f16;
};

extern int func_02064864(void);

int func_02062438(int arg0, struct Func02062438Target **pp) {
    int r = func_02064864();
    if (r) return r;
    (*pp)->f12 = 2;
    (*pp)->f16 = 0;
    return 0;
}
