extern void func_02093c90(int channel, unsigned int mode);
extern void func_02093c20(unsigned int dmaNo, unsigned int src, unsigned int size, unsigned int dir);
extern void func_01ff8770(unsigned int dmaNo, unsigned int src, unsigned int dest, unsigned int ctrl);

void func_02094864(unsigned int dmaNo, unsigned int src, unsigned int dest, unsigned int size) {
    unsigned int *cnt;
    func_02093c90(dmaNo, -1);
    func_02093c20(dmaNo, src, size, 0x1000000);
    if (size == 0) {
        return;
    }
    cnt = (unsigned int *)0x040000b0 + (dmaNo * 3 + 2);
    while (*(volatile unsigned int *)cnt & 0x80000000) {
    }
    func_01ff8770(dmaNo, src, dest, 0xaf000001);
}
