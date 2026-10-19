typedef unsigned int u32;
typedef unsigned short u16;
struct State {
    char pad[0x5cc];
    int active;
    int count;
    volatile u32 index;
    int blocked;
    unsigned char first;
    char gap[0x1f];
    u32 value;
    char tail[0x80];
    int flag;
    int player;
    int ready;
    int last;
};
struct Global {
    char pad[0xcec];
    int player;
    char gap[0x1c];
    int enabled;
};
extern struct State data_ov002_022ce288;
extern struct Global data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern unsigned char data_ov002_022ce863[];
extern u32 data_ov002_022ce880[];
extern void func_ov002_021b1570(int a, int b, void *c, int n);
void func_ov002_02244fe4(int a, u32 b) {
    u16 buf[3];
    if (data_ov002_022d016c.enabled != 0 && data_ov002_022cd744[data_ov002_022d016c.player] == 2) {
        buf[0] = a;
        buf[1] = b;
        buf[2] = b >> 16;
        func_ov002_021b1570(9, -1, buf, 6);
        return;
    }
    if (data_ov002_022ce288.blocked != 0) return;
    if (data_ov002_022ce288.active != 0) {
        u32 i = data_ov002_022ce288.index + 1;
        if (i > 32) i = 32;
        data_ov002_022ce288.index = i;
        data_ov002_022ce863[i] = a;
        data_ov002_022ce880[data_ov002_022ce288.index] = b;
    } else {
        data_ov002_022ce288.index = 1;
        data_ov002_022ce288.count++;
        data_ov002_022ce288.first = a;
        data_ov002_022ce288.value = b;
    }
    data_ov002_022ce288.player = data_ov002_022d016c.player;
    data_ov002_022ce288.flag = 0;
    data_ov002_022ce288.ready = 1;
    data_ov002_022ce288.last = 0;
    if (a == 3 || a == 4 || a == 0x17)
        data_ov002_022ce288.player = 1 - data_ov002_022d016c.player;
}

