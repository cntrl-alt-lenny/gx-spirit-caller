typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 flag : 1;
} Obj;

extern u8 data_ov002_022cf178[];

int func_ov002_0228b478(Obj *a, u16 *b)
{
    u32 i;

    if (b == 0) {
        return 0;
    }
    switch (*b) {
    case 0x12d5:
        return 1;
    case 0x1325:
        i = (1 - a->flag) & 1;
        return *(u32 *)(data_ov002_022cf178 + i * 0x868) >= 4;
    default:
        return 0;
    }
}
