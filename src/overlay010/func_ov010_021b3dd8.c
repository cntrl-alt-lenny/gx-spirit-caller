typedef unsigned short u16;
typedef struct {
    int index;
    u16 first, last, previous, other, pad0c, saved;
    int pad10;
    int active;
} State;
extern char data_ov010_021b8d08[];
extern char data_ov010_021b8d44[];
extern State data_ov010_021b8d48;
extern u16 data_ov010_021b8db4[];
extern void func_0207ec68(State *s);
extern void func_0207ed94(State *s);
extern int func_0207f05c(State *s, u16 *p, u16 count);
extern int func_ov010_021b3168(u16 **out, int tile, int level);
extern int func_ov010_021b5d88(void);
extern int func_ov010_021b7eac(void);
int func_ov010_021b3dd8(void) {
    u16 *out = data_ov010_021b8db4;
    int ret = 0;
    char *self = data_ov010_021b8d44;
    int count = 0;
    func_0207ed94(&data_ov010_021b8d48);
    func_0207ec68(&data_ov010_021b8d48);
    count += func_ov010_021b3168(&out, 0, *(int *)(data_ov010_021b8d08 + 0x9c));
    switch (*(int *)(data_ov010_021b8d08 + 0x3c)) {
    case 1: ret = func_ov010_021b5d88(); break;
    case 2: ret = func_ov010_021b7eac(); break;
    case 3: break;
    }
    if (count > 0) func_0207f05c((State *)(self + 4), data_ov010_021b8db4, (u16)count);
    if (ret == 1) {
        *(int *)(data_ov010_021b8d08 + 0xa4) = 0x14000;
        *(int *)(data_ov010_021b8d08 + 0xa0) = 0x14000;
    }
    return ret;
}

