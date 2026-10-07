typedef struct {
    int a;
    short h4;
    short h6;
    int w8;
    int wc;
    int w10;
    int w14;
    int w18;
    int w1c;
} Src_0200b250;

typedef struct {
    char a;
    char pad3[3];
    short h4;
    short h6;
    int w8;
    int wc;
    int w10;
    int w14;
    int w18;
    int w1c;
} Dst_0200b250;

extern void Fill32(int val, void *dst, int size);

int func_0200b250(Dst_0200b250 *dst, Src_0200b250 *src, int base, unsigned int n) {
    unsigned int i;

    for (i = 0; i < n; i++) {
        Fill32(0, &dst[i], 0x20);
        dst[i].a = src[i].a;
        dst[i].h4 = src[i].h4;
        dst[i].h6 = src[i].h6;
        dst[i].w8 = base + src[i].w8;
        dst[i].wc = src[i].wc;
        dst[i].w10 = base + src[i].w10;
        dst[i].w14 = src[i].w14;
        dst[i].w18 = -1;
        dst[i].w1c = src[i].w18;
    }
    return 1;
}
