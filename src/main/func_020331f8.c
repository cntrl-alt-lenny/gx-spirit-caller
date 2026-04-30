/* func_020331f8: thunk — `func_0205307c(p + 0xe3c)`.
 *
 *     ldr ip, =func_0205307c
 *     add r0, r0, #0x23c
 *     add r0, r0, #0xc00     ; total: +0xe3c (split because not rot-8)
 *     bx  ip
 */

extern void func_0205307c(void *p);

void func_020331f8(void *p) {
    func_0205307c((char *)p + 0xe3c);
}
