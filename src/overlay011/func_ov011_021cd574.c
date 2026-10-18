extern struct {
    char pad[0x2a4];
    unsigned int low : 5;
    unsigned int value : 4;
    unsigned int high : 23;
} data_ov011_021d4000;
extern struct Work {
    char pad[0x1fc];
    int x, y;
} data_ov011_021d403c;
extern int func_0201b770(void);
extern void func_ov011_021cd0dc(int, int, int, int, int *, int, int, int);
void func_ov011_021cd574(void) {
    struct Work *base = &data_ov011_021d403c;
    int flags;
    int pos[2];
    if (data_ov011_021d4000.value != 2) return;
    flags = func_0201b770();
    pos[0] = 0x56000 - base->x;
    pos[1] = 0x14c000 - base->y;
    if (flags & 0x2000) {
        func_ov011_021cd0dc(7, -1, 2, 0x1b, pos, 0, 0, 0);
    }
    if (flags & 0x4000) {
        func_ov011_021cd0dc(6, -1, 2, 0x1b, pos, 0, 0, 0);
    }
}


