/* func_0207d318: u32 getter at *negative* offset -0xc.
 *
 *     ldr r0, [r0, #-0xc]
 *     bx  lr
 *
 * The caller passes a pointer that has already been offset 0xc bytes
 * into a struct; this routine reads the word at the struct base. A
 * classic pattern for accessing a "header" field through a mid-struct
 * handle.
 */

int func_0207d318(void *p) {
    return *(int *)((char *)p - 0xc);
}
