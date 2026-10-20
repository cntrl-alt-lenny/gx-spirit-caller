typedef struct { int f0, f4, f8, fc, f10; } Config;
typedef struct { char pad0[0xce4]; int fce4; int fce8; int fcec; int fcf0; int fcf4; char pad1[0x14]; int fd0c; } State;
typedef struct { int life; char pad[0x864]; } Player;
extern Player data_ov002_022cf16c[];
extern char data_ov002_022cd750[], data_ov002_022cd858[];
extern Config data_ov002_022cd73c;
extern State data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae7b8(void);
extern void func_ov002_021ba834(int side, void *deck);
extern void func_ov002_021ba230(int side);
extern int func_ov002_0229ade0(int command, ...);
extern void func_ov002_021b085c(int a);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
int func_ov002_021ae89c(void) {
    func_ov002_021ae7b8();
    data_ov002_022cf16c[0].life = 8000;
    data_ov002_022cf16c[1].life = 8000;
    func_ov002_021ba834(0, data_ov002_022cd750);
    func_ov002_021ba834(1, data_ov002_022cd858);
    data_ov002_022d016c.fce4 = data_ov002_022cd73c.f0;
    func_ov002_021ba230(data_ov002_022cd73c.f10);
    func_ov002_021ba230(1 - data_ov002_022cd73c.f10);
    func_ov002_0229ade0(13, 0, data_ov002_022cf16c[0].life, 0);
    func_ov002_0229ade0(13, 1, data_ov002_022cf16c[1].life, 0);
    func_ov002_0229ade0(20, 0, 13, 0);
    func_ov002_0229ade0(20, 1, 13, 0);
    func_ov002_0229ade0(20, 0, 12, 0);
    func_ov002_0229ade0(20, 1, 12, 0);
    data_ov002_022d016c.fcec = data_ov002_022cd73c.f10;
    data_ov002_022d016c.fcf4 = 0xffff;
    if (data_ov002_022cd73c.f8 == 3) {
        func_ov002_021b085c(0);
    } else if (data_ov002_022d016c.fd0c == 0 || data_ov002_022cd744[data_ov002_022cd73c.f10] != 2) {
        func_ov002_021d479c(1, 0, 0, 0);
        func_ov002_021d479c((data_ov002_022d016c.fcec ? 0x8000 : 0) | 0x55, 0, 5, 0);
        func_ov002_021d479c(((1 - data_ov002_022d016c.fcec) ? 0x8000 : 0) | 0x55, 0, 5, 0);
    }
    return 1;
}
