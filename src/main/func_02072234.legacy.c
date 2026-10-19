typedef struct { char pad_00[0x1c]; int field_1c; } func_02072398_t;
extern void func_02072398(func_02072398_t *a0, int a1, int a2);
extern void func_020945f4(void *dst, int val, int size);
extern unsigned char data_0219f054[];
static inline unsigned short Swap16(int value) { return (value >> 8) | (value << 8); }
static inline unsigned int Read32(unsigned short *p) { return (Swap16(p[0]) << 16) | Swap16(p[1]); }
void func_02072234(unsigned short *header, unsigned short *packet, unsigned int base, int arg)
{
    unsigned char *p = data_0219f054;
    func_020945f4(p, 0, 0x64);
    *(unsigned short *)(p+0xa) = Swap16(packet[1]);
    *(unsigned short *)(p+0x18) = Swap16(packet[0]);
    *(unsigned int *)(p+0x1c) = Read32(header+6);
    if (((unsigned char *)packet)[0xd] & 0x10) {
        *(unsigned int *)(p+0x28) = Read32(packet+4);
        func_02072398((func_02072398_t *)p, 4, arg);
        return;
    }
    *(unsigned int *)(p+0x28) = 0;
    *(unsigned int *)(p+0x24) = base + Read32(packet+2);
    if (((unsigned char *)packet)[0xd] & 3) {
        *(unsigned int *)(p+0x24) += 1;
    }
    func_02072398((func_02072398_t *)p, 0x14, arg);
}
