extern short data_020c95b4[];
extern int data_ov007_021b2ed4[];
extern int data_ov007_021b2edc[];
extern int data_ov007_021b2ee8[];
extern int data_ov007_021b2ef4[];
extern int data_ov007_0223342c;
extern void func_02004f3c(void *, int *, int, int, int, int);
extern int func_0202b0ac(int);
extern int func_0208dcb4(void);
extern void func_02094410(int, int, int);
extern void func_020a9698(int *, int *, int, int, int, int, int, int, int, int, int, int, int);
extern int func_ov007_021b2be8(int *, int);

typedef struct {
    char gap00[0x3c];
    int f3c;
    int f40;
    int f44;
    int f48;
    int f4c;
} Ctx_021b289c;

int func_ov007_021b289c(Ctx_021b289c *self) {
    int spr;
    int row_off;
    int row_val;
    int handle;
    int buf[0x40];

    spr = func_0208dcb4();
    row_off = self->f4c * 0x18;
    row_val = func_0202b0ac(*(short *)((char *)data_020c95b4 + row_off));
    handle = func_ov007_021b2be8(&data_ov007_0223342c, self->f3c);
    func_02094410(0, spr, 0x6000);
    func_020a9698(buf, data_ov007_021b2ef4, self->f3c, handle,
                  self->f40, data_ov007_021b2edc[self->f40],
                  self->f44, data_ov007_021b2ee8[self->f44],
                  self->f48, data_ov007_021b2ed4[self->f48],
                  self->f4c, *(short *)((char *)data_020c95b4 + row_off), row_val);
    func_02004f3c(self, buf, spr, 0, 0, 0xc);
    return 1;
}
