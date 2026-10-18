extern char data_ov002_022cf16c[];
extern int func_ov002_021f3458(void *self);
extern int func_ov002_021f4a84(void *self, int arg);
extern void func_ov002_021df780(int player, int n);

struct Card {
    unsigned short pad0;
    unsigned short a : 1;
    unsigned short pad1 : 13;
    unsigned short b : 1;
    unsigned short pad2 : 1;
};

int func_ov002_021f4df4(struct Card *self, int arg) {
    int player = self->a ^ self->b;
    int n = func_ov002_021f3458(self);
    int r;
    if (*(int *)(data_ov002_022cf16c + (player & 1) * 0x868) <= n) return -1;
    r = func_ov002_021f4a84(self, arg);
    if (r == 1) func_ov002_021df780(player, n);
    return r;
}
