/* func_ov002_022301a8: ptr-copy + helper + LIT-write.
 *
 *     push  {r4, lr}
 *     ldrh  r2, [r1]             ; r2 = *src
 *     mov   r4, r0               ; r4 = dst (saved)
 *     strh  r2, [r4]             ; *dst = r2
 *     bl    helper
 *     ldr   r1, [pc, #4]         ; r1 = LIT (0x183e)
 *     strh  r1, [r4]             ; *dst = LIT
 *     pop   {r4, pc}
 *
 * Brief 242 C-42 sub-shape 3 (ptr-copy + helper + LIT-write).
 * Recipe gotcha: needs BOTH (a) int return type so r0 is "live"
 * post-bl, AND (b) helper takes both args (dst, src). The
 * combination forces r2 for the u16 temp and r1 for the LIT load.
 */
extern int func_ov002_02257cfc(unsigned short *dst, unsigned short *src);

int func_ov002_022301a8(unsigned short *dst, unsigned short *src) {
    int r;
    *dst = *src;
    r = func_ov002_02257cfc(dst, src);
    *dst = 0x183e;
    return r;
}
