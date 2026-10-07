typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern void *func_020854f4(void *table, void *key);
extern void func_02081c84(void *hdr, void *entry, void *ctx, void *found);

int func_02081bd8(char *a, char *ctx)
{
    char *hdr = a + *(u32 *)(a + 8);
    char *blk = hdr + *(u16 *)(hdr + 2);
    u32 i;
    int ok = 1;
    for (i = 0; i < *(u8 *)(blk + 1); i++) {
        char *t = blk + *(u16 *)(blk + 6);
        void *found = func_020854f4(ctx + *(u16 *)(ctx + 0x34), t + *(u16 *)(t + 2) + i * 16);
        if (found != 0) {
            u16 off = *(u16 *)(blk + 6);
            u16 stride = *(u16 *)(blk + off);
            char *entry = blk + off + 4 + stride * i;
            if (!(*(u8 *)(entry + 3) & 1)) {
                func_02081c84(hdr, entry, ctx, found);
            }
        } else {
            ok = 0;
        }
    }
    return ok;
}
