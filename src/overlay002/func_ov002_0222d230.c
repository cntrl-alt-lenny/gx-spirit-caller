struct Self0222d230 {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short _pad : 15;
};

struct Slot {
    unsigned int w[0x868 / 4];
};

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern struct Slot data_ov002_022cf16c[];
extern struct Slot data_ov002_022cf178[];
extern void func_ov002_0226af78(int a, int b);
extern void func_ov002_021d71e0(int a, int b, int c);
extern int func_ov002_021e286c(int a);

int func_ov002_0222d230(struct Self0222d230 *self) {
    int v = *(int *)(data_ov002_022ce288 + 0x5a8);

    if (v == 0x7f) {
        goto handle_7f;
    }
    if (v == 0x80) {
        int q = 1 - self->b0;
        int p = q & 1;
        if (*(unsigned int *)((char *)data_ov002_022cf178 + p * 0x868) == 0) {
            return 0;
        }
        func_ov002_0226af78(q, 0);
        return 0x7f;
    }
    goto out;
handle_7f:
    {
        int q = 1 - self->b0;
        int p = q & 1;
        unsigned short idx = *(unsigned short *)(data_ov002_022d0e6c + 0xb0);
        unsigned int w = *(unsigned int *)((char *)data_ov002_022cf16c + p * 0x868 + idx * 4 + 0x120);
        int bit = (w << 18) >> 31;
        func_ov002_021d71e0(q, idx, 1);
        func_ov002_021e286c(bit);
        return 0;
    }
out:
    return 0;
}
