/* func_ov015_021b2350: family eb6ca6b0 sibling of ov010_021b2450 (same
 * address, overlapping overlay). Identical shape; helpers in ov015.
 *
 *     push  {r4, lr}
 *     mov   r4, r0
 *     str   r1, [r4, #0x60]
 *     str   r2, [r4, #0x5c]
 *     bl    func_ov015_021b228c
 *     mov   r1, r0
 *     mov   r0, r4
 *     bl    func_ov015_021b22f4
 *     ldr   r1, [r4, #0x64]
 *     mov   r0, r4
 *     bl    func_ov015_021b2390
 *     pop   {r4, pc}
 */

extern int func_ov015_021b228c(void *self);
extern void func_ov015_021b22f4(void *self, int v);
extern void func_ov015_021b2390(void *self, int v);

void func_ov015_021b2350(int *self, int a1, int a2) {
    self[0x18] = a1;
    self[0x17] = a2;
    func_ov015_021b22f4(self, func_ov015_021b228c(self));
    func_ov015_021b2390(self, self[0x19]);
}
