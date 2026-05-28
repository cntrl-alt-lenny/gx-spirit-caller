/* func_02034360: C-42 — helper-check (returns ptr) + memset-helper at +0x448.
 *
 *   push {r3, lr}
 *   bl func_02034184()
 *   cmp r0, #0; popeq
 *   add r0, r0, #0x48; add r0, r0, #0x400      ; ptr + 0x448 (split immediate)
 *   mov r1, #0; mov r2, #0x3c
 *   bl func_020945f4(p+0x448, 0, 0x3c)
 *   pop
 */

extern void *func_02034184(void);
extern void func_020945f4(void *p, int val, int size);

void func_02034360(void) {
    void *p = func_02034184();
    if (p == 0) return;
    func_020945f4((char *)p + 0x448, 0, 0x3c);
}
