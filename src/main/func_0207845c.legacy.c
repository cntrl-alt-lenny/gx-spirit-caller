typedef struct {
    unsigned char _pad_00[0x14];
    unsigned int count_hi;
    unsigned int count_lo;
    unsigned char buf[64];
} Ctx;

extern void func_0207850c(Ctx *c, unsigned char *data, unsigned int len);
extern void func_02078d30(void *a, void *b, int n);
extern unsigned char data_021020b4[];

void func_0207845c(Ctx *c, void *out)
{
    func_0207850c(c, data_021020b4 + 1, 0x2c);
    func_02078d30(out, c, 0x14);
}
