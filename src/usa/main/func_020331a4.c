/* func_020331a4: thunk — `func_02053008(p + 0xe34)`.
 *
 *     ldr ip, =func_02053008
 *     add r0, r0, #0x234
 *     add r0, r0, #0xc00     ; total: +0xe34 (split because not rot-8)
 *     bx  ip
 */

extern void func_02053008(void *p);

void func_020331a4(void *p) {
    func_02053008((char *)p + 0xe34);
}
