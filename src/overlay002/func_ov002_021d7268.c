extern int func_ov002_021b99b4(int player, int id);
extern int func_0202e2c8(int unused0);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_02244fe4(int a, unsigned int b);
typedef struct { unsigned short id:13; unsigned short rest:3; unsigned short other; } Card;
extern Card data_ov002_022d0250[];

int func_ov002_021d7268(int player, int id, int flag) {
    int type;
    if (func_ov002_021b99b4(player, id) >= 0) {
        type = func_0202e2c8(data_ov002_022d0250[id].id) ? 12 : 13;
        func_ov002_021d479c(0x3f,
            ((id & 0x3ff) << 6) | ((player & 1) | 0x1c),
            (player & 1) | ((type & 0x1f) << 1) | ((flag == 0) << 6), 0);
        func_ov002_02244fe4(0x24, 0);
        return 1;
    }
    return 0;
}


