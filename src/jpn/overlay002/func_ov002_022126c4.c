typedef unsigned short u16;

struct RecF2 {
    u16 player : 1;
    u16 field5 : 5;
};

struct RecF4Bit2 {
    u16 _pad : 2;
    u16 bit2 : 1;
};

struct Ce288 {
    char _pad[0x5a8];
    int f5a8;
};

struct D016c {
    char _pad[0xd44];
    int fd44;
};

struct D0e6c {
    char _pad[0xb2];
    u16 fb2;
};

extern struct Ce288 data_ov002_022ce1a8;
extern struct D016c data_ov002_022d008c;
extern struct D0e6c data_ov002_022d0d8c;
extern int data_ov002_022cd664[];
extern int func_ov002_021afff0(int a);
extern void func_ov002_021ae584(int a);
extern void func_ov002_0226b13c(int player, int field6, int c, int d);
extern void func_ov002_021d58dc(int player, int field6, int c, int d, int e);

int func_ov002_022126c4(void *arg0_raw) {
    struct RecF4Bit2 *f4 = (struct RecF4Bit2 *)((char *)arg0_raw + 4);
    struct RecF2 *f2 = (struct RecF2 *)((char *)arg0_raw + 2);
    int f5a8;

    if (f4->bit2 != 0) {
        return 0;
    }

    f5a8 = data_ov002_022ce1a8.f5a8;
    if (f5a8 == 0x7e) {
        goto case_7e;
    }
    if (f5a8 == 0x7f) {
        goto case_7f;
    }
    if (f5a8 != 0x80) {
        goto fail;
    }

    {
        int player = f2->player;
        if (data_ov002_022cd664[player] == 1) {
            data_ov002_022d008c.fd44 = func_ov002_021afff0(2);
        } else {
            func_ov002_021ae584(0x38);
        }
        return 0x7f;
    }

case_7f: {
        int player = f2->player;
        int field5 = f2->field5;
        int fd44 = data_ov002_022d008c.fd44;
        func_ov002_0226b13c(player, field5, 1, fd44);
        return 0x7e;
    }

case_7e: {
        u16 fb2 = data_ov002_022d0d8c.fb2;
        int player = f2->player;
        int field5 = f2->field5;
        int f0 = *(u16 *)arg0_raw;
        func_ov002_021d58dc(player, field5, f0, 2, fb2);
        return 0xa;
    }

fail:
    return 0;
}
