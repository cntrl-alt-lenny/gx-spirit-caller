extern unsigned char *data_021a6340;
extern int data_0210249c;
extern void Copy32(const void *, void *, unsigned int);
extern void func_02093e38(int, const void *, void *, unsigned int, int, int);
void func_020900a0(const void *source, unsigned int offset, unsigned int size) {
    unsigned char *destination = data_021a6340 + offset;
    int channel = data_0210249c;
    if (channel != -1) {
        func_02093e38(channel, source, destination, size, 0, 0);
    } else {
        Copy32(source, destination, size);
    }
}
