struct F021fae7c_F2 {
    unsigned short bit0   : 1;
    unsigned short multi5 : 5;
    unsigned short kind   : 6;
    unsigned short rest   : 4;
};
struct F021fae7c_Self {
    unsigned short f0;
    struct F021fae7c_F2 f2;
};
struct F021fae7c_State {
    char pad[0x5b4];
    int step;
};

extern struct F021fae7c_State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];

extern void func_ov002_021d7c1c(unsigned int a, void *b, void *c);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);

int func_ov002_021fae7c(struct F021fae7c_Self *self) {
    unsigned int idx;
    unsigned int off;
    if (self->f2.kind == 0x23) {
        return 1;
    }
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_021e2b3c();
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        idx = self->f2.bit0;
        off = (idx & 1) * 0x868;
        if (*(int *)(data_ov002_022cf178 + off) != 0) {
            func_ov002_021d7c1c(idx, data_ov002_022cf16c + off + 0x120, 0);
            return 0;
        }
        func_ov002_021e2c5c();
        data_ov002_022ce288.step++;
        return 0;
    }
    return 1;
}
