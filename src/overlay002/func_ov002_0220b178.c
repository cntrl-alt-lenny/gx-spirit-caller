extern int func_ov002_021bd364(int player, int code);
extern int data_ov002_022cf178[];

struct Self0 { unsigned short f0; unsigned short bit0 : 1; unsigned short _r : 15; };

int func_ov002_0220b178(struct Self0 *self) {
    if (func_ov002_021bd364(self->bit0, 0x16) != 0) {
        int val = *(int *)((char *)data_ov002_022cf178 + (self->bit0 & 1) * 0x868);
        return val == 0;
    }
    return 0;
}
