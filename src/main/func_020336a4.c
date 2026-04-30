/* func_020336a4: thunk — `func_02053018(p + 0xe3c)`.
 *
 *     ldr ip, =func_02053018
 *     add r0, r0, #0x23c
 *     add r0, r0, #0xc00     ; total: +0xe3c (split because not rot-8)
 *     bx  ip
 */

extern void func_02053018(void *p);

void func_020336a4(void *p) {
    func_02053018((char *)p + 0xe3c);
}
