typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

void func_02081c84(char *hdr, char *blk, char *ctx, u16 *found)
{
    char *idxs = hdr + *(u16 *)blk;
    u16 a = *(u32 *)(ctx + 0x2c);
    u16 b = found[0];
    u32 i;
    if (!(found[1] & 1)) {
        b >>= 1;
        a >>= 1;
    }
    for (i = 0; i < *(u8 *)(blk + 2); i++) {
        u8 idx = *(u8 *)(idxs + i);
        u16 off = *(u16 *)(hdr + 0xa);
        char *tbl = hdr + 4 + off;
        char *entry = tbl + *(u16 *)tbl * idx;
        *(u16 *)(hdr + *(u32 *)(entry + 4) + 0x1c) = b + a;
    }
    *(u8 *)(blk + 3) |= 1;
}
