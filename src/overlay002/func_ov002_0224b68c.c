extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern void func_ov002_02253458(int a, int b, int c);
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
typedef struct {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int attr:8;
    unsigned int pad2:2;
} Ent;
typedef struct { char pad[0x10]; unsigned int count; char pad2[0x24c]; Ent entries[386]; } Side;
void func_ov002_0224b68c(int player, int unused, int mode) {
    switch (mode) {
    case 0: {
        int side = player & 1;
        unsigned int i = 0;
        int offset = side * 0x868;
        Ent *p;
        Side *base;
        if (*(unsigned int *)(data_ov002_022cf17c + offset) > i) {
            base = (Side *)data_ov002_022cf16c + side;
            p = base->entries;
            do {
                if (func_0202e234(p->id) != 0) {
                    if (func_ov002_021b3fd8(player, 11, 0x12a1, p->attr * 2 + p->flag) == 0) {
                        func_ov002_02253458(player, 13, i);
                    }
                }
                i++;
                p++;
            } while (i < base->count);
        }
        break;
    }
    case 1: {
        int side = player & 1;
        int offset = side * 0x868;
        Ent *p;
        Side *base;
        unsigned int i = 0;
        if (*(unsigned int *)(data_ov002_022cf17c + offset) > i) {
            base = (Side *)data_ov002_022cf16c + side;
            p = base->entries;
            do {
                if (func_0202b878(p->id) == 0x16) {
                    func_ov002_02253458(player, 13, i);
                }
                i++;
                p++;
            } while (i < base->count);
        }
        break;
    }
    case 2: {
        int side = player & 1;
        int offset = side * 0x868;
        Ent *p;
        Side *base;
        unsigned int i = 0;
        if (*(unsigned int *)(data_ov002_022cf17c + offset) > i) {
            base = (Side *)data_ov002_022cf16c + side;
            p = base->entries;
            do {
                if (func_0202b878(p->id) == 0x17) {
                    func_ov002_02253458(player, 13, i);
                }
                i++;
                p++;
            } while (i < base->count);
        }
        break;
    }
    }
}



