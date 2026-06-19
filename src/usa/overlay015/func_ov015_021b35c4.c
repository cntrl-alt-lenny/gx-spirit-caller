/* func_ov015_021b35c4: compute the pixel width of the current run — glyph count
 * times per-glyph advance, less the 0x97 fixed inset (clamped at 0), then add
 * back the sub-glyph remainder. Returns the width. (ov015; calls into ov005's
 * shared text metrics.) */
extern int func_ov005_021ac8c0(int);
extern int func_ov005_021ab028(int, int);
extern long long func_020b377c(int, int);  /* signed divmod: quotient r0, remainder r1 */
extern char data_ov015_021b5d08[];
int func_ov015_021b35c4(void) {
    int n = func_ov005_021ac8c0(*(int *)(data_ov015_021b5d08 + 0x894));
    int adv = func_ov005_021ab028(*(int *)(data_ov015_021b5d08 + 0x890), 1);
    int w = n * adv - 0x97;
    if (w < 0)
        w = 0;
    else
        w += n - (int)(func_020b377c(w, n) >> 32);  /* n - (w % n) */
    return w;
}
