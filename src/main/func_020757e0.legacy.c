typedef struct {
    unsigned char pad[0x14];
    unsigned int count_hi, count_lo;
    unsigned char buf[64];
} Ctx;
extern void func_0207576c(void *a0, int a1);
extern void func_020785cc(unsigned int *self);
extern void func_0207850c(Ctx *c, unsigned char *data, unsigned int len);
extern void func_0207845c(void *ctx, void *out);
extern int OS_DisableIrq(void);
extern int OS_RestoreIrq(int saved);
extern unsigned char data_021a0700[];
extern unsigned long long data_0219ef3c[];
extern unsigned char data_021a0708[];
extern unsigned char data_021a071b[];

void func_020757e0(unsigned char *dst, int len) {
    unsigned char ctx[96];
    unsigned char bytes[20];
    unsigned int value;
    int irq, i, pos, j;
    unsigned int carry, sum;
    unsigned int byte;
    unsigned char *q;
    unsigned char *p;
    if (data_021a0700[0] == 0) {
        data_0219ef3c[0] = data_0219ef3c[1] * data_0219ef3c[0] + data_0219ef3c[2];
        value = data_0219ef3c[0] >> 32;
        func_0207576c(&value, 4);
    }
    for (i = 0, pos = 20; i < len;) {
        if (pos == 20) {
            func_020785cc((unsigned int *)ctx);
            irq = OS_DisableIrq();
            func_0207850c((Ctx *)ctx, data_021a0708, 20);
            func_0207845c(ctx, bytes);
            carry = 1;
            p = data_021a071b;
            j = 19;
            q = bytes + 19;
            for (; j >= 0; j--) {
                sum = *p + *q-- + carry;
                *p = sum;
                carry = sum >> 8;
                p--;
            }
            value = sum;
            OS_RestoreIrq(irq);
            pos = 0;
        }
        byte = bytes[pos++];
        if (byte != 0) dst[i++] = byte;
    }
}











