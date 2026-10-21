typedef unsigned char u8;
typedef struct { u8 pad[0x10]; unsigned int lo, hi; u8 buf[64]; } MD5Ctx;
typedef struct { u8 pad[0x14]; unsigned int hi, lo; u8 buf[64]; } SHA1Ctx;
extern int func_02076244(char *p, int b, int c);
extern void func_02076260(unsigned char *p);
extern void func_02077e58(char *a, char *b);
extern void func_02077ecc(MD5Ctx *c, unsigned char *data, unsigned int len);
extern void func_02077f8c(unsigned int *self);
extern void func_02078498(void *a0, void *a1);
extern void func_0207850c(SHA1Ctx *c, unsigned char *data, unsigned int len);
extern void func_020785cc(unsigned int *self);
extern void func_020945f4(void *dst, int value, unsigned int size);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
int func_02076008(char *ctx, u8 *packet) {
    u8 digest[0x14];
    u8 pad[0x30];
    int len;
    int size;
    len = func_02076244(ctx, (int)(packet + 5), (packet[3] << 8) + packet[4]);
    switch (*(unsigned short *)(ctx + 0x32)) {
    case 4: {
        MD5Ctx *hash;
        len -= 0x10;
        packet[3] = len >> 8;
        packet[4] = len;
        hash = (MD5Ctx *)(ctx + 0x3fc);
        func_02077f8c((unsigned int *)hash);
        func_02077ecc(hash, *(u8 **)(ctx + 0x1d4), 0x10);
        func_020945f4(pad, 0x36, 0x30);
        func_02077ecc(hash, pad, 0x30);
        func_02077ecc(hash, (u8 *)ctx + 0x2e4, 8);
        func_02077ecc(hash, packet, 1);
        func_02077ecc(hash, packet + 3, len + 2);
        func_02077e58((char *)hash, (char *)digest);
        func_02077f8c((unsigned int *)hash);
        func_02077ecc(hash, *(u8 **)(ctx + 0x1d4), 0x10);
        func_020945f4(pad, 0x5c, 0x30);
        func_02077ecc(hash, pad, 0x30);
        func_02077ecc(hash, digest, 0x10);
        func_02077e58((char *)hash, (char *)digest);
        size = 0x10;
        break;
    }
    case 5: {
        SHA1Ctx *hash;
        len -= 0x14;
        packet[3] = len >> 8;
        packet[4] = len;
        hash = (SHA1Ctx *)(ctx + 0x348);
        func_020785cc((unsigned int *)hash);
        func_0207850c(hash, *(u8 **)(ctx + 0x1d4), 0x14);
        func_020945f4(pad, 0x36, 0x28);
        func_0207850c(hash, pad, 0x28);
        func_0207850c(hash, (u8 *)ctx + 0x2e4, 8);
        func_0207850c(hash, packet, 1);
        func_0207850c(hash, packet + 3, len + 2);
        func_02078498(hash, digest);
        func_020785cc((unsigned int *)hash);
        func_0207850c(hash, *(u8 **)(ctx + 0x1d4), 0x14);
        func_020945f4(pad, 0x5c, 0x28);
        func_0207850c(hash, pad, 0x28);
        func_0207850c(hash, digest, 0x14);
        func_02078498(hash, digest);
        size = 0x14;
        break;
    }
    }
    if (func_020a7440(packet + 5 + len, digest, size) != 0) ctx[0x455] = 9;
    func_02076260((u8 *)ctx + 0x2ec);
    return len + 5;
}

