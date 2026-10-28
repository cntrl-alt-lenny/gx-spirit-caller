struct Control {
    char pad[0xd00];
    int mode;
    char pad1[8];
    int enabled;
    char pad2[8];
    int step;
    int other;
    int timer;
};
struct State {
    int unused;
    int side;
    char pad[0x21c];
    int mode;
    int value;
};
struct Entry { int value; char pad[0x864]; };
typedef int (*Fn)(void);
extern struct Control data_ov002_022d016c;
extern struct State data_ov002_022cd73c;
extern struct Entry data_ov002_022cf198[];
extern Fn data_ov002_022ca988[];
extern int func_ov002_021b15ec(void);
extern int func_ov002_021d4f18(void);

int func_ov002_021b0a30(void) {
    if (data_ov002_022ca988[data_ov002_022d016c.step] != 0) {
        if (data_ov002_022d016c.enabled != 0) {
            if (func_ov002_021b15ec() == 0) return 1;
        }
        if (func_ov002_021d4f18() == 0) {
            if (data_ov002_022ca988[data_ov002_022d016c.step]() != 0) {
                data_ov002_022d016c.step++;
                data_ov002_022d016c.timer = 0;
            }
        }
        return 0;
    }
    data_ov002_022cd73c.mode = data_ov002_022d016c.mode;
    if (data_ov002_022d016c.mode == 2) {
        data_ov002_022cd73c.value = data_ov002_022cf198[(data_ov002_022cd73c.side ^ 1) & 1].value;
    } else {
        data_ov002_022cd73c.value = data_ov002_022cf198[data_ov002_022cd73c.side & 1].value;
    }
    return 1;
}



