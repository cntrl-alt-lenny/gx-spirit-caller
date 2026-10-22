typedef unsigned short u16;
struct Self { u16 f0; u16 side : 1; u16 slot : 5; u16 rest : 10; };
struct Side { int value; char pad[0x864]; };
extern struct Side data_ov002_022cf16c[];
extern struct Side data_ov002_022cf178[];

extern int func_ov002_02257ab8(int a, int b);
extern int func_ov002_02259f74(int x);
extern int func_ov002_021be4a0(int side, int slot, int mode);
extern int func_ov002_02280980(int arg0);
int func_ov002_02295efc(struct Self *self) {
    int side = self->side;
    int index = (1 - side) & 1;
    if (func_ov002_02257ab8((int)self, 1 - side) + data_ov002_022cf178[index].value == 0) return 0;
    if (data_ov002_022cf16c[index].value <= 0xb54) {
        if (func_ov002_02259f74(side) != 0) return 1;
    }
    if (func_ov002_021be4a0(self->side, self->slot, 1) == 0) return 1;
    return func_ov002_02280980(self->side) <= 0;
}










