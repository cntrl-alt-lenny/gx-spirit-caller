extern unsigned char *data_0219ef24;
extern volatile unsigned int data_0219ef28;
extern volatile unsigned int data_0219eef4;
extern volatile unsigned int data_0219eefc;
extern unsigned char data_02101eb8[];
extern void func_02094688(void *src, void *dst, int n);

void func_02073ac0(void *a, void *b, unsigned char *packet, unsigned int size, void *extra, unsigned int extra_size)
{
    unsigned short length;
    unsigned int next;
    if (data_0219ef24 == 0) return;
    if (data_0219ef28 == 0) return;
    if (size + extra_size < 8) return;
    if (size + extra_size > 0x5e4) return;
    if (packet[0] != data_02101eb8[0]) return;
    if (packet[1] != data_02101eb8[1]) return;
    if (packet[2] != data_02101eb8[2]) return;
    if (packet[6] != 8) return;
    if (packet[7] != 0 && packet[7] != 6) return;
    length = (size + extra_size + 9) & ~1;
    next = data_0219eef4 + length;
    if (data_0219eef4 < data_0219eefc) {
        if (data_0219eefc <= next) return;
    }
    if (next == data_0219ef28) {
        next = 0;
        if (data_0219eefc == 0) return;
    } else if (next > data_0219ef28) {
        next = length;
        if (data_0219eefc <= length) return;
    }
    if (data_0219eef4 + length > data_0219ef28) {
        if (data_0219ef28 - data_0219eef4 >= 2)
            *(unsigned short *)(data_0219ef24 + data_0219eef4) = 0;
        data_0219eef4 = 0;
    }
    *(unsigned short *)(data_0219ef24 + data_0219eef4) = length;
    func_02094688(b, data_0219ef24 + data_0219eef4 + 2, 6);
    func_02094688(a, data_0219ef24 + data_0219eef4 + 8, 6);
    func_02094688(packet + 6, data_0219ef24 + data_0219eef4 + 14, size - 6);
    if (extra != 0 && extra_size != 0)
        func_02094688(extra, data_0219ef24 + data_0219eef4 + 8 + size, extra_size);
    data_0219eef4 = next;
}

