extern signed char data_02104cae[];
extern char data_02104cb0[];
extern unsigned char data_02104cf8[];
extern char *func_020aadf8(char *dst, const char *src);
extern void func_02094688(const void *src, void *dst, unsigned int size);

void func_020124a4(int index, unsigned char *dst) {
    dst[0] = data_02104cae[index];
    func_020aadf8((char *)dst + 1, data_02104cb0 + index * 0x1a);
    func_02094688(data_02104cf8 + index * 0x108, dst + 0x1c, 0x108);
}
