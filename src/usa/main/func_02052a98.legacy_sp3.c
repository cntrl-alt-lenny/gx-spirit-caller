/* func_02052a98: stmfd-only + arg shuffle (a, b, c) → helper(1, a, b, c).
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     mov ip, r1; mov r3, r2; mov r1, r0; mov r2, ip
 *     mov r0, #1; bl func_02052974(1, a, b, c)
 *     pop
 */
extern void func_02052974(int k, int a, int b, int c);

void func_02052a98(int a, int b, int c) {
    func_02052974(1, a, b, c);
}
