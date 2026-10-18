typedef unsigned short u16;
typedef unsigned int u32;

extern char data_ov002_022cf188[];
extern int func_ov002_021bb91c(int id);

typedef struct {
    u16 pad0;
    u16 side : 1;
    u16 mid : 5;
    u16 kind : 6;
    u16 rest : 4;
} Card;

int func_ov002_022075a4(Card *p)
{
    if (*(u32 *)(data_ov002_022cf188 + (p->side & 1) * 0x868) < 2) {
        return 0;
    }
    if (p->kind != 0x23) {
        if (func_ov002_021bb91c(0x16cb) != 0 || func_ov002_021bb91c(0x16e4) != 0) {
            return 1;
        }
        return 0;
    }
    return 1;
}
