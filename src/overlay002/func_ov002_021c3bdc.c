typedef unsigned int u32;
typedef unsigned char u8;

typedef struct {
    u32 id : 13;
    u32 rest : 19;
} Slot;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf178[];
extern int func_0202e234(int x);

int func_ov002_021c3bdc(int idx)
{
    u32 off = (idx & 1) * 0x868;
    u32 i = 0;
    int count = 0;
    Slot *p;
    u8 *e;

    if (i < *(u32 *)(data_ov002_022cf178 + off)) {
        e = data_ov002_022cf16c + off;
        p = (Slot *)(e + 0x120);
        do {
            if (func_0202e234(p->id) != 0) {
                count++;
            }
            i++;
            p++;
        } while (i < *(u32 *)(e + 0xc));
    }
    return count;
}
