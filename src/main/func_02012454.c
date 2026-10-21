extern unsigned char data_02104cae[];
extern char data_02104cb0[];
extern unsigned char data_02104cf8[];
extern char *func_020aadf8(char *dst, const char *src);
extern void func_02094688(const void *src, void *dst, unsigned int size);

void func_02012454(int index, unsigned char *src) {
    data_02104cae[index] = src[0];
    func_020aadf8(data_02104cb0 + index * 0x1a, (char *)src + 1);
    func_02094688(src + 0x1c, data_02104cf8 + index * 0x108, 0x108);
}
