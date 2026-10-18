typedef unsigned int u32;
typedef unsigned short u16;

typedef struct {
    u32 count : 13;
    u32 rest : 19;
    u32 pad[4];
} Ent;

typedef struct {
    u16 v;
    u16 pad[9];
} Ent2;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

int func_ov002_021f198c(int a, int b, int c)
{
    int base = (b & 1) * 0x868;
    Ent *e = (Ent *)(data_ov002_022cf16c + base + 0x30);

    if (e[c].count == 0) {
        return 0;
    }
    return ((Ent2 *)(data_ov002_022cf1a4 + base))[c].v == 0;
}
