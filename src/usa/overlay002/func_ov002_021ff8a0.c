/* func_ov002_021ff8a0: clamp `func_ov002_022576f4()` result to {0, 2}.
 *
 *     bl func_ov002_022576f4
 *     cmp r0, #2
 *     movlt r0, #0
 *     movge r0, #2
 *
 * Note source order: writing `if (x < 2) return 0; return 2;` produces
 * the right `movlt; movge` order — the alternative `if (x >= 2) return 2;
 * return 0;` produced `movge; movlt` (reversed) and broke the byte match.
 */

extern int func_ov002_022576f4(void);

int func_ov002_021ff8a0(void) {
    int x = func_ov002_022576f4();
    if (x < 2) return 0;
    return 2;
}
