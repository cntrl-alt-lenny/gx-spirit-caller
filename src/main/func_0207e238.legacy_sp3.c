typedef unsigned int u32;
typedef struct { u32 cur; volatile u32 end; u32 base; } Heap;
extern Heap data_021a08e4;
u32 func_0207e238(u32 size, int flag, int direction)
{
    u32 result = 0;
    u32 pos, pad, total, next;
    if (size == 0) size = 8;
    else size = (size + 7) & ~7;
    if (size >= 0x7fff8) return 0;
    switch (direction) {
    case 1:
        pos = data_021a08e4.cur;
        if (flag) pad = (8 - (pos & 7)) & 7;
        else pad = (16 - (pos & 15)) & 15;
        total = size + pad;
        if (data_021a08e4.end - pos >= total) {
            u32 limit = pos + total;
            if (flag && limit > 0x10000) pos = 0;
            else {
                result = pos + pad;
                data_021a08e4.cur += total;
                pos = 1;
            }
        } else pos = 0;
        break;
    default: {
        u32 backpad, backtotal;
        u32 back = data_021a08e4.end;
        if (back >= size &&
            (next = back - size,
             backpad = flag ? next & 7 : next & 15,
             backtotal = size + backpad,
             back - data_021a08e4.cur >= backtotal)) {
        if (flag && back > 0x10000) pos = 0;
        else {
            result = data_021a08e4.end - backtotal;
            data_021a08e4.end = result;
            pos = 1;
        }
        } else pos = 0;
        break;
    }
    }
    if (pos) return ((size >> 3) << 16) | ((result >> 3) & 0xffff);
    return 0;
}














