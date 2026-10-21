typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 bit:1; u32 pad:8; u32 value:8; u32 top:2; } Card;
struct Player { char pad[0x14]; u32 count; char rest[0x850]; };
struct State { char pad[0x494]; u32 start; u16 entries[128]; char gap[0x104]; int key; int unk; u32 max; int unk2; u32 count; int flag; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_0202de9c(int unused0);
extern int func_02030b84(int a0);
extern int func_02031684(int x);
extern int func_ov002_021bd85c(int a, int b);
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_ov002_0223b468(int key);
extern void func_ov002_0223b584(void);
extern int func_ov002_0223b5cc(int arg0, int arg1);
extern int func_ov002_0223b6ec(int arg0, int arg1, int arg2);
extern int func_ov002_0223c72c(int, int, int);
int func_ov002_0223c918(int a, int b)
{
    int i;
    u32 base;
    Card *p;
    u32 offset;
    if (func_0202de9c(b) != 3) return 0;
    if (func_ov002_021bd85c(b, -1) != 0) return 0;
    if (func_02030b84(b) == 0) return 0;
    data_ov002_022ce288.key = b;
    data_ov002_022ce288.max = func_ov002_0223b468(b);
    data_ov002_022ce288.count = 0;
    data_ov002_022ce288.flag = func_02031684(b) == 0;
    func_ov002_0223b584();
    offset = (a & 1) * 0x868;
    base = (u32)data_ov002_022cf16c + offset;
    p = (Card *)(base + 0x30);
    for (i = 0; i <= 4; i++, p = (Card *)((char *)p + 0x14)) {
        if (func_ov002_0223c72c(a, i, 0)) {
            func_ov002_0223b6ec(a, i, 1);
            data_ov002_022ce288.entries[(data_ov002_022ce288.start + data_ov002_022ce288.count++) & 0x7f] = p->value * 2 + p->bit;
            if (data_ov002_022ce288.count >= data_ov002_022ce288.max) return 1;
        }
    }
    if (func_ov002_021ca698(a, a)) {
        Card *p2;
        struct Player *q;
        u32 j;
        j = 0;
        if (j < *(u32 *)(data_ov002_022cf180 + offset)) {
        q = (struct Player *)(data_ov002_022cf16c + offset);
        p2 = (Card *)(base + 0x418);
        do {
            if (func_ov002_0223c72c(a, 14, j)) {
                func_ov002_0223b5cc(p2->id, 1);
                data_ov002_022ce288.entries[(data_ov002_022ce288.start + data_ov002_022ce288.count++) & 0x7f] = p2->value * 2 + p2->bit;
                if (data_ov002_022ce288.count >= data_ov002_022ce288.max) return 1;
            }
            j++;
            p2++;
        } while (j < q->count);
        }
    }
    return 0;
}







