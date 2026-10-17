extern char data_ov002_022cf180[];
extern int func_0202b878(int x);
extern int func_ov002_021c33e4(int a, int b, int c);
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

void func_ov002_0224bc88(int arg0, int arg1) {
    unsigned int i = 0;
    Ent *p;
    Side *s;

    if (i < *(unsigned int *)(data_ov002_022cf180 + (arg0 & 1) * 0x868)) {
        s = data_ov002_022cf16c + (arg0 & 1);
        p = s->ents;
        do {
            if (func_0202b878(p->id) == 13 && arg1 != p->id) {
                if (func_ov002_021c33e4(arg0, arg0, i) != 0) {
                    func_ov002_02253458(arg0, 14, i);
                }
            }
            i++;
            p++;
        } while (i < s->count);
    }
}
