/* func_ov002_02285874: copy the two 0x64-byte cf19c/cfa04 tables into the
 * arg0 / arg0+0x64 destinations via 0229cd70. */
extern void func_ov002_0229cc60(int dst, void *src, int n);
extern char data_ov002_022cf0bc[];
extern char data_ov002_022cf924[];

void func_ov002_02285874(int arg0) {
    func_ov002_0229cc60(arg0, data_ov002_022cf0bc, 0x64);
    func_ov002_0229cc60(arg0 + 0x64, data_ov002_022cf924, 0x64);
}
