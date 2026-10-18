typedef struct {
    char pad0[0xd48];
    int f48;
    char pad1[4];
    int f50;
    int f54;
    int f58;
    char pad2[0xd6c - 0xd5c];
    int f6c;
    char pad3[0xd84 - 0xd70];
    int f84;
} Big;

typedef struct {
    int a;
    int b;
} Small;

extern Big data_ov002_022d016c;
extern Small data_ov002_022cd73c;

void func_ov002_022592b8(int arg) {
    data_ov002_022d016c.f48 = arg;
    data_ov002_022d016c.f84 = 0;
    data_ov002_022d016c.f54 = 0;
    data_ov002_022d016c.f50 = 0;
    data_ov002_022d016c.f6c = data_ov002_022cd73c.b;
    data_ov002_022d016c.f58 = 0;
}
