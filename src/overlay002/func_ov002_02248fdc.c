extern char data_ov002_022cf17c[];
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern void func_ov002_02253458(int a, int b, int c);

typedef struct {
    unsigned int id : 13;
    unsigned int bit : 1;
    unsigned int mid : 8;
    unsigned int kind : 8;
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

void func_ov002_02248fdc(int arg0) {
    unsigned int i = 0;
    Ent *p;
    Side *s;

    if (*(unsigned int *)(data_ov002_022cf17c + (arg0 & 1) * 0x868) <= i)
        return;
    s = data_ov002_022cf16c + (arg0 & 1);
    p = s->ents;
    do {
        if (p->id == 0x12a1) {
            if (func_ov002_021b3fd8(arg0, 11, 0x12a1, p->kind * 2 + p->bit) == 0) {
                func_ov002_02253458(arg0, 13, i);
            }
        }
        i++;
        p++;
    } while (i < s->count);
}
