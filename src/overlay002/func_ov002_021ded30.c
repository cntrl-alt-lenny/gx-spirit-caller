/* func_ov002_021ded30: C-42 — save+clear u16 field + helper + restore.
 *
 *   ldrh r4, [r5]; mov r3, #0; mov r2, #14; strh r3, [r5]
 *   bl func_ov002_021de134(self, r1_unchanged, 14, 0)
 *   strh r4, [r5]; pop
 */

extern void func_ov002_021de134(void *self, int arg1, int k, int z);

void func_ov002_021ded30(unsigned short *p, int arg1) {
    unsigned short saved = *p;
    *p = 0;
    func_ov002_021de134(p, arg1, 14, 0);
    *p = saved;
}
