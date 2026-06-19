/* func_ov010_021b66ec: family b755bae1 — run three sub-init helpers on
 * fixed sub-offsets of self, return self.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     add   r0, r4, #0x84
 *     bl    func_ov010_021b3560
 *     add   r0, r4, #0x58
 *     bl    func_ov010_021b2760
 *     add   r0, r4, #0x34
 *     bl    func_ov010_021b2760
 *     mov   r0, r4
 *     pop   {r4, pc}
 */

extern void func_ov010_021b3560(void *p);
extern void func_ov010_021b2760(void *p);

void *func_ov010_021b66ec(void *self) {
    func_ov010_021b3560((char *)self + 0x84);
    func_ov010_021b2760((char *)self + 0x58);
    func_ov010_021b2760((char *)self + 0x34);
    return self;
}
