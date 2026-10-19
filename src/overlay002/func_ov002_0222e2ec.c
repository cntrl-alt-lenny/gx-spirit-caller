struct Ov002Self { unsigned short f0; unsigned short b0:1; unsigned short rest:15; };
struct State { char pad[0x5a8]; int state; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
extern int func_ov002_021d63fc(struct Ov002Self *self, int arg1, int arg2, int arg3);
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
int func_ov002_0222e2ec(struct Ov002Self *self) {
    int i;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021e2b3c();
        return 0x7f;
    case 0x7f:
        for (i = 0; i <= 4; i++) {
            if (func_ov002_0225764c((int)self, self->b0, i)) {
                char *p = data_ov002_022cf16c + (self->b0 & 1) * 0x868 + i * 0x14;
                if (*(unsigned short *)(p + 0x38) == 0) {
                    if (*(unsigned short *)(p + 0x36) == 0)
                        func_ov002_021d6808(self, self->b0, i, 1, 1);
                    else
                        func_ov002_021d63fc(self, self->b0, i, 1);
                } else if (*(unsigned short *)(p + 0x36) == 0) {
                    func_ov002_021d6808(self, self->b0, i, 0, 1);
                }
            }
        }
        return 0x7e;
    case 0x7e:
        func_ov002_021e2c5c();
        return 0;
    default:
        return 0;
    }
}

