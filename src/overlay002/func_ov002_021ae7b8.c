extern void func_ov002_0229cd5c(void *p, int n);

typedef struct A {
    int pad0[2];
    int f8;
    int fc;
    char pad10[0x224 - 0x10];
    int f224;
    int f228;
} A;

typedef struct B {
    char pad[0xcf8];
    int fcf8;
    char pad2[0xd0c - 0xcfc];
    int fd0c;
} B;

extern char data_ov002_022cd300[];
extern char data_ov002_022cd31c[];
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd524[];
extern A data_ov002_022cd73c;
extern char data_ov002_022cd968[];
extern char data_ov002_022cdc78[];
extern char data_ov002_022ce288[];
extern char data_ov002_022ce950[];
extern char data_ov002_022cf16c[];
extern B data_ov002_022d016c;

void func_ov002_021ae7b8(void) {
    func_ov002_0229cd5c(data_ov002_022cf16c, 0x1dc0);
    func_ov002_0229cd5c(data_ov002_022cdc78, 0x610);
    func_ov002_0229cd5c(data_ov002_022ce950, 0x81c);
    func_ov002_0229cd5c(data_ov002_022cd300, 0x1c);
    func_ov002_0229cd5c(data_ov002_022ce288, 0x6c8);
    func_ov002_0229cd5c(data_ov002_022cd3f4, 0x130);
    func_ov002_0229cd5c(data_ov002_022cd31c, 0xd8);
    func_ov002_0229cd5c(data_ov002_022cd524, 0x218);
    func_ov002_0229cd5c(data_ov002_022cd968, 0x310);
    if (data_ov002_022cd73c.f8 == 2 || data_ov002_022cd73c.fc == 2) {
        data_ov002_022d016c.fd0c = 1;
    }
    data_ov002_022d016c.fcf8 = 7;
    data_ov002_022cd73c.f224 = 0;
    data_ov002_022cd73c.f228 = 0;
}
