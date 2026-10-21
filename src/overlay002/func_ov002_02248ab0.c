typedef unsigned int u32;
typedef struct { u32 count; char rest[0x864]; } CountRow;
typedef struct { u32 id:13; u32 rest:19; } Card;
extern char data_ov002_022cf16c[];
extern CountRow data_ov002_022cf184[];
extern int func_02030808(int id);
extern int func_02030b84(int a0);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02248ab0(int player)
{
    u32 side = player & 1;
    u32 i = 0;
    if (data_ov002_022cf184[side].count > i) {
        Card *row;
        char *base = data_ov002_022cf16c + side * 0x868;
        row = (Card *)(base + 0x3a0);
        do {
            int id = row->id;
            if (func_02030808(id) && func_02030b84(id) && func_ov002_021ca3f0(player, id))
                func_ov002_02253458(player, 12, i);
            i++;
            row++;
        } while (i < *(u32 *)(base + 0x18));
    }
}

