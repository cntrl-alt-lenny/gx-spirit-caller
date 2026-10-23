typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct State { char pad[0x5a8]; int state; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern int func_ov002_021ded1c(int a, int b);
extern int func_ov002_02257704(void *self);
int func_ov002_0223252c(struct Self *self) {
    int side;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        func_ov002_021ded1c((int)self, func_ov002_02257704(self));
        return 0x7f;
    case 0x7f:
        side = self->side;
        if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868)) {
            func_ov002_021d7c1c((void *)side, data_ov002_022cf16c + (side & 1) * 0x868 + 0x120, (void *)0);
            return 0x7f;
        }
        side = 1 - side;
        if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868)) {
            func_ov002_021d7c1c((void *)side, data_ov002_022cf16c + (side & 1) * 0x868 + 0x120, (void *)1);
            return 0x7f;
        }
        return 0;
    }
    return 0;
}
