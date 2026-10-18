typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int mid : 8;
    unsigned int hi : 8;
    unsigned int rest : 2;
} Entry;

typedef struct {
    unsigned int pad0[4];
    unsigned int count;
    unsigned int pad1[0x98 - 5];
    Entry list[1];
} Side;

typedef struct {
    unsigned int count;
    unsigned int pad[0x868 / 4 - 1];
} SideCnt;

extern int func_0202e234(unsigned int);
extern int func_0202df78(unsigned int, int);
extern int func_ov002_021ca440(int, unsigned int);
extern int func_ov002_021b3fd8(int, int, int, int);
extern void func_ov002_02253458(int, int, int);
extern Side data_ov002_022cf16c[];
extern SideCnt data_ov002_022cf17c[];

void func_ov002_0224be50(int a, int b, int c) {
    unsigned int i = 0;
    unsigned int side = a & 1;
    unsigned int id;
    Entry *p;
    Side *s;

    if (data_ov002_022cf17c[side].count <= i) {
        return;
    }
    s = (Side *)((char *)data_ov002_022cf16c + side * 0x868);
    p = s->list;
    do {
        id = p->id;
        if (func_0202e234(id) != 0 && func_0202df78(id, c) != 0 && func_ov002_021ca440(a, id) != 0) {
            if (func_ov002_021b3fd8(a, 11, 0x12a1, p->hi * 2 + p->lo) == 0) {
                func_ov002_02253458(a, 13, i);
            }
        }
        i++;
        p++;
    } while (i < s->count);
}
