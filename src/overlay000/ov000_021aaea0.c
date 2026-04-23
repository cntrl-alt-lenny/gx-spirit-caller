/* func_ov000_021aaea0: zero word at +0, clear bit-31 on word at +0x44.
 *
 *     mov r1, #0x0
 *     str r1, [r0, #0x0]            ; obj->f0 = 0
 *     ldr r1, [r0, #0x44]
 *     bic r1, r1, #0x80000000       ; clear bit 31 of obj->f44
 *     str r1, [r0, #0x44]
 *     bx  lr
 */

void func_ov000_021aaea0(void *p) {
    char *obj = (char *)p;
    *(int *)(obj + 0x0) = 0;
    *(unsigned *)(obj + 0x44) &= ~0x80000000u;
}
