/* func_ov010_021b67ec: family b755bae1 — run three sub-init helpers on
 * fixed sub-offsets of self, return self.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     add   r0, r4, #0x84
 *     bl    func_ov010_021b3660
 *     add   r0, r4, #0x58
 *     bl    func_ov010_021b2860
 *     add   r0, r4, #0x34
 *     bl    func_ov010_021b2860
 *     mov   r0, r4
 *     pop   {r4, pc}
 */

extern void func_ov010_021b3660(void *p);
extern void func_ov010_021b2860(void *p);

void *func_ov010_021b67ec(void *self) {
    func_ov010_021b3660((char *)self + 0x84);
    func_ov010_021b2860((char *)self + 0x58);
    func_ov010_021b2860((char *)self + 0x34);
    return self;
}
