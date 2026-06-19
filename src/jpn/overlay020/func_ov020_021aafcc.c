/* func_ov020_021aafcc: clear the 0xaa0-offset region of the work buffer,
 * sized by the current page count * 0x360.
 *
 *     bl    func_0208de58
 *     ldr   r2, =data_ov020_021adf80
 *     mov   r1, #0x360
 *     ldr   r3, [r2, #0x8d8]
 *     mul   r2, r3, r1
 *     add   r1, r0, #0xaa0
 *     mov   r0, #0x0
 *     bl    func_02094398
 */

extern void *func_0208de58(void);
extern char data_ov020_021adf80[];
extern void func_02094398(int val, void *dest, unsigned int size);

void func_ov020_021aafcc(void) {
    char *buf = (char *)func_0208de58();
    func_02094398(0, buf + 0xaa0, *(int *)(data_ov020_021adf80 + 0x8d8) * 0x360);
}
