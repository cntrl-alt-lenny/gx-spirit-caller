typedef unsigned int u32;
typedef unsigned short u16;

struct S { u16 a; u16 side : 1; u16 rest : 15; };
struct E { u32 id : 13; u32 rest : 19; };
struct Side {
    char pad0[0xc];
    u32 count;
    char pad1[0x120 - 0x10];
    struct E ids[1];
};

extern struct Side data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_021bd030(int a);
extern int func_0202e234(int a);
extern int func_0202e6f4(int a);

int func_ov002_022925e4(struct S *p)
{
    u32 i;
    u32 id;

    if (func_ov002_021ca2b8(p->side) == 0) {
        return 0;
    }
    if (func_ov002_021bd030(p->side) == 0) {
        return 0;
    }
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + (p->side & 1) * 0x868)) {
        do {
            id = ((struct Side *)((char *)data_ov002_022cf16c + (p->side & 1) * 0x868))->ids[i].id;
            if (func_0202e234(id) != 0 && func_0202e6f4(id) != 0) {
                return 1;
            }
            i++;
        } while (i < ((struct Side *)((char *)data_ov002_022cf16c + (p->side & 1) * 0x868))->count);
    }
    return 0;
}
