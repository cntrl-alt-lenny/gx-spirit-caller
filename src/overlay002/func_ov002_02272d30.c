struct State {
    unsigned int player:1;
    unsigned int pad1:7;
    unsigned int selection:15;
    unsigned int pad2:9;
    int pad4;
    unsigned char count;
    char pad9[7];
    unsigned short list;
    char pad12[4];
    unsigned short flag0:1;
    unsigned short enabled:1;
    unsigned short flagrest:14;
    unsigned int phase:8;
    unsigned int phaserest:24;
};
struct Phase { unsigned int phase:8; unsigned int rest:24; };
struct Slot { unsigned int id:13; unsigned int lo:1; unsigned int mid:8; unsigned int hi:8; unsigned int top:2; char pad[16]; };
struct Global { char pad[0xd70]; int player; int base; int offset; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern struct Global data_ov002_022d016c;
extern int func_ov002_02271ab4(void);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_02270ba0(int player, int a, int b);
extern int func_ov002_02290500(int player, int selection, int (*callback)(int,int,int));
extern int func_ov002_0229ade0(int a,int b,int c,int d);
int func_ov002_02272d30(void) {
    if (!data_ov002_022cd300.enabled) return func_ov002_02271ab4();
    switch (data_ov002_022cd300.phase) {
    case 0:
        if (data_ov002_022cd744[data_ov002_022cd300.player] == 1)
            func_ov002_02290500(data_ov002_022cd300.player, data_ov002_022cd300.selection, func_ov002_02270ba0);
        else {
            func_ov002_021ae400(data_ov002_022cd300.player, 0x12);
            func_ov002_022592ec((int)func_ov002_02270ba0);
        }
        data_ov002_022cd318.phase++;
        return 0;
    case 1: {
        int player;
        int sum;
        struct Slot *slot;
        if (!func_ov002_022593f4()) return -1;
        player = data_ov002_022d016c.player;
        sum = data_ov002_022d016c.base + data_ov002_022d016c.offset;
        slot = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        func_ov002_0229ade0(0x28, player, sum, slot[sum].hi * 2 + slot[sum].lo);
        data_ov002_022cd300.count = 1;
        data_ov002_022cd300.list = (unsigned char)player | ((unsigned char)sum << 8);
        return 1;
    }
    }
    return 0;
}
