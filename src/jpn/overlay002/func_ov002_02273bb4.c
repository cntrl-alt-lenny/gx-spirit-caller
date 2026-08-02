typedef unsigned int u32;
typedef unsigned short u16;

struct S02273ca4_State {
    union {
        u32 raw;
        unsigned int player_bit : 1;
    } field_0;
    char _pad[0x16 - 4];
    u16 h16;
    unsigned int low_byte : 8;
};
extern struct S02273ca4_State data_ov002_022cd220;
extern char data_ov002_022cf098[];
extern char data_ov002_022cf08c[];
extern int  func_ov002_022719c4(void);
extern void func_ov002_021d792c(int player, int match);

int func_ov002_02273bb4(void) {
    unsigned int state = data_ov002_022cd220.low_byte;
    if (state == 0) goto do_mutate;
    if (state != 0xf) goto shared;
    goto state_f;

do_mutate:
    data_ov002_022cd220.low_byte = 0xa;

shared: {
    int r = func_ov002_022719c4();
    if (r != 1) return r;
    data_ov002_022cd220.low_byte = 0xf;
    return 0;
}

state_f: {
    u32 fld0 = data_ov002_022cd220.field_0.raw;
    u32 player = data_ov002_022cd220.field_0.player_bit;
    int off = (player & 1) * 0x868;
    if (*(u32 *)(data_ov002_022cf098 + off) <= 1) goto return_one;
    {
        u32 v = *(u32 *)(data_ov002_022cf08c + off + 0x120);
        u32 lvl = (u32)(v << 2) >> 24;
        u32 flag = (u32)(v << 18) >> 31;
        u32 combined = flag + (lvl << 1);
        func_ov002_021d792c((int)player, (combined == (fld0 >> 23)) ? 1 : 0);
    }
    return 0;
}
return_one:
    return 1;
}
