extern char data_ov002_022cf16c[];
extern int func_ov002_021bc0d4(int side, int x, int y);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_02259f98(int player);
extern int func_ov002_022813f8(int a);
extern int func_ov002_021be4a0(int player, int index, int check);
extern int func_ov002_021c8470(int a, int b);
struct Slot { unsigned int id : 13; char pad[16]; };
int func_ov002_0228c460(int player)
{
    int count;
    int i;
    char *row;
    char *p;
    char *p2;
    char *q;
    count = func_ov002_021bc0d4((1 - player), 1, 1);
    count = count + 1 - func_ov002_021bbf50(player);
    if (func_ov002_02259f98((1 - player)) == 0) return 0;
    if (count <= 0) return 0;
    p = data_ov002_022cf16c + (player & 1) * 0x868 + 0x30;
    for (i = 0; i < 5; i++) {
        if (func_ov002_022813f8(((struct Slot *)p)->id) != 0) return 0;
        p += 0x14;
    }
    q = data_ov002_022cf16c + ((1 - player) & 1) * 0x868;
    p2 = q + 0x30;
    for (i = 0; i < 5; i++) {
        if (((struct Slot *)p2)->id != 0 && *(unsigned short *)(q + 0x36) == 0) {
            if (func_ov002_021be4a0((1 - player), i, 1) != 0) {
                if (*(int *)(data_ov002_022cf16c + (player & 1) * 0x868) <= func_ov002_021c8470((1 - player), i)) return 1;
            }
        }
        p2 += 0x14;
        q += 0x14;
    }
    return 0;
}




