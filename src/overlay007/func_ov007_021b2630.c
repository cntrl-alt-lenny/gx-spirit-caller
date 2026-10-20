typedef struct {
    char gap00[0x3c];
    int f3c, f40, f44, f48, f4c;
} Ctx_021b299c;
extern short data_020c9694[];
extern char data_ov007_0223352c[];
extern int func_ov007_021b2b74(char *a0, int a1);
/* Original caller passes two arguments; current callee C defines void parameters. */
extern int func_ov007_021b2c44(char *a0, int a1);
extern int func_ov007_021b2920(int a0);
extern int func_ov007_021b299c(Ctx_021b299c *self);
extern int func_ov007_021b28c4(int unused, int enabled);
int func_ov007_021b2630(Ctx_021b299c *self) {
    self->f4c = 0;
    func_ov007_021b2b74(data_ov007_0223352c, *(short *)((char *)data_020c9694 + (short)self->f4c * (short)0x18));
    self->f44 = 1;
    func_ov007_021b2c44(data_ov007_0223352c, self->f44);
    func_ov007_021b2920((int)self);
    func_ov007_021b299c(self);
    func_ov007_021b28c4((int)self, 1);
    return 1;
}

