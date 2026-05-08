/* func_ov020_021aae48: call + Fill32 zero-fill at +0x20 offset
 * for 0xa80 bytes. Style B.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0208df40
 *     add   r1, r0, #0x20
 *     mov   r0, #0x0
 *     mov   r2, #0xa80
 *     bl    Fill32
 *     ldmia sp!, {r3, pc}
 */

extern char *func_0208df40(int x);
extern void Fill32(int v, void *dst, int size);

void func_ov020_021aae48(int x) {
    Fill32(0, func_0208df40(x) + 0x20, 0xa80);
}
