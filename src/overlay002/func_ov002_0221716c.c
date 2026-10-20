typedef struct { unsigned short id; unsigned short bit : 1; } Self;
struct Global { char pad[0x5a8]; int state; };
extern struct Global data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern void func_ov002_021d6714(int arg0, int arg1, int arg2);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e2b1c(int arg0);
extern int func_ov002_02213654(void);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern void func_ov002_022592ec(int arg0);
int func_ov002_0221716c(Self *self) {
    int special = 0;
    int j, i, player;
    if (self->id == 0x184d) special = 1;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (special) func_ov002_021e27c0(1 - self->bit, 1);
        for (i = 0; i < 2; i++) {
            player = i ^ self->bit;
            for (j = 0; j <= 10; j++) {
                if (func_ov002_0225764c((int)self, player, j))
                    func_ov002_021d6714(player, j, 1);
            }
        }
        if (data_ov002_022cd744[self->bit] == 1)
            func_ov002_021e2b1c(30);
        else
            func_ov002_022592ec((int)func_ov002_02213654);
        return 0x7f;
    case 0x7f:
        for (i = 0; i < 2; i++) {
            player = i ^ self->bit;
            for (j = 0; j <= 10; j++) {
                if (func_ov002_0225764c((int)self, player, j))
                    func_ov002_021d6714(player, j, 0);
            }
        }
        if (special) func_ov002_021e27c0(1 - self->bit, 0);
        return 0;
    }
    return 0;
}

