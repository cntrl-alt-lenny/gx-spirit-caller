typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; } Card;
struct State { char pad[0x494]; u32 start; u16 entries[128]; char gap[0x114]; u32 count; };
extern char data_ov002_022cf16c[];
extern struct State data_ov002_022ce288;
extern int func_ov002_021b9ecc(int, int);
extern int func_ov002_021bc288(int, int);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021bd710(int, int);
extern int func_ov002_021bd85c(int a, int b);
extern int func_ov002_021c1d28(int a, int b, int c);
extern int func_ov002_0223b5cc(int arg0, int arg1);
extern int func_ov002_0223b6ec(int arg0, int arg1, int arg2);
int func_ov002_0223b864(int a, int b, int c)
{
    int key;
    int pos = b + c;
    int id;
    int i;
    u32 start;
    u32 count;
    Card *p;
    if (pos <= 4) {
        if (func_ov002_021b9ecc(a, pos) == 0) return 0;
        p = (Card *)(data_ov002_022cf16c + (a & 1) * 0x868 + 0x30);
        p = (Card *)((char *)p + pos * 0x14);
        key = p->value * 2 + p->bit;
        if (func_ov002_021bd710(a, pos) != 0) return 0;
        if (func_ov002_0223b6ec(a, pos, 0) == 0) return 0;
        if (func_ov002_021c1d28(a, pos, 0) != 0) return 0;
    } else if (b == 11) {
        p = (Card *)(data_ov002_022cf16c + (a & 1) * 0x868 + 0x120);
        p += c;
        id = p->id;
        key = p->value * 2 + p->bit;
        if (func_ov002_021bd85c(id, key) != 0) return 0;
        if (func_ov002_0223b5cc(id, 0) == 0) return 0;
    } else {
        return 0;
    }
    count = data_ov002_022ce288.count;
    i = 0;
    if (i < count) {
        start = data_ov002_022ce288.start;
        do {
        if (key == data_ov002_022ce288.entries[(start + i) & 0x7f]) return 0;
            i++;
        } while (i < count);
    }
    if (func_ov002_021bc6c4(a) < 0 && data_ov002_022ce288.count == 0) {
        if (pos > 4) return 0;
        if (func_ov002_021bc288(a, pos) == 0) return 0;
    }
    return 0x800;
}









