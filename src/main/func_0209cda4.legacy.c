typedef struct {
    char pad0[4];
    unsigned int ctrl;
    unsigned int f8;
    char pad_c[0x20 - 0xc];
    unsigned int buf[0x80];
} Req;

typedef struct {
    char pad0[0x1c];
    unsigned int pos;
    unsigned int *dst;
    unsigned int remain;
} Cart;

extern Cart data_021a84c0;
extern void func_0209d150(unsigned int cmd, unsigned int arg);
extern int func_0209d1f0(Req *req);

void func_0209cda4(Req *req) {
    Cart *const c = &data_021a84c0;
    unsigned int *rctrl = (unsigned int *)0x040001a4;
    unsigned int *rdata = (unsigned int *)0x04100010;
    unsigned int *dst;
    unsigned int *buf = req->buf;
    for (;;) {
        unsigned int addr = c->pos & ~0x1ff;
        unsigned int i;
        unsigned int status;
        if (addr != c->pos || (((unsigned int)(dst = c->dst) & 3) != 0) || c->remain < 0x200) {
            dst = buf;
            req->f8 = addr;
        }
        func_0209d150((addr >> 8) | 0xb7000000, addr << 24);
        i = 0;
        *(volatile unsigned int *)rctrl = req->ctrl;
        do {
            status = *(volatile unsigned int *)rctrl;
            if (status & 0x800000) {
                unsigned int word = *(volatile unsigned int *)rdata;
                if (i < 0x200) {
                    dst[i] = word;
                    i++;
                }
            }
        } while (status & 0x80000000);
        if (dst == c->dst) {
            data_021a84c0.pos += 0x200;
            data_021a84c0.dst += 0x80;
            data_021a84c0.remain -= 0x200;
            if (data_021a84c0.remain == 0) {
                return;
            }
        } else if (func_0209d1f0(req) == 0) {
            return;
        }
    }
}
