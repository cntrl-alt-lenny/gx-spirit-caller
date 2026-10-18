typedef struct {
    unsigned int pad0 : 13;
    unsigned int lo   : 1;
    unsigned int pad1 : 8;
    unsigned int hi   : 8;
    unsigned int pad2 : 2;
} Ent;

extern char data_ov002_022cf16c[];
extern int func_ov002_021c2e34(int player, int arg1);
extern int func_ov002_021fd81c(unsigned int a, unsigned int b, int c);

int func_ov002_02259914(int player, int code) {
    unsigned int key = (player << 31) & 0x80000000;
    int idx;
    Ent *e;
    key |= 0x4e0000;
    key |= (unsigned short)code;
    idx = func_ov002_021c2e34(player, code);
    if (idx < 0) {
        return 0;
    }
    e = (Ent *)(0x868 * (player & 1) + (int)data_ov002_022cf16c + 0x418 + idx * 4);
    return func_ov002_021fd81c(key, (unsigned short)(e->hi * 2 + e->lo), 0);
}
