typedef unsigned int u32;
typedef unsigned short u16;
struct State {
    u32 side:1;
    u32 spare:5;
    u32 mode:2;
    u32 id:15;
    u32 index:9;
    u16 pad4;
    u16 saved;
    unsigned char flag;
    char pad9[0xd];
    u16 spare16:4;
    u16 kind:2;
    u16 rest16:10;
    u32 phase:8;
    u32 rest18:24;
};
extern struct State data_ov002_022cd300;
extern struct { u32 phase:8; u32 rest:24; } data_ov002_022cd318;
extern int data_ov002_022cd744[];
extern struct { char pad[0xd44]; int result; } data_ov002_022d016c;
extern int func_ov002_0226eb5c(int a, int b, int c, int d);
extern int func_ov002_021ae4bc(void *self, int idx);
extern int func_ov002_02271ab4(void);
int func_ov002_022742dc(void) {
    int mask;
    switch (data_ov002_022cd300.phase) {
    case 0:
        mask = data_ov002_022cd300.mode ? 0x40 : 0x10;
        if ((mask & func_ov002_0226eb5c(data_ov002_022cd300.side, data_ov002_022cd300.index, 2, data_ov002_022cd300.kind)) > 0) {
            if ((mask & func_ov002_0226eb5c(data_ov002_022cd300.side, data_ov002_022cd300.index, 0, data_ov002_022cd300.kind)) > 0) {
                if (data_ov002_022cd744[data_ov002_022cd300.side] == 1)
                    data_ov002_022d016c.result = 1;
                else
                    func_ov002_021ae4bc((void *)0x72, data_ov002_022cd300.index);
            } else data_ov002_022d016c.result = 1;
        } else data_ov002_022d016c.result = 0;
        data_ov002_022cd318.phase++;
        return 0;
    case 1:
        if (data_ov002_022d016c.result) {
            data_ov002_022cd300.flag = 0;
            data_ov002_022cd300.saved = data_ov002_022cd300.id;
            return 1;
        }
        data_ov002_022cd300.phase = 0;
    }
    return func_ov002_02271ab4();
}
