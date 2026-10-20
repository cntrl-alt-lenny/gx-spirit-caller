typedef unsigned int u32;
typedef unsigned short u16;
struct Arg {
    u16 f0;
    u16 side : 1;
    u16 slot : 5;
    u16 rest : 10;
    u16 low : 6;
    u16 value : 9;
    u16 high : 1;
};
struct Entry {
    u32 a : 13;
    u32 flag : 1;
    u32 b : 8;
    u32 value : 8;
    u32 c : 2;
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021de9d4(int a, int b, int c);
int func_ov002_02238cb4(struct Arg *p) {
    int side = p->side;
    int slot = p->slot;
    struct Entry *entry = (struct Entry *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x30 + slot * 20);
    if (p->value != (entry->value * 2 + entry->flag)) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (side & 1) * 0x868 + slot * 20) == 0) return 0;
    func_ov002_021de9d4((int)p, side, slot);
    return 0;
}
