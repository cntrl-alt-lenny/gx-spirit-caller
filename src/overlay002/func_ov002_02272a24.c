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
extern struct State data_ov002_022cd300;
extern struct Phase data_ov002_022cd318;
extern struct Global data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_0226eb5c(int a, int b, int c, int d);
extern int func_ov002_021ae4bc(void *self, int idx);
extern void func_ov002_021df680(int arg0, int arg1);
extern int func_ov002_02271ab4(void);
int func_ov002_02272a24(void) {
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
            data_ov002_022cd318.phase++;
            return 0;
        }
        break;
    case 1:
        if (data_ov002_022d016c.done) {
            data_ov002_022cd300.count = 0;
            data_ov002_022cd300.command = 0x1aa3;
            func_ov002_021df680(data_ov002_022cd300.player, 0x1aa3);
            return 1;
        }
        data_ov002_022cd300.phase = 0;
        break;
    }
    return func_ov002_02271ab4();
}
