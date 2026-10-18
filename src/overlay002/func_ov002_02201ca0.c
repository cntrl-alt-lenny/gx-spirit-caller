typedef unsigned short u16;
typedef unsigned int u32;

extern int func_0202b878(u16 a);
extern int func_0202b8c0(u16 a);

typedef struct {
    u16 id;
    u16 pad : 12;
    u16 kind : 2;
    u16 rest : 2;
} Entry;

int func_ov002_02201ca0(u16 *a, Entry *b)
{
    if (b == 0) {
        return 0;
    }
    if (b->kind != 0) {
        return 0;
    }
    switch (*a) {
    case 0x134f:
        if (func_0202b878(b->id) == 0x16 && func_0202b8c0(b->id) == 2) {
            return 1;
        }
        return 0;
    case 0x1350:
        if (func_0202b878(b->id) == 0x16 && func_0202b8c0(b->id) == 4) {
            return 1;
        }
        return 0;
    case 0x1351:
        if (func_0202b878(b->id) == 0x17 && func_0202b8c0(b->id) == 4) {
            return 1;
        }
        return 0;
    }
    return 0;
}
