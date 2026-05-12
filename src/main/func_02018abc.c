/* func_02018abc: 7-way cascading range lookup. Returns 1..8 depending on
 * which threshold x falls below; 8 if x >= 0x2d. Flat (no stack).
 *
 *     cmp   r0, #0x3   ; movlt r0,#1 ; bxlt lr
 *     cmp   r0, #0x7   ; movlt r0,#2 ; bxlt lr
 *     cmp   r0, #0x12  ; movlt r0,#3 ; bxlt lr
 *     cmp   r0, #0x18  ; movlt r0,#4 ; bxlt lr
 *     cmp   r0, #0x22  ; movlt r0,#5 ; bxlt lr
 *     cmp   r0, #0x28  ; movlt r0,#6 ; bxlt lr
 *     cmp   r0, #0x2d
 *     movlt r0, #0x7
 *     movge r0, #0x8
 *     bx    lr
 */

int func_02018abc(int x) {
    if (x < 0x3)  return 1;
    if (x < 0x7)  return 2;
    if (x < 0x12) return 3;
    if (x < 0x18) return 4;
    if (x < 0x22) return 5;
    if (x < 0x28) return 6;
    if (x < 0x2d) return 7;
    return 8;
}
