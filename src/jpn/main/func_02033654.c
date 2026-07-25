/* func_02033654: thunk — `func_02052fa4(p + 0xe34)`.
 *
 *     ldr ip, =func_02052fa4
 *     add r0, r0, #0x234
 *     add r0, r0, #0xc00     ; total: +0xe34 (split because not rot-8)
 *     bx  ip
 */

extern void func_02052fa4(void *p);

void func_02033654(void *p) {
    func_02052fa4((char *)p + 0xe34);
}
