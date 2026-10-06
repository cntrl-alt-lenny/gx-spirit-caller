extern void *data_0219d9d4;
extern void func_020945f4(void *dst, int val, int n);
extern void func_02094688(const void *src, void *dst, int n);

void func_02040258(int *out) {
    if (data_0219d9d4 == 0) {
        func_020945f4(out, 0, 0x1c4);
    }
    func_02094688((char *)data_0219d9d4 + 0x1008, out, 0x1c4);
    if (out[0] < 20000 || out[0] >= 30000) {
        out[0] = 0x5206;
    }
    if (out[0] >= 20100) {
        out[0] = -out[0];
    }
}
