typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
/* The existing C thunk loses its ABI: assembly passes two ints and reads r0. */
extern int func_0208bfa8(int a, int b);
void func_02081dcc(char *hdr, char *blk, char *ctx, u32 *found)
{
    char *idxs = hdr + *(u16 *)blk;
    u32 bits;
    u32 i;
    if ((found[0] & 0x1c000000) != 0x14000000)
        bits = *(u32 *)(ctx + 8) & 0xffff;
    else
        bits = *(u32 *)(ctx + 0x18) & 0xffff;
    for (i = 0; i < *(u8 *)(blk + 2); i++) {
        u16 off = *(u16 *)(hdr + 0xa);
        char *tbl = hdr + 4 + off;
        char *entry = tbl + *(u16 *)tbl * (u8)idxs[i];
        u32 a, b;
        char *obj = hdr + *(u32 *)(entry + 4);
        *(u32 *)(obj + 0x14) |= found[0] + bits;
        a = found[1] & 0x7ff;
        b = (found[1] >> 11) & 0x7ff;
        *(int *)(obj + 0x24) = a == *(u16 *)(obj + 0x20) ? 0x1000 : func_0208bfa8(a << 12, *(u16 *)(obj + 0x20) << 12);
        *(int *)(obj + 0x28) = b == *(u16 *)(obj + 0x22) ? 0x1000 : func_0208bfa8(b << 12, *(u16 *)(obj + 0x22) << 12);
    }
    *(u8 *)(blk + 3) |= 1;
}



