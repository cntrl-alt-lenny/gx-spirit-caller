typedef struct {
    char _pad0[8];
    unsigned char f_8;
    char _pad1[3];
} TableRow_020353cc;

typedef struct {
    char _pad0[0x34];
    TableRow_020353cc *f_34;
} Data0219b2e0_t;
extern Data0219b2e0_t data_0219b200;

typedef struct {
    char _pad0[0x26];
    signed char f_26;
    char _pad1[0xd];
    int f_34;
    char _pad2[0x30];
    unsigned short f_68;
    signed char f_6a;
} Obj_020353cc;

extern char data_0219b680[];

extern void func_02036248(Obj_020353cc *e, int val);
extern void func_02037d70(Obj_020353cc *self, int val, int zero);

int func_0203537c(Obj_020353cc *self, int idArg) {
    unsigned int i;
    int id;
    int limit;
    int result;
    Obj_020353cc *e;

    id = idArg;
    if (idArg == 0) {
        id = self->f_34;
    }

    limit = (data_0219b200.f_34[(unsigned short)id].f_8 & 0xf) + 1;

    result = 0;
    for (i = 0, e = (Obj_020353cc *)data_0219b680; i < 0x1c;
         i++, e = (Obj_020353cc *)((char *)e + 0x78)) {
        if (e->f_6a < 0) {
            continue;
        }
        if (e->f_34 != id) {
            continue;
        }
        if (!(e->f_68 & 0x4000)) {
            continue;
        }
        if (!(e->f_34 & 0x1000000) || e == self) {
            continue;
        }

        limit--;
        if (limit > 0) {
            continue;
        }

        if (idArg != 0) {
            return 1;
        }

        result = 1;
        if (e->f_26 > self->f_26) {
            func_02037d70(self, e->f_26, 0);
        }
        func_02036248(e, -1);
    }

    return result;
}
