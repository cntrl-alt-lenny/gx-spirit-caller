/* func_020336b8: thunk — `func_02052ff4(p + 0xe3c)`.
 *
 *     ldr ip, =func_02052ff4
 *     add r0, r0, #0x23c
 *     add r0, r0, #0xc00     ; total: +0xe3c (split because not rot-8)
 *     bx  ip
 */

extern void func_02052ff4(void *p);

void func_020336b8(void *p) {
    func_02052ff4((char *)p + 0xe3c);
}
