typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 5;
    unsigned short kind : 6;
    unsigned short pad12 : 2;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_ov002_021c2f24(int player, int code);
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern char data_ov002_022cf17c[];
int func_ov002_0220ca40(S021ff3bc *self, int arg1) {
    if (self->kind != 0x23) {
        if (func_ov002_021ca698(self->bit0, self->bit0) == 0) return 0;
        if (func_ov002_021c2f24(self->bit0, 0x1a0f) == 0) return 0;
        if (func_ov002_021c2f24(self->bit0, 0x1a10) == 0) return 0;
        if (func_ov002_021c2f24(self->bit0, 0x1a11) == 0) return 0;
        if (func_ov002_021c2f24(self->bit0, 0x1a12) == 0) return 0;
    }
    if (*(int *)(data_ov002_022cf17c + (self->bit0 & 1) * 0x868) == 0) return 0;
    return func_ov002_021ff3bc(self, arg1);
}
