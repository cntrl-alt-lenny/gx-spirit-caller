typedef struct { unsigned char pad[12]; unsigned short half_c; unsigned short half_e; } A0_02072544_t;
extern int func_02073f28(void *a0, unsigned int a1, char *a2, unsigned int a3);
extern void func_02071fb0(unsigned short *header, unsigned short *packet, int size);
extern void func_02071e9c(A0_02072544_t *header, unsigned short *packet, void *arg);
extern void func_02071b74(unsigned short *header, unsigned short *packet, int size);
extern void func_02071a74(int arg0, int arg1, int arg2);
extern void func_02071a2c(int a, int b);
extern void func_02072234(unsigned short *header, unsigned short *packet, unsigned int base, int arg);

void func_020718d8(unsigned short *header, unsigned short *packet, int size)
{
    int flags;
    if (func_02073f28(packet, size, (char *)header, 6))
        return;
    size -= (((unsigned char *)packet)[12] & 0xf0) / 4;
    flags = ((unsigned char *)packet)[13];
    switch (flags & 0x17) {
    case 2:
        if (flags & 0x28) return;
        func_02071fb0(header, packet, size);
        return;
    case 0x12:
        if (flags & 0x28) return;
        func_02071e9c((A0_02072544_t *)header, packet, (void *)size);
        return;
    case 0x10:
    case 0x11:
        func_02071b74(header, packet, size);
        return;
    case 1:
        func_02071a74((int)header, (int)packet, size);
        return;
    default:
        if (flags & 4) {
            func_02071a2c((int)header, (int)packet);
            return;
        }
        func_02072234(header, packet, size, 0);
        return;
    }
}
