typedef unsigned int u32;
struct Arg { unsigned short value; unsigned short side:1; unsigned short pad:13; unsigned short flip:1; unsigned short last:1; };
struct State { char pad[0xd4]; u32 mask; int flags; char pad2[0xc10]; int side; };
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
extern struct State data_ov002_022d016c;
extern char data_ov002_022cf16c[];
extern unsigned int func_ov002_021dbf14(int a, unsigned int mask, int b, int c);
/* The assembly consumes r0, although the existing C definition says void. */
extern int func_ov002_021b30ac(int a, int b, int c);
extern int func_ov002_021b3ecc(int a, int b, int c);
extern void func_ov002_021dbf98(int a, int b, int c, int d, int e);
extern void func_ov002_021dd950(int a, int b, int c, int d, int e);
extern int func_0202e2c8(int unused0);
extern void func_ov002_021fe3d4(void);
/* These callees have unused formal arguments; the original supplies none. */
extern int func_ov002_021ca51c();
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
u32 func_ov002_021de134(struct Arg *arg, u32 mask, int kind, int flags)
{
    int i, side, j;
    u32 selected, excluded;
    int bit;
    u32 saved;
    int base;
    int position;
    struct Slot *slot;
    int player, index;
    saved = data_ov002_022d016c.mask;
    selected = func_ov002_021dbf14((int)arg, mask, kind, (flags & 2) != 0);
    excluded = 0;

    if (flags & 2) {
        for (i = 0; i < 2; i++) {
            side = data_ov002_022d016c.side ^ i;
            base = side << 4;
            for (j = 0, bit = base; j <= 4; bit++, j++) {
                if (selected & (1 << bit)) {
                    if (func_ov002_021b30ac(side, j, 0x1825) != 0)
                        excluded |= 1 << bit;
                }
            }
            if (arg->value != 0) {
                for (bit = 5, j = base + 5; bit <= 10; j++, bit++) {
                    if (selected & (1 << j)) {
                        if (func_ov002_021b3ecc(side, bit, 0x1513) != 0)
                            excluded |= 1 << j;
                    }
                }
            }
        }
    }
    for (i = 0; i < 2; i++) {
        j = data_ov002_022d016c.side ^ i;
        for (bit = 0, side = j << 4; bit <= 10; side++, bit++) {
            if (selected & (1 << side))
                func_ov002_021dbf98(j, bit, flags, arg->value, j != arg->side);
        }
    }
    if (data_ov002_022d016c.mask != 0) {
        func_ov002_021fe3d4();
        data_ov002_022d016c.flags = func_ov002_021ca51c();
        func_ov002_021e2b3c();
        data_ov002_022d016c.mask = saved | (selected ^ excluded);
        for (i = 0; i < 2; i++) {
            char *row;
            player = data_ov002_022d016c.side ^ i;
            row = data_ov002_022cf16c + (player & 1) * 0x868;
            position = player << 4;
            slot = (struct Slot *)(row + 0x30);
            for (index = 0; index <= 10; position++, slot++, index++) {
                if (selected & (1 << position)) {
                    int code;
                    if (func_0202e2c8(slot->id) != 0 && (kind == 11 || kind == 13))
                        code = 12;
                    else
                        code = kind;
                    data_ov002_022d016c.mask &= ~(1 << position);
                    func_ov002_021dd950(player, index, code, flags + (player != (arg->side ^ arg->flip)) + 0x10000, arg->value);
                }
            }
        }
        func_ov002_021e2c5c();
    }
    return data_ov002_022d016c.mask ^ saved;
}






