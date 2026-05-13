/* func_0203c6a8: return data + arg * 0xc4. Pointer to slot in
 * a 0xc4-byte stride array.
 *
 *     ldr r2, =data
 *     mov r1, #0xc4
 *     mla r0, r1, r0, r2     ; r0 = arg * 0xc4 + r2
 *     bx  lr
 */

extern char data_0219d2a8[];
void *func_0203c6a8(int idx) {
    return (char *)data_0219d2a8 + idx * 0xc4;
}
