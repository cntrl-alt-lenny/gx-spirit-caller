/* func_ov020_021ab418: Fill32-clear the 0xc80-byte slot `idx` of the work
 * buffer (base + 0x20 + idx*0xc80).
 *
 *     mov   r4, r1
 *     bl    func_0208df0c
 *     add   r0, r0, #0x20
 *     mov   r2, #0xc80
 *     mla   r1, r4, r2, r0
 *     mov   r0, #0x0
 *     bl    Fill32
 */

extern int func_0208df0c(void);
extern void Fill32(int v, void *dst, int size);

void func_ov020_021ab418(int page, int idx) {
    Fill32(0, (char *)func_0208df0c() + 0x20 + idx * 0xc80, 0xc80);
}
