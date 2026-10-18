typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 id;
    u16 type : 4;
    u16 sub : 4;
    u16 rest : 8;
} Entry;

int func_ov002_02256150(Entry *e)
{
    switch (e->type) {
    case 2:
        return e->id == 0x1598;
    case 10:
    case 11:
        return 1;
    case 6:
    case 7:
        return (e->sub & 1) > 0;
    default:
        return 0;
    }
}
