typedef unsigned short u16;
typedef unsigned int u32;

struct St {
    u16 f0;
    u16 player : 1;
    u16 idx : 5;
    u16 _p : 10;
};

struct Row {
    u32 a : 13;
    u32 side : 1;
    u32 _b : 18;
};

extern char data_ov002_022cf16c[];
extern void func_ov002_0220e77c(void);
extern int func_ov002_021c8470(int player, int i);
extern void func_ov002_021d90c0(int a, int b, int c);

int func_ov002_0221e494(struct St *st)
{
    int i;
    int off;
    int total;
    total = 0;
    func_ov002_0220e77c();
    i = total;
    off = i;
    do {
        char *base = data_ov002_022cf16c + (st->player & 1) * 0x868;
        struct Row *r = (struct Row *)(base + 0x30 + off);
        if (r->a != 0 && *(u16 *)(base + off + 0x38) != 0 && st->player != r->side) {
            total += func_ov002_021c8470(st->player, i);
        }
        i++;
        off += 0x14;
    } while (i <= 4);
    if (total > 0xffff) {
        total = 0xffff;
    }
    func_ov002_021d90c0(st->player, st->idx, total);
    return 0;
}
