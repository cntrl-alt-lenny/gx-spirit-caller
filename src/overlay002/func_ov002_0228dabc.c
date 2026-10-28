extern int func_ov002_021c8470(int a, int b);
extern void func_ov002_0227b090(int arg, int a, int b);
extern int data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
typedef struct {
    char pad[0x30];
    unsigned int id : 13;
} Row;
int func_ov002_0228dabc(int player, int idx) {
    int buf[11];
    int base = func_ov002_021c8470(data_ov002_022cd3f4[0], data_ov002_022cd3f4[7]);
    int poff, off;
    func_ov002_0227b090(player, idx, (int)buf);
    off = idx * 0x14;
    poff = (player & 1) * 0x868;
    if (*(unsigned short *)(off + ((int)data_ov002_022cf1a2 + poff)) != 0) {
        int row = (int)data_ov002_022cf16c + poff;
        Row *slot = (Row *)(row + off);
        int n = buf[6] + 1 - base;
        int extra = slot->id != 0x139c;
        if (n > 0) n = 0;
        return extra + (n + 1);
    }
    return (buf[5] - base) * 2;
}



