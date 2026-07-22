extern void Fill32(int val, void *dest, int size);

typedef struct {
    int field0;
    int field4;
} SrcEntry_0200b2f4;

typedef struct {
    int f0;
    int f4;
    int f8;
} DestEntry_0200b2f4;

int func_0200b2f4(DestEntry_0200b2f4 *dest, SrcEntry_0200b2f4 *src, int base, unsigned int count) {
    unsigned int i;
    for (i = 0; i < count; i++) {
        Fill32(0, dest, 0xc);
        dest->f0 = base + src[i].field0;
        dest->f4 = src[i].field4;
        dest->f8 = -1;
        dest++;
    }
    return 1;
}
