typedef struct { unsigned char pad[0x10]; unsigned int count_lo, count_hi; unsigned char buf[64]; } MD5Ctx;
typedef struct { unsigned char pad[0x14]; unsigned int count_hi, count_lo; unsigned char buf[64]; } SHACtx;
extern void func_02076260(unsigned char *p);
extern void func_02077e58(char *a, char *b);
extern void func_02077ecc(MD5Ctx *c, unsigned char *data, unsigned int len);
extern void func_02077f8c(unsigned int *self);
extern void func_02078498(void *a0, void *a1);
extern void func_0207850c(SHACtx *c, unsigned char *data, unsigned int len);
extern void func_020785cc(unsigned int *self);
extern void func_02078dcc(unsigned char *ctx, unsigned char *data, int length);
extern void func_020945f4(void *ptr, int val, unsigned count);
int func_02075df4(unsigned char *ctx, unsigned char *packet)
{
    int length;
    unsigned char *end;
    unsigned char pad[0x30];
    length = (packet[3] << 8) + packet[4];
    end = packet + 5 + length;
    switch (*(unsigned short *)(ctx + 0x32)) {
    case 4: {
        MD5Ctx *hash = (MD5Ctx *)(ctx + 0x3fc);
        func_02077f8c((unsigned int *)hash);
        func_02077ecc(hash, *(unsigned char **)(ctx + 0xbc), 0x10);
        func_020945f4(pad, 0x36, 0x30);
        func_02077ecc(hash, pad, 0x30);
        func_02077ecc(hash, ctx + 0x1cc, 8);
        func_02077ecc(hash, packet, 1);
        func_02077ecc(hash, packet + 3, length + 2);
        func_02077e58((char *)hash, (char *)end);
        func_02077f8c((unsigned int *)hash);
        func_02077ecc(hash, *(unsigned char **)(ctx + 0xbc), 0x10);
        func_020945f4(pad, 0x5c, 0x30);
        func_02077ecc(hash, pad, 0x30);
        func_02077ecc(hash, end, 0x10);
        func_02077e58((char *)hash, (char *)end);
        length += 0x10;
        break;
    }
    case 5: {
        SHACtx *hash = (SHACtx *)(ctx + 0x348);
        func_020785cc((unsigned int *)hash);
        func_0207850c(hash, *(unsigned char **)(ctx + 0xbc), 0x14);
        func_020945f4(pad, 0x36, 0x28);
        func_0207850c(hash, pad, 0x28);
        func_0207850c(hash, ctx + 0x1cc, 8);
        func_0207850c(hash, packet, 1);
        func_0207850c(hash, packet + 3, length + 2);
        func_02078498(hash, end);
        func_020785cc((unsigned int *)hash);
        func_0207850c(hash, *(unsigned char **)(ctx + 0xbc), 0x14);
        func_020945f4(pad, 0x5c, 0x28);
        func_0207850c(hash, pad, 0x28);
        func_0207850c(hash, end, 0x14);
        func_02078498(hash, end);
        length += 0x14;
        break;
    }
    }
    packet[3] = length >> 8;
    packet[4] = length;
    func_02078dcc(ctx + 0xc8, packet + 5, length);
    func_02076260(ctx + 0x1d4);
    return length + 5;
}
