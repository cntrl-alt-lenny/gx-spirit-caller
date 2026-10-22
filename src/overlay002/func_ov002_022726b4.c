struct State {
    unsigned int player:1;
    unsigned int pad1:5;
    unsigned int mode:2;
    unsigned int card:15;
    unsigned int selection:9;
    unsigned short pad4;
    unsigned short command;
    unsigned char count;
    char pad9[13];
    unsigned short pad16:4;
    unsigned short option:2;
    unsigned short pad17:10;
    unsigned int phase:8;
    unsigned int rest:24;
};
struct Phase { unsigned int phase:8; unsigned int rest:24; };
struct Global { char pad[0xd44]; int done; char pad2[0x28]; int player; int base; int offset; };
struct Slot { unsigned int id:13; unsigned int lo:1; unsigned int mid:8; unsigned int hi:8; unsigned int top:2; char pad[16]; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern struct Global data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern int func_0202b100(int a0);
extern int func_0202f050(int x);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae4bc(int self, int idx);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021b97d4(int a, unsigned int b);
extern int func_ov002_021bc618(int arg0);
extern void func_ov002_021deb28(int a, int b);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_0226eb5c(int a,int b,int c,int d);
extern int func_ov002_02271710(int player,int a,int b);
extern int func_ov002_02271ab4(void);
extern int func_ov002_02290500(int player,int selection,int (*callback)(int,int,int));
extern void func_ov002_0229ce5c(char *dst,int format,int text);
int func_ov002_022726b4(void) {
    char message[256];
    int mask;
    switch (data_ov002_022cd300.phase) {
    case 0:
        mask = data_ov002_022cd300.mode ? 0x40 : 0x10;
        if ((mask & func_ov002_0226eb5c(data_ov002_022cd300.player,data_ov002_022cd300.selection,2,data_ov002_022cd300.option)) > 0) {
            if ((mask & func_ov002_0226eb5c(data_ov002_022cd300.player,data_ov002_022cd300.selection,0,data_ov002_022cd300.option)) > 0) {
                if (data_ov002_022cd744[data_ov002_022cd300.player] == 1)
                    data_ov002_022d016c.done = 1;
                else
                    func_ov002_021ae4bc(0xfa,func_ov002_021b97d4(data_ov002_022cd300.player,0x19b2));
            } else data_ov002_022d016c.done = 1;
        } else data_ov002_022d016c.done = 0;
        data_ov002_022cd318.phase++;
        return 0;
    case 1:
        if (!data_ov002_022d016c.done) {
            if (!data_ov002_022cd300.mode && func_0202f050(data_ov002_022cd300.card) && func_ov002_021b3fd8(data_ov002_022cd300.player,11,0x19ad,data_ov002_022cd300.selection) && func_ov002_021bc618(data_ov002_022cd300.player)) {
                data_ov002_022cd300.count = 0;
                return 1;
            }
            data_ov002_022cd300.phase = 0;
            break;
        }
        func_ov002_0229ce5c(message,0x13,func_0202b100(0x19b2));
        func_ov002_021ae400(data_ov002_022cd300.player,(int)message);
        if (data_ov002_022cd744[data_ov002_022cd300.player] == 1)
            func_ov002_02290500(data_ov002_022cd300.player,1,func_ov002_02271710);
        else
            func_ov002_022592ec((int)func_ov002_02271710);
        data_ov002_022cd318.phase++;
        return 0;
    case 2: {
        int player;
        int sum;
        struct Slot *slot;
        if (!func_ov002_022593f4()) return -1;
        player = data_ov002_022d016c.player;
        sum = data_ov002_022d016c.base + data_ov002_022d016c.offset;
        slot = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30);
        func_ov002_021df62c(player,sum,slot[sum].hi * 2 + slot[sum].lo);
        func_ov002_021deb28(player,sum);
        data_ov002_022cd318.phase++;
        return 0;
    }
    case 3:
        data_ov002_022cd300.count = 0;
        data_ov002_022cd300.command = 0x19b2;
        return 1;
    }
    return func_ov002_02271ab4();
}
