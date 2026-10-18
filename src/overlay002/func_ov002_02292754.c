struct Ent {
    unsigned int id : 13;
    unsigned int rest : 19;
};

struct Side {
    char pad0[0xf8];
    struct Ent ent;
    char pad1[0x868 - 0xfc];
};

struct Arg {
    unsigned short a;
    unsigned short b : 1;
};

struct Glob {
    char pad[0xdc];
    unsigned int cur;
};

extern struct Glob data_ov002_022d016c;
extern struct Side data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf26c[];

int func_ov002_02292754(struct Arg *arg)
{
    int off;
    int found;

    if (data_ov002_022d016c.cur != arg->a) {
        off = (arg->b & 1) * 0x868;
        found = 0;
        if (((struct Side *)((char *)data_ov002_022cf16c + off))->ent.id != 0 && *(unsigned short *)((char *)data_ov002_022cf26c + off) != 0) {
            found = 1;
        }
        return found == 0;
    }
    return 0;
}
