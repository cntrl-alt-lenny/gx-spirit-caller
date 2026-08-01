typedef unsigned int u32;
typedef unsigned short u16;

struct S02273b94_State {
    union {
        u32 raw;
        unsigned int player_bit : 1;
    } field_0;
    char _pad1[0x16 - 4];
    struct {
        u16 b0 : 1;
        u16 b1 : 1;
        u16 rest : 14;
    } h16;
    unsigned int low_byte : 8;
};
extern struct S02273b94_State data_ov002_022cd300;

struct D016cLocal {
    char _pad[0xd70];
    int f_d70;
    char _pad2[4];
    int f_d78;
};
extern struct D016cLocal data_ov002_022d016c;

struct Cd318Local {
    unsigned int low_byte : 8;
};
extern struct Cd318Local data_ov002_022cd318;

extern int  data_ov002_022cd744[];

extern int  func_ov002_02271ab4(void);
extern void func_ov002_021ae400(int a, int b);
extern int  func_ov002_022593f4(void);
extern void func_ov002_021d7a1c(int a, int b);
extern void func_ov002_022716a8(void);
extern void func_ov002_02290500(int player, int field, void *cb);
extern void func_ov002_022592ec(void *cb);

int func_ov002_02273b94(void) {
    unsigned int bit1 = data_ov002_022cd300.h16.b1;
    if (bit1 == 0) goto L_f4;
    {
        unsigned int low_byte = data_ov002_022cd300.low_byte;
        if (low_byte == 0) goto L_34;
        if (low_byte != 1) goto L_ec;
        goto L_a0;
    }

L_34: {
        u32 fld0 = data_ov002_022cd300.field_0.raw;
        u32 player = data_ov002_022cd300.field_0.player_bit;
        int tableval = data_ov002_022cd744[player];
        if (tableval != 1) goto L_64;
        {
            u32 field = (u32)(fld0 << 9) >> 17;
            func_ov002_02290500((int)player, (int)field, (void *)func_ov002_022716a8);
        }
        goto L_74;
L_64:
        func_ov002_021ae400((int)player, 0xeb);
        func_ov002_022592ec((void *)func_ov002_022716a8);
        /* fallthrough */
    }
L_74:
    data_ov002_022cd318.low_byte = data_ov002_022cd318.low_byte + 1;
    return 0;

L_a0:
    if (func_ov002_022593f4() == 0) goto L_c0;
    func_ov002_021d7a1c(data_ov002_022d016c.f_d70, data_ov002_022d016c.f_d78);
    goto L_ec;
L_c0:
    data_ov002_022cd318.low_byte = data_ov002_022cd318.low_byte - 1;
    return 0;

L_ec:
    return 1;

L_f4:
    return func_ov002_02271ab4();
}
