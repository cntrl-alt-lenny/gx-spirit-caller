extern char data_ov002_022d0f98[];
extern void func_0207f05c(void *, void *, int);

typedef struct {
    unsigned w;
    unsigned short h;
} Raw;

void func_ov002_022b2660(int x, int y, int z, int s) {
    Raw r;
    int i;
    int init = 0x80004000;
    r.w = init;
    r.h = s << 12;
    for (i = 0; i < 4; i++) {
        r.w = (r.w & 0xfe00ff00) | (y & 0xff) | ((x & 0x1ff) << 16);
        r.h = (r.h & (init >> 21)) | ((z + i * 0x100) / 128);
        func_0207f05c(data_ov002_022d0f98, &r, 1);
        x += 0x20;
    }
}
