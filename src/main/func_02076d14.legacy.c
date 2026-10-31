extern void func_02094688(const void *src, void *dst, int size);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
extern void func_02077b98(void *packet);

void func_02076d14(unsigned char *self, unsigned char *data)
{
    unsigned int active;
    unsigned int length;
    data += 2;
    func_02094688(data, self + 0x54, 0x20);
    data += 0x20;
    active = self[0x30];
    length = *data++;
    if (active && length == 0x20 && func_020a7440(self + 0x74, data, 0x20) == 0) {
        self[0x31] = 1;
    } else {
        if (active) {
            func_02077b98(self);
        }
        if (length == 0) {
            self[0x30] = 0;
        } else {
            func_02094688(data, self + 0x74, 0x20);
            self[0x30] = 1;
        }
        self[0x31] = 0;
    }
    data += length;
    *(unsigned short *)(self + 0x32) = (data[0] << 8) + data[1];
    self[0x455] = 2;
}


