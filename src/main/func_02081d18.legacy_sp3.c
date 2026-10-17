typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern int func_020854f4(char *a, char *b);
extern void func_02081dcc(char *a, char *b, char *c, int d);

int func_02081d18(char *base, char *obj)
{
    char *hdr = base + *(int *)(base + 8);
    char *blk = hdr + *(u16 *)hdr;
    int ok = 1;
    u32 i;
    for (i = 0; i < ((u8 *)blk)[1]; i++) {
        char *t = blk + *(u16 *)(blk + 6);
        int r = func_020854f4(obj + 0x3c, t + *(u16 *)(t + 2) + i * 16);
        if (r != 0) {
            u16 o = *(u16 *)(blk + 6);
            u16 sz = *(u16 *)(blk + o);
            u8 *e = (u8 *)(blk + o + 4 + sz * i);
            if (!(e[3] & 1)) {
                func_02081dcc(hdr, (char *)e, obj, r);
            }
        } else {
            ok = 0;
        }
    }
    return ok;
}