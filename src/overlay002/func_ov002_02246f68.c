extern char data_ov002_022cf178[];
extern int func_0202e234(int x);
extern int func_ov002_021c38c4(int arg0, int arg1);

typedef struct {
    unsigned int id : 13;
    unsigned int bit : 1;
    unsigned int mid : 8;
    unsigned int kind : 8;
    unsigned int rest : 2;
} Ent;

typedef struct {
    char pad0[0xc];
    unsigned int count;
    char pad1[0x120 - 0x10];
    Ent ents[1];
    char pad2[0x868 - 0x124];
} Side;

extern Side data_ov002_022cf16c[];

int func_ov002_02246f68(int arg0, int arg1) {
    int sum = 0;
    unsigned int i = 0;
    int id;
    Ent *p;
    Side *s;

    if (i < *(unsigned int *)(data_ov002_022cf178 + (arg0 & 1) * 0x868)) {
        s = data_ov002_022cf16c + (arg0 & 1);
        p = s->ents;
        do {
            id = p->id;
            if (func_0202e234(id) != 0) {
                if (id == arg1) {
                    arg1 = -1;
                } else {
                    sum += func_ov002_021c38c4(arg0, p->kind * 2 + p->bit);
                }
            }
            i++;
            p++;
        } while (i < s->count);
    }
    return sum;
}
