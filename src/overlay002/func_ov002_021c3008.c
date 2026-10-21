typedef unsigned int u32;
typedef struct {
    u32 id : 13;
    u32 player : 1;
    u32 pad : 7;
    u32 flag : 1;
    u32 value : 8;
    u32 rest : 2;
} Slot;
extern char data_ov002_022cf16c[][0x868];
extern u32 data_ov002_022cf180[][538];
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);

int func_ov002_021c3008(int player, int id)
{
    int i;
    int count;
    u32 off = player;
    off &= 1;
    off *= 0x868;
    count = 0;
    i = 0;
    u32 *limit = (u32 *)((u32)data_ov002_022cf180 + off);
    if ((u32)i < *limit) {
        Slot *p;
        char *base = (char *)((u32)data_ov002_022cf16c + off);
        p = (Slot *)(base + 0x418);
        do {
            if (id == p->id && p->flag == 0) {
                if (func_ov002_021b3fd8(player, 11, id, p->player + (p->value << 1)) == 0)
                    count++;
            }
            i++;
            p++;
        } while ((u32)i < *(u32 *)(base + 0x14));
    }
    return count;
}

















