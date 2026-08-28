typedef unsigned short u16;

struct RecF2 {
    u16 player : 1;
    u16 _rest : 15;
};

struct Ce288 {
    char _pad0[0x5b8];
    int f5b8;
};

struct D016c {
    char _pad0[0xd44];
    int fd44;
};

extern struct Ce288 data_ov002_022ce1a8;
extern struct D016c data_ov002_022d008c;
extern int data_ov002_022cd664[];

extern int func_ov002_021ae434(int a, int b, int c, int d, int e, int f);
extern void func_ov002_0223d9e0(void *self, u16 v);
extern void func_ov002_0226afe0(int a, int b, int c);

struct Self0223fc08 {
    u16 f0;
    struct RecF2 f2;
};

int func_ov002_0223fb20(struct Self0223fc08 *self) {
    switch (data_ov002_022ce1a8.f5b8) {
    case 0: {
        int player = self->f2.player;
        if (data_ov002_022cd664[player] == 1) {
            data_ov002_022d008c.fd44 = 0;
        } else {
            func_ov002_021ae434(0x67, 0x196, 0x197, 0, 0, 0xf);
        }
        data_ov002_022ce1a8.f5b8++;
        return 0;
    }
    case 1: {
        func_ov002_0223d9e0(self, (u16)(self->f2.player ^ data_ov002_022d008c.fd44));
        func_ov002_0226afe0(1 - self->f2.player, self->f0, data_ov002_022d008c.fd44);
        data_ov002_022ce1a8.f5b8++;
        return 0;
    }
    default:
        return 1;
    }
}
