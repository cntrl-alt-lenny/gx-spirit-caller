typedef unsigned short u16;
typedef unsigned int u32;

struct St {
    u16 f0;
    u16 f2_0 : 1;
    u16 f2_rest : 15;
    u16 f4[4];
    u16 fc;
};

struct Card {
    u32 id : 13;
    u32 rest : 19;
};

struct Ce288 {
    char pad[0x48c];
    struct St *st;
};

extern struct Ce288 data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int func_0202b950(int x);
extern int func_0202e234(int x);
extern int func_ov002_02257ab8(int a, int b);

int func_ov002_021f9624(u32 player, int kind, int idx) {
    if (player != data_ov002_022ce288.st->f2_0) {
        return 0;
    }
    if (kind == 11) {
        u32 id = ((struct Card *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 4 + 0x120))->id;
        data_ov002_022ce288.st->fc = func_0202b950(id);
        if (func_0202e234(id) != 0) {
            if (data_ov002_022ce288.st->fc != 0xffff) {
                if (func_ov002_02257ab8((int)data_ov002_022ce288.st, 1 - player) != 0) {
                    return 0x800;
                }
            }
        }
    }
    return 0;
}
