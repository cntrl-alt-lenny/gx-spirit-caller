extern char data_ov002_022cf17c[];
extern int func_0202e234(int x);
extern int func_0202b950(int x);
extern int func_0202e5ac(int x);
extern int func_ov002_021ca440(int a, int b);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern void func_ov002_02253458(int a, int b, int c);

typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int pad : 8;
    unsigned int hi : 8;
    unsigned int rest : 2;
} Ent;

typedef struct {
    char pad0[0x10];
    unsigned int count;
    char pad1[0x260 - 0x14];
    Ent ents[1];
    char pad2[0x868 - 0x264];
} Side;

extern Side data_ov002_022cf16c[];

void func_ov002_0224bf3c(int arg0) {
    unsigned int i = 0;
    int id;
    Ent *p;
    Side *s;

    if (i < *(unsigned int *)(data_ov002_022cf17c + (arg0 & 1) * 0x868)) {
        s = data_ov002_022cf16c + (arg0 & 1);
        p = s->ents;
        do {
            id = p->id;
            if (func_0202e234(id) != 0 && func_0202b950(id) <= 0x5dc &&
                func_0202e5ac(id) != 0 && func_ov002_021ca440(arg0, id) != 0) {
                if (func_ov002_021b3fd8(arg0, 11, 0x12a1, p->hi * 2 + p->lo) == 0) {
                    func_ov002_02253458(arg0, 13, i);
                }
            }
            i++;
            p++;
        } while (i < s->count);
    }
}
