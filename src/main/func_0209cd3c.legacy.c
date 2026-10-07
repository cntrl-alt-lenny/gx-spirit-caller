typedef struct {
    char pad[0x60];
    unsigned int f60;
} Hdr;

extern Hdr *data_021026d8;
extern void func_0209d150(unsigned int cmd, int a);

unsigned int func_0209cd3c(void) {
    func_0209d150(0xb8000000, 0);
    *(volatile unsigned int *)0x040001a4 = ((data_021026d8->f60 & ~0x07000000) | 0xa7000000) & ~0x1fff;
    while (!(*(volatile unsigned int *)0x040001a4 & 0x800000)) {
    }
    return *(volatile unsigned int *)0x04100010;
}
