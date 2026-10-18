extern int func_ov002_021baca8(int player, int idx, int arg);
extern int func_ov002_021c3350(int player);
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

int func_ov002_02266ef8(int player)
{
    unsigned int i;
    int other;

    if (*(int *)(data_ov002_022d016c + 0xd28) == 0) {
        *(int *)(data_ov002_022d016c + 0xd28) = 5;
    }

    i = *(int *)(data_ov002_022d016c + 0xd28);
    if (i < 10) {
        other = 1 - player;
        do {
            if (func_ov002_021baca8(player, i, 0x1491) != 0) {
                int n = func_ov002_021c3350(other);
                if (n != 0) {
                    struct Slot *s = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30 + i * 20);
                    func_ov002_021df62c(player, i, s->hi * 2 + s->bit);
                    func_ov002_021df938(other, n * 100, 1, 0x1491);
                    i = *(int *)(data_ov002_022d016c + 0xd28);
                    *(int *)(data_ov002_022d016c + 0xd28) = i + 1;
                    return 0;
                }
            }
            i = *(int *)(data_ov002_022d016c + 0xd28) + 1;
            *(int *)(data_ov002_022d016c + 0xd28) = i;
        } while (i < 10);
    }
    return 1;
}
