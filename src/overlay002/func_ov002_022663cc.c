typedef unsigned int u32;
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
struct DuelState {
    char pad[0xcec];
    void *player;
    char padcf0[8];
    int pending;
    int choice;
    char padd00[0x2c];
    int step;
    int sub;
    int padd34;
    int state;
};
extern struct DuelState data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021be384(int a0, int a1, int a2);
extern int func_ov002_021bf294(int a, int b, int c, int d, int e);
/* The original supplies only r0 to this four-argument forwarding thunk. */
extern int func_ov002_021ca2b8();
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_02259f98(int player);
extern int func_ov002_022627ac(int a);
extern int func_ov002_022662e4(int arg0);
extern int func_ov002_02266358(int self);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);

int func_ov002_022663cc(void) {
    void *self = data_ov002_022d016c.player;
    int player = (int)self;
    int a, b, other;
    switch (data_ov002_022d016c.state) {
    case 0:
        data_ov002_022d016c.choice = data_ov002_022d016c.pending;
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        if (func_ov002_021bc618(player) && func_ov002_021ca2b8(player) && func_ov002_022536e8(self, 0x151e, 0)) {
            func_ov002_021ae400(player, 0x11d);
            data_ov002_022d016c.state++;
        } else {
            data_ov002_022d016c.state = 8;
        }
        return 0;
    case 2:
        func_ov002_021af9d0(player, 6, 0x151e, 0);
        data_ov002_022d016c.state++;
        return 0;
    case 3:
        func_ov002_0227ac64(player, (struct Record *)func_ov002_021afb74(), 1, 0, 0x151e0000);
        data_ov002_022d016c.state++;
        return 0;
    case 4:
        if (func_ov002_02259f98(player)) {
            a = func_ov002_022662e4(player);
            other = 1 - player;
            b = func_ov002_02266358(other);
            if (a >= 0 && b >= 0 && func_ov002_021be384(player, a, 1) && func_ov002_021bf294(player, a, other, b, 1)) {
                data_ov002_022d016c.state++;
                return 0;
            }
        }
        return 1;
    case 5:
        if (data_ov002_022d016c.choice == 3) {
            data_ov002_022d016c.step = 1;
            data_ov002_022d016c.sub = 0;
        } else {
            data_ov002_022d016c.step = 0;
            data_ov002_022d016c.sub = 0;
        }
        data_ov002_022d016c.state++;
        return 0;
    case 6:
        if (func_ov002_022627ac(player)) data_ov002_022d016c.state++;
        return 0;
    case 7:
        if (data_ov002_022d016c.choice != 3) {
            func_ov002_021d479c((data_ov002_022d016c.choice + 12) | (player ? 0x8000 : 0), 0, 0, 0);
        }
        data_ov002_022d016c.state++;
        return 0;
    default:
        return 1;
    }
}






