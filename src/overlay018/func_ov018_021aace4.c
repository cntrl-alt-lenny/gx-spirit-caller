/* func_ov018_021aace4: draw the gauge cell run at cursor *a1 and return the
 * drawn count (advancing the cursor by 8*count). Primes the palette via
 * func_0207fd28, then renders through func_0207f934 with the position fixed at
 * ((a2+0x80)<<12, 0x60000) and the shared attribute word at data_ad860+0x8f8.
 */

extern int func_0207ec28(int glyph);
extern void func_0207fd28(void *pal, int len);
extern int func_0207f934(int handle, int code, int pal, int z, int *pos, int x, int y);
extern char data_ov018_021ae12c[];
extern char data_ov018_021ad860[];

int func_ov018_021aace4(int a0, int *a1, int a2) {
    int pos[2];
    int r = func_0207ec28(a0);
    int ret;
    func_0207fd28(data_ov018_021ae12c, 0x1000);
    pos[0] = (a2 + 0x80) << 12;
    pos[1] = 0x60000;
    ret = func_0207f934(*a1, (unsigned short)r, *(int *)(data_ov018_021ad860 + 0x8f8), 0, pos, 0, 0);
    *a1 += ret << 3;
    return ret;
}
