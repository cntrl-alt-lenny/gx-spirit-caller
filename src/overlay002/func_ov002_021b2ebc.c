extern int func_ov002_021b9ecc(int player, int kind);
extern int func_0202b878(int id);
extern int func_0202e234(int x);

typedef unsigned short u16;

struct D0650Entry {
    u16 f0;
    u16 kind : 4;
    u16 _pad2 : 12;
    u16 f4;
    u16 next;
};
extern struct D0650Entry data_ov002_022d0650[];

extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];

struct Row2ebc {
    char pad[0x40];
    unsigned int f40;
};

int func_ov002_021b2ebc(int myPlayer, int idx, int target, int flag3, int mask4, int mask5)
{
    int count = 0;

    while (idx != 0) {
        struct D0650Entry *node = &data_ov002_022d0650[idx];
        int player, kind, who, sel;

        idx = node->next;

        if (node->kind < 6 || node->kind > 0xb) {
            continue;
        }

        player = node->f0 & 0xff;
        kind = (node->f0 >> 8) & 0xff;
        who = func_ov002_021b9ecc(player, kind);
        if (who != target) {
            continue;
        }
        if (*(int *)(data_ov002_022d016c + 0xd4) & (1 << (kind + player * 16))) {
            continue;
        }
        if (flag3) {
            struct Row2ebc *row = (struct Row2ebc *)(data_ov002_022cf16c + (player & 1) * 0x868 + kind * 20);
            if ((row->f40 >> 6) & 1) {
                continue;
            }
        }

        sel = (myPlayer != player) + 1;

        if ((mask4 & sel) > 0) {
            int r = func_0202b878(who);
            if (r == 0x16) {
                continue;
            }
            if (kind >= 5 && kind <= 0xa) {
                if (func_0202e234(who) != 0) {
                    continue;
                }
            }
        }
        if ((mask5 & sel) > 0) {
            int r = func_0202b878(who);
            if (r == 0x17) {
                continue;
            }
        }
        count++;
    }
    return count;
}
