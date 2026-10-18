extern int func_ov002_021baca8(int player, int idx, int arg);
extern void func_ov002_021df62c(int player, int idx, int val);
extern void func_ov002_021df938(int player, int val, int a, int b);

extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];

struct Slot {
    unsigned int lo : 13;
    unsigned int bit : 1;
    unsigned int mid : 8;
    unsigned int hi : 8;
    unsigned int rest : 2;
};

int func_ov002_02266ff0(int player)
{
    unsigned int i;

    i = *(int *)(data_ov002_022d016c + 0xd28);
    if (i < 10) {
        do {
            int side = player ^ (i / 5);
            int idx = i % 5 + 5;
            if (func_ov002_021baca8(side, idx, 0x1406) != 0) {
                struct Slot *s = (struct Slot *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + idx * 20);
                func_ov002_021df62c(side, idx, s->hi * 2 + s->bit);
                func_ov002_021df938(player, 500, player != side, 0x1406);
                i = *(int *)(data_ov002_022d016c + 0xd28);
                *(int *)(data_ov002_022d016c + 0xd28) = i + 1;
                return 0;
            }
            i = *(int *)(data_ov002_022d016c + 0xd28) + 1;
            *(int *)(data_ov002_022d016c + 0xd28) = i;
        } while (i < 10);
    }
    return 1;
}
