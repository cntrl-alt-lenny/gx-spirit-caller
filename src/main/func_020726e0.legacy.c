/* func_020726e0: verify a packet's checksum, check the (byte-swapped)
 * address pair in the header, then dispatch on the packet type (0 or 8). */
typedef struct {
    unsigned char _pad_00[0xc];
    unsigned short h0c;
    unsigned short h0e;
    unsigned short h10;
    unsigned short h12;
} Hdr;
extern int func_02073f84(unsigned char *p, int len);
extern int func_020727dc(int a, int b);
extern void func_0207280c(Hdr *h, unsigned char *p, int len);
extern void func_02072924(Hdr *h, unsigned char *p, int len);

static inline unsigned short Swap16(int value) { return (value >> 8) | (value << 8); }

void func_020726e0(Hdr *h, unsigned char *p, int len) {
    if (func_02073f84(p, len) != 0xffff) {
        return;
    }
    if (func_020727dc((Swap16(h->h0c) << 16) | Swap16(h->h0e),
                      (Swap16(h->h10) << 16) | Swap16(h->h12)) == 0) {
        return;
    }
    switch (p[0]) {
    case 0:
        func_0207280c(h, p, len);
        break;
    case 8:
        func_02072924(h, p, len);
        break;
    }
}
