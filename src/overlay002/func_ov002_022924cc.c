extern char data_ov002_022cf16c[];

struct Ov002Arg { unsigned short _pad0; unsigned short bit0 : 1; };
struct Ov002Slot0 { unsigned int id : 13; char _pad[16]; }; /* 0x14 */

extern int func_ov002_0228d95c(int a0, int a1);
extern int func_ov002_021bbf50(int a0);
extern int func_ov002_02280980(int a0);

int func_ov002_022924cc(struct Ov002Arg *self) {
    int i;
    for (i = 0; i < 5; i++) {
        struct Ov002Slot0 *p =
            (struct Ov002Slot0 *)(data_ov002_022cf16c +
                                  (self->bit0 & 1) * 0x868 + 0x30);
        if (p[i].id) {
            if (func_ov002_0228d95c(self->bit0, i) != 0)
                return 1;
        }
    }
    if (func_ov002_021bbf50(1 - self->bit0) == 1) {
        if (func_ov002_02280980(self->bit0) < 0)
            return 1;
    }
    return 0;
}
