/* func_ov011_021d1f9c: index the 0xa-stride table at row (a0-1), column
 * (a1-1), and forward the looked-up byte to func_ov011_021d1f04 with a2.
 *
 *     ldr   r3, =data_ov011_021d35ec
 *     sub   ip, r0, #0x1
 *     mov   r0, #0xa
 *     mla   r0, ip, r0, r3
 *     sub   r1, r1, #0x1
 *     ldrb  r0, [r1, r0]
 *     mov   r1, r2
 *     bl    func_ov011_021d1f04
 */

extern char data_ov011_021d35ec[];
extern void func_ov011_021d1f04(int val, int a2);

void func_ov011_021d1f9c(int a0, int a1, int a2) {
    func_ov011_021d1f04(*(unsigned char *)(data_ov011_021d35ec + (a0 - 1) * 0xa + (a1 - 1)), a2);
}
