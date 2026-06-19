/* func_ov004_021d3ce8: wrapper — calls func_ov004_021d37d4 then writes
 * 1 to *(ret + 0x254).
 *
 *     push  {r3, lr}
 *     bl    func_ov004_021d37d4
 *     mov   r1, #1
 *     str   r1, [r0, #0x254]
 *     pop   {r3, pc}
 *
 * The callee returns a pointer (r0); we set a flag at offset 0x254.
 */

extern char *func_ov004_021d37d4(void);

void func_ov004_021d3ce8(void) {
    *(int *)(func_ov004_021d37d4() + 0x254) = 1;
}
