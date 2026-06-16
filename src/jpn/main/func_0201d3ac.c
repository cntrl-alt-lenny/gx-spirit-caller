/* func_0201d3ac: C-42 — 2-helper void thunk + global field zero-write.
 *
 *   push {r3, lr}
 *   mov r0, #0; bl func_020203e8       ; (0)
 *   mov r0, #0; bl func_02005820       ; (0)
 *   ldr r0, [pc, #N]; mov r1, #0; str r1, [r0, #20]   ; data_0218fddc[20] = 0
 *   pop
 */

extern void func_020203e8(int x);
extern void func_02005820(int x);
extern char data_0218fddc[];

void func_0201d3ac(void) {
    func_020203e8(0);
    func_02005820(0);
    ((int *)data_0218fddc)[5] = 0;  /* offset 20 = index 5 in int array */
}
