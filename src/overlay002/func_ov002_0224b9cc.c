extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf180[];
typedef struct { unsigned int id:13; unsigned int rest:19; } Ent;
typedef struct {
    char pad0[0x14];
    unsigned int count;
    char pad1[0x400];
    Ent ents[1];
    char pad2[0x44c];
} Side;
extern Side data_ov002_022cf16c[];
void func_ov002_0224b9cc(int player, int arg1, int mode) {
    if (mode == 0) {
        unsigned int i = 0;
        Ent *p;
        Side *s;
        if (*(unsigned int *)(data_ov002_022cf180 + (player & 1) * 0x868) > i) {
            s = data_ov002_022cf16c + (player & 1);
            p = s->ents;
            do {
                if (func_0202b878(p->id) == 2 && func_ov002_021c33e4(player, player, i) != 0) {
                    func_ov002_02253458(player, 14, i);
                }
                i++;
                p++;
            } while (i < s->count);
        }
    } else {
        Ent *p;
        Side *s;
        int other = 1 - player;
        unsigned int i = 0;
        int offset = (other & 1) * 0x868;
        if (*(unsigned int *)(data_ov002_022cf180 + offset) > i) {
            s = (Side *)((char *)data_ov002_022cf16c + offset);
            p = s->ents;
            do {
                if (func_0202e234(p->id) != 0) {
                    func_ov002_02253458(other, 14, i);
                }
                i++;
                p++;
            } while (i < s->count);
        }
    }
}



