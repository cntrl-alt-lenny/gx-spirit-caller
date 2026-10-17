extern void func_02094c94(int cmd, int a, int b, int c, int d);
extern void func_02095bf8(int index);

void func_02095030(int a, int b, unsigned int mask, int d) {
    int i;
    unsigned int bits = mask;
    for (i = 0; i < 8 && bits != 0; i++, bits >>= 1) {
        if (bits & 1) {
            func_02095bf8(i);
        }
    }
    func_02094c94(13, a, b, mask, d);
}
