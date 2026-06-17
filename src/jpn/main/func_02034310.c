/* func_02034310: C-42 — helper-check (returns ptr) + memset-helper at +0x448.
 *
 *   push {r3, lr}
 *   bl func_02034134()
 *   cmp r0, #0; popeq
 *   add r0, r0, #0x48; add r0, r0, #0x400      ; ptr + 0x448 (split immediate)
 *   mov r1, #0; mov r2, #0x3c
 *   bl func_02094500(p+0x448, 0, 0x3c)
 *   pop
 */

extern void *func_02034134(void);
extern void func_02094500(void *p, int val, int size);

void func_02034310(void) {
    void *p = func_02034134();
    if (p == 0) return;
    func_02094500((char *)p + 0x448, 0, 0x3c);
}
