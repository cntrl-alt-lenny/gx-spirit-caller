/* func_ov018_021aaa88: draw a run of cells starting at the cursor *a1, advance
 * the cursor by 8*count, and return that count. Resolve the glyph handle via
 * func_0207ec28, pack the (a3,a4) position into a <<12 fixed-point stack block,
 * and hand off to the cell renderer func_0207f934.
 */

extern int func_0207ec28(int glyph);
extern int func_0207f934(int handle, int code, int pal, int z, int *pos, int x, int y);

int func_ov018_021aaa88(int a0, int *a1, int a2, int a3, int a4) {
    int pos[2];
    int r = func_0207ec28(a0);
    int ret;
    pos[0] = a3 << 12;
    pos[1] = a4 << 12;
    ret = func_0207f934(*a1, (unsigned short)r, a2, 0, pos, 0, 0);
    *a1 += ret << 3;
    return ret;
}
