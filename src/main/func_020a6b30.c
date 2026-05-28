/* func_020a6b30: pattern N1 — sub-shape 2 with trailing helper.
 *
 *     push  {r3, lr}
 *     mov   r0, #1
 *     bl    helper1
 *     ldr   r1, [pc, #12]
 *     mov   r0, #1
 *     str   r0, [r1, #12]
 *     bl    helper2
 *     pop   {r3, pc}
 *
 * Brief 248 pattern N1. Recipe: make the trailing helper take the
 * same LIT as the field write. mwcc CSEs `mov r0, #1` across the
 * field write AND the bl call, forcing the pool address to r1
 * (not r0).
 *
 * This is a generalization of brief 242's gotcha 8 (return-matches-
 * last-LIT) — same trick but the "consumer" of the matched r0 is a
 * trailing helper call instead of a function return. Catalogued as
 * NEW gotcha 12.
 */
struct Func020a6b30PoolStruct {
    char pad[12];
    int f12;
};
extern struct Func020a6b30PoolStruct data_021a9f30;
extern void func_020aacac(int x);
extern void func_020a6b54(int x);

void func_020a6b30(void) {
    func_020aacac(1);
    data_021a9f30.f12 = 1;
    func_020a6b54(1);
}
