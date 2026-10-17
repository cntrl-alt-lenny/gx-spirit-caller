typedef struct {
    char pad[0x14];
    unsigned int n;
    char pad2[0x868 - 0x18];
} Player;

extern Player data_ov002_022cf16c[];
extern void func_ov002_02253458(int a, int b, unsigned int c);

void func_ov002_0224ee48(int player)
{
    unsigned int i;
    int idx = player & 1;
    for (i = 0; i < data_ov002_022cf16c[idx].n; i++) {
        func_ov002_02253458(player, 14, i);
    }
}
