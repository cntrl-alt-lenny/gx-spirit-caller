extern short data_020c9694[];
extern int data_ov007_021b2fd4[];
extern int data_ov007_021b2fdc[];
extern int data_ov007_021b2fe8[];
extern int data_ov007_021b2ff4[];
extern int data_ov007_0223352c;
extern void func_02004f58(void *, int *, int, int, int, int);
extern int func_0202b100(int);
extern int func_0208dd9c(void);
extern void func_02094504(int, int, int);
extern void func_020a978c(int *, int *, int, int, int, int, int, int, int, int, int, int, int);
extern int func_ov007_021b2ce8(int *, int);

typedef struct {
    char gap00[0x3c];
    int f3c;
    int f40;
    int f44;
    int f48;
    int f4c;
} Ctx_021b299c;

int func_ov007_021b299c(Ctx_021b299c *self) {
    int spr;
    int row_off;
    int row_val;
    int handle;
    int buf[0x40];

    spr = func_0208dd9c();
    row_off = self->f4c * 0x18;
    row_val = func_0202b100(*(short *)((char *)data_020c9694 + row_off));
    handle = func_ov007_021b2ce8(&data_ov007_0223352c, self->f3c);
    func_02094504(0, spr, 0x6000);
    func_020a978c(buf, data_ov007_021b2ff4, self->f3c, handle,
                  self->f40, data_ov007_021b2fdc[self->f40],
                  self->f44, data_ov007_021b2fe8[self->f44],
                  self->f48, data_ov007_021b2fd4[self->f48],
                  self->f4c, *(short *)((char *)data_020c9694 + row_off), row_val);
    func_02004f58(self, buf, spr, 0, 0, 0xc);
    return 1;
}
