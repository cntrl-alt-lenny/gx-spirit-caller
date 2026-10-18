typedef unsigned short u16;

typedef struct {
    u16 pad0;
    u16 flag : 1;
} Arg;

typedef struct {
    char pad0[0x14];
    int a;
    char pad1[0x864];
    int b;
} Data;

extern Data data_ov002_022cf16c;
extern int func_ov002_021ca698(int, int);

int func_ov002_0220136c(Arg *p) {
    if (func_ov002_021ca698(p->flag, 0) && data_ov002_022cf16c.a) {
        return 1;
    }
    if (func_ov002_021ca698(p->flag, 1) && data_ov002_022cf16c.b) {
        return 1;
    }
    return 0;
}
