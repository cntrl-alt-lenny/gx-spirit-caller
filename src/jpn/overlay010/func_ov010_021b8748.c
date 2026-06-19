/* func_ov010_021b8748: family b755bae1 sibling of 021b67ec — same
 * shape, sub-offsets 0x8c / 0x60 / 0x3c.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     add   r0, r4, #0x8c
 *     bl    func_ov010_021b3560
 *     add   r0, r4, #0x60
 *     bl    func_ov010_021b2760
 *     add   r0, r4, #0x3c
 *     bl    func_ov010_021b2760
 *     mov   r0, r4
 *     pop   {r4, pc}
 */

extern void func_ov010_021b3560(void *p);
extern void func_ov010_021b2760(void *p);

void *func_ov010_021b8748(void *self) {
    func_ov010_021b3560((char *)self + 0x8c);
    func_ov010_021b2760((char *)self + 0x60);
    func_ov010_021b2760((char *)self + 0x3c);
    return self;
}
