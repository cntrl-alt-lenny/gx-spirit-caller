typedef struct {
    char pad[0x58];
    unsigned short a;
    unsigned short b;
    unsigned char c;
    unsigned char d;
    unsigned short e;
    unsigned short f;
    unsigned char g;
    unsigned char h;
} Hdr;

extern int func_02099d80(unsigned short *out, unsigned short a, unsigned short b, unsigned char c, int d, int e, int f, int g, int h);

int func_0209a3f8(unsigned short *out) {
    Hdr *hdr = (Hdr *)0x027ffc80;
    unsigned short a = hdr->a;
    unsigned short b = hdr->b;
    unsigned char c = hdr->c;
    unsigned short e;
    unsigned short f;
    unsigned char d;
    unsigned char g;
    unsigned char h;
    d = hdr->d;
    e = hdr->e;
    f = hdr->f;
    g = hdr->g;
    h = hdr->h;
    if ((a == 0 && e == 0 && b == 0 && f == 0) || func_02099d80(out, a, b, c, d, e, f, g, h) != 0) {
        out[0] = 0;
        out[1] = 0;
        out[2] = 0;
        out[3] = 0;
        return 1;
    }
    return 1;
}
