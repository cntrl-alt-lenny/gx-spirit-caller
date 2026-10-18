typedef unsigned int u32;
typedef unsigned short u16;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
} Bits;

typedef struct {
    char pad[0x30];
    Bits b;
    u32 pad34;
    u16 h38;
    u16 pad3a;
    u32 pad3c;
    u32 pad40;
} Ent;

typedef struct {
    char b[0x868];
} Side;

extern Side data_ov002_022cf16c[];
extern int func_ov002_021c92fc(int a, int b);

int func_ov002_021bd200(int a)
{
    int i;
    Bits *w;
    Ent *e = (Ent *)data_ov002_022cf16c[a & 1].b;
    w = &e->b;
    for (i = 0; i < 5; i++, w = (Bits *)((char *)w + 0x14), e = (Ent *)((char *)e + 0x14)) {
        if (w->id != 0 && e->h38 != 0) {
            if (func_ov002_021c92fc(a, i) & 0x46) {
                return 0;
            }
        }
    }
    return 1;
}
