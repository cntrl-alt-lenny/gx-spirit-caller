typedef unsigned int u32;
typedef struct { u32 count; char rest[0x864]; } CountRow;
extern char data_ov002_022cf16c[];
extern CountRow data_ov002_022cf184[];
extern void func_ov002_02253458(u32 player, u32 kind, u32 index);

void func_ov002_02248b5c(u32 player)
{
    u32 side = player & 1;
    u32 i = 0;
    if (data_ov002_022cf184[side].count > i) {
        char *base = data_ov002_022cf16c + side * 0x868;
        do {
            func_ov002_02253458(player, 0xc, i);
            i++;
        } while (i < *(u32 *)(base + 0x18));
    }
}
