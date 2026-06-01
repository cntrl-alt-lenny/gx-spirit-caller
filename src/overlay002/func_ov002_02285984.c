/* func_ov002_02285984: copy the two 0x64-byte cf19c/cfa04 tables into the
 * arg0 / arg0+0x64 destinations via 0229cd70. */
extern void func_ov002_0229cd70(int dst, void *src, int n);
extern char data_ov002_022cf19c[];
extern char data_ov002_022cfa04[];

void func_ov002_02285984(int arg0) {
    func_ov002_0229cd70(arg0, data_ov002_022cf19c, 0x64);
    func_ov002_0229cd70(arg0 + 0x64, data_ov002_022cfa04, 0x64);
}
