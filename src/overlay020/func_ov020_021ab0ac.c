/* func_ov020_021ab0ac: clear the 0xaa0-offset region of the work buffer,
 * sized by the current page count * 0x360.
 *
 *     bl    Vram_GetBankBaseCD
 *     ldr   r2, =data_ov020_021ae060
 *     mov   r1, #0x360
 *     ldr   r3, [r2, #0x8d8]
 *     mul   r2, r3, r1
 *     add   r1, r0, #0xaa0
 *     mov   r0, #0x0
 *     bl    func_0209448c
 */

extern void *Vram_GetBankBaseCD(void);
extern char data_ov020_021ae060[];
extern void func_0209448c(int val, void *dest, unsigned int size);

void func_ov020_021ab0ac(void) {
    char *buf = (char *)Vram_GetBankBaseCD();
    func_0209448c(0, buf + 0xaa0, *(int *)(data_ov020_021ae060 + 0x8d8) * 0x360);
}
