extern char data_ov002_022cf180[];
extern int func_0202e234(int x);
extern void func_ov002_02253458(int a, int b, int c);

typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
} Ent;

typedef struct {
    char pad0[0x14];
    unsigned int count;
    char pad1[0x418 - 0x18];
    Ent ents[1];
    char pad2[0x868 - 0x41c];
} Side;

extern Side data_ov002_022cf16c[];

void func_ov002_0224d1f0(int arg0) {
    unsigned int i = 0;
    Ent *p;
    Side *s;
    Ent *q;
    Side *t;
    unsigned int j;
    int other = 1 - arg0;

    if (i < *(unsigned int *)(data_ov002_022cf180 + 0x868 * (other & 1))) {
        s = (Side *)((char *)data_ov002_022cf16c + 0x868 * (other & 1));
        p = s->ents;
        do {
            if (func_0202e234(p->id) != 0) {
                func_ov002_02253458(other, 14, i);
            }
            i++;
            p++;
        } while (i < s->count);
    }
    j = 0;
    if (j < *(unsigned int *)(data_ov002_022cf180 + (arg0 & 1) * 0x868)) {
        t = data_ov002_022cf16c + (arg0 & 1);
        q = t->ents;
        do {
            if (func_0202e234(q->id) != 0) {
                func_ov002_02253458(arg0, 14, j);
            }
            j++;
            q++;
        } while (j < t->count);
    }
}
