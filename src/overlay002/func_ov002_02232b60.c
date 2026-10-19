typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
} S021ff3bc;
typedef struct { unsigned short f_0; unsigned short f_2; } Self02210104;
typedef struct {
    unsigned short id;
    unsigned short side : 1;
    unsigned short pad : 11;
    unsigned short kind : 2;
    unsigned short rest : 2;
    unsigned int unknown[4];
    int card;
} Self;
extern unsigned int func_0202b878(int id);
extern int func_ov002_021c3b60(int player, int arg1);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern void func_ov002_021e276c(void *self, int a, int b, int c);
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_02210104(Self02210104 *self, int arg);
extern int func_ov002_0220e74c(void *x, int arg);
extern int func_ov002_02214720(void *x, int arg);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
extern char data_ov002_022cf16c[];
int func_ov002_02232b60(Self *self, int arg) {
    int index;
    if (self->kind == 2) {
        index = func_ov002_021c3b60(self->side, self->id);
        if (index < 0) return 0;
        if (func_ov002_021ff3bc((S021ff3bc *)self, arg) == 0) return 0;
        if (func_ov002_021ca3f0(self->side, self->id) == 0) return 0;
        func_ov002_0227adb8(self->side, (int)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120 + index * 4), 1, self->id << 16);
        func_ov002_021e276c((void *)self->side, self->id, 1, (unsigned short)self->card);
        return 0;
    }
    if (func_0202b878(self->card) == 0x16) return func_ov002_02210104((Self02210104 *)self, arg);
    if (func_0202b878(self->card) == 0x17) return func_ov002_0220e74c(self, arg);
    return func_ov002_02214720(self, arg);
}

