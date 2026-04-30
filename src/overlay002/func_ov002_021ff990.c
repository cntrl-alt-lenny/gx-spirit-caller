/* func_ov002_021ff990: clamp `func_ov002_022577dc()` result to {0, 2}.
 *
 *     bl func_ov002_022577dc
 *     cmp r0, #2
 *     movlt r0, #0
 *     movge r0, #2
 *
 * Note source order: writing `if (x < 2) return 0; return 2;` produces
 * the right `movlt; movge` order — the alternative `if (x >= 2) return 2;
 * return 0;` produced `movge; movlt` (reversed) and broke the byte match.
 */

extern int func_ov002_022577dc(void);

int func_ov002_021ff990(void) {
    int x = func_ov002_022577dc();
    if (x < 2) return 0;
    return 2;
}
