typedef struct { unsigned short half_0; unsigned short half_2; } A1_02072544_t;
typedef struct { unsigned char _pad_00[8]; unsigned char byte8; unsigned char _pad_9[1]; unsigned short half_a; unsigned char _pad_c[12]; unsigned short half_18; unsigned char _pad_1a[2]; unsigned int word_1c; } A2_02072544_t;
typedef struct { unsigned char _pad_00[12]; unsigned short half_c; unsigned short half_e; } A0_02072544_t;
typedef struct { char _pad[0x64]; unsigned int flag; } ctx_020919d8_t;
extern A2_02072544_t *func_020724c8(A0_02072544_t *a0, A1_02072544_t *a1);
extern void func_02072234(void *a, void *b, void *c, int d);
extern void func_020918d0(void);
extern void func_02072444(unsigned char *packet, void *connection);
extern int func_02072384(int a, int b);
extern void func_020919d8(ctx_020919d8_t *ctx);
static inline unsigned short Swap16(int value) { return (value >> 8) | (value << 8); }
static inline unsigned int Read32(unsigned short *p) { return (Swap16(p[0]) << 16) | Swap16(p[1]); }
void func_02071e9c(A0_02072544_t *header, unsigned short *packet, void *arg)
{
    unsigned char *c = (unsigned char *)func_020724c8(header, (A1_02072544_t *)packet);
    if (c == 0 || c[8] != 2) {
        func_02072234(header, packet, arg, 0);
        return;
    }
    func_020918d0();
    *(unsigned int *)(c + 0x24) = Read32(packet + 2) + 1;
    *(unsigned int *)(c + 0x30) = Read32(packet + 4);
    *(unsigned short *)(c + 0x2c) = Swap16(packet[7]);
    func_02072444((unsigned char *)packet, c);
    func_02072384((int)c, 0);
    c[8] = 4;
    if (*(int *)(c + 4) == 1) {
        *(int *)(c + 4) = 0;
        func_020919d8(*(ctx_020919d8_t **)c);
    }
}
