typedef unsigned short u16;

struct F2Fields {
    u16 player : 1;
    u16 _pad : 5;
    u16 field6 : 6;
};

struct Ce288 {
    char _pad[0x5b4];
    int f5b4;
};

extern struct Ce288 data_ov002_022ce1a8;
extern char data_ov002_022cf098[];
extern void func_ov002_021e2a4c(void);
extern void func_ov002_021e2b6c(void);
extern void func_ov002_021d792c(int player, int b);

int func_ov002_021f655c(void *arg0) {
    struct F2Fields *f2 = (struct F2Fields *)((char *)arg0 + 2);
    int field6 = f2->field6;
    int f5b4;

    if (field6 == 0x23) {
        return 1;
    }

    f5b4 = data_ov002_022ce1a8.f5b4;
    switch (f5b4) {
        case 0:
            func_ov002_021e2a4c();
            data_ov002_022ce1a8.f5b4++;
            return 0;
        case 1: {
            int player = f2->player;
            if (*(int *)(data_ov002_022cf098 + (player & 1) * 0x868) != 0) {
                func_ov002_021d792c(player, 0);
                return 0;
            }
            func_ov002_021e2b6c();
            data_ov002_022ce1a8.f5b4++;
            return 0;
        }
        default:
            return 1;
    }
}
