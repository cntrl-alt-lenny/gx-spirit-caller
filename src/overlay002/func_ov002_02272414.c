struct State {
    unsigned int player:1;
    unsigned int pad1:5;
    unsigned int mode:2;
    unsigned int pad2:15;
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
struct Global { char pad[0xd44]; int done; };
struct Slot { unsigned int id:13; unsigned int lo:1; unsigned int mid:8; unsigned int hi:8; unsigned int top:2; };
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern struct Global data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_ov002_0226eb5c(int a, int b, int c, int d);
extern int func_ov002_021ae4bc(void *self, int idx);
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_02271ab4(void);
int func_ov002_02272414(void) {
    int mask;
    switch (data_ov002_022cd300.phase) {
    case 0:
        mask = data_ov002_022cd300.mode ? 0x40 : 0x10;
        if ((mask & func_ov002_0226eb5c(data_ov002_022cd300.player, data_ov002_022cd300.selection, 2, data_ov002_022cd300.option)) > 0) {
            if ((mask & func_ov002_0226eb5c(data_ov002_022cd300.player, data_ov002_022cd300.selection, 0, data_ov002_022cd300.option)) > 0) {
                if (data_ov002_022cd744[data_ov002_022cd300.player] == 1)
                    data_ov002_022d016c.done = 1;
                else
                    func_ov002_021ae4bc((void *)0x72, data_ov002_022cd300.selection);
            } else {
                data_ov002_022d016c.done = 1;
            }
        } else {
            data_ov002_022d016c.done = 0;
        }
        data_ov002_022cd318.phase++;
        return 0;
    case 1:
        if (data_ov002_022d016c.done) {
            int selected = 0;
            int i;
            data_ov002_022cd300.count = 0;
            data_ov002_022cd300.command = 0x197f;
            for (i = *(int *)(data_ov002_022cf180 + (data_ov002_022cd300.player & 1) * 0x868) - 1; i >= 0; i--) {
                if (((struct Slot *)(data_ov002_022cf16c + (data_ov002_022cd300.player & 1) * 0x868 + 0x418))[i].id == 0x197f) {
                    if (!func_ov002_021b3fd8(data_ov002_022cd300.player, 11, 0x197f, ((struct Slot *)(data_ov002_022cf16c + (data_ov002_022cd300.player & 1) * 0x868 + 0x418))[i].hi * 2 + ((struct Slot *)(data_ov002_022cf16c + (data_ov002_022cd300.player & 1) * 0x868 + 0x418))[i].lo)) {
                        selected = ((struct Slot *)(data_ov002_022cf16c + (data_ov002_022cd300.player & 1) * 0x868 + 0x418))[i].hi * 2 + ((struct Slot *)(data_ov002_022cf16c + (data_ov002_022cd300.player & 1) * 0x868 + 0x418))[i].lo;
                        break;
                    }
                }
            }
            func_ov002_021df62c(data_ov002_022cd300.player, 14, selected);
            func_ov002_021e276c((void *)data_ov002_022cd300.player, 0x197f, 5, (unsigned short)selected);
            return 1;
        }
        data_ov002_022cd300.phase = 0;
        break;
    }
    return func_ov002_02271ab4();
}
