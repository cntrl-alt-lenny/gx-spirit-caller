/* func_0201397c: 3-way classifier — returns 0 if x<0x90, 1 if x<0xc0,
 * else 2.
 *
 *     cmp r0, #0x90
 *     movlt r0, #0x0
 *     bxlt lr
 *     cmp r0, #0xc0
 *     movlt r0, #0x1
 *     movge r0, #0x2
 *     bx  lr
 */

int func_0201397c(int x) {
    if (x < 0x90) return 0;
    if (x < 0xc0) return 1;
    return 2;
}
