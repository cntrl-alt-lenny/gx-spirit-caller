typedef int (*Step)(void);
typedef struct {
    char pad[0xb6c];
    int index;
    char pad_b70[0x30];
    int field_ba0;
} State;
typedef struct {
    char pad[0xa8];
    void *next;
} OverlayState;
extern State data_021040ac;
extern OverlayState data_ov010_021b8d08;
extern int func_02000ef8(void);
extern void func_020057dc(void *arg);

int func_ov010_021b3f98(Step *steps) {
    Step step = steps[data_021040ac.index];
    if (step) {
        if (step()) {
            data_021040ac.index++;
        }
        return 0;
    }
    if (data_ov010_021b8d08.next) {
        data_021040ac.field_ba0 = 0;
        func_020057dc(data_ov010_021b8d08.next);
        return 0;
    }
    return !func_02000ef8();
}
