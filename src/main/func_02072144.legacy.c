typedef struct { char pad_00[0x1c]; int field_1c; } func_02072398_t;
extern void func_02072398(func_02072398_t *a0, int a1, int a2);
extern void func_02072444(unsigned char *packet, void *connection);
extern unsigned long long func_020930b0(void);
static inline unsigned short Swap16(int value) { return (value >> 8) | (value << 8); }
static inline unsigned int Read32(unsigned short *p) { return (Swap16(p[0]) << 16) | Swap16(p[1]); }
void func_02072144(unsigned short *header, unsigned short *packet, void *connection)
{
    unsigned char *p = connection;
    p[8] = 3;
    *(unsigned int *)(p+0x10) = func_020930b0() >> 16;
    *(unsigned int *)(p+0x14) = Read32(header+8);
    *(unsigned short *)(p+0x18) = Swap16(packet[0]);
    *(unsigned int *)(p+0x1c) = Read32(header+6);
    *(unsigned int *)(p+0x24) = Read32(packet+2) + 1;
    func_02072444((unsigned char *)packet, connection);
    func_02072398(connection, 18, 0);
}
