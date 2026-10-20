typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 id; u16 side:1; u16 rest:15; char pad[8]; u16 result; };
struct node;
struct State { char pad[0x5b8]; int state; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern int func_ov002_022577dc(void *self);
extern int func_ov002_0228df3c(struct Self *self, int arg1, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern int func_ov002_0223f5b4(struct Self *self, int arg1);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021b9ecc(int side, int slot);
int func_ov002_02240870(struct Self *self, int arg1) {
    int side, slot;
    int pair;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022577dc(self) > 1) {
            if (data_ov002_022cd744[self->side] == 1) {
                func_ov002_0228df3c(self, arg1, 0);
                data_ov002_022ce288.state = 2;
            } else {
                func_ov002_021ae400(self->side, 0x10f);
                func_ov002_0225935c(self->side, self->id, (int)func_ov002_022575c8);
                data_ov002_022ce288.state++;
            }
        } else {
            for (side = 0; side < 2; side++) {
                for (slot = 0; slot <= 4; slot++) {
                    if (func_ov002_022575c8((int)self, side, slot) != 0) {
                        func_ov002_0223dcc0(self, side, slot);
                        data_ov002_022ce288.state = 2;
                        return 0;
                    }
                }
            }
        }
        return 0;
    case 1:
        if (func_ov002_0223f5b4(self, arg1) != 0) data_ov002_022ce288.state++;
        return 0;
    case 2:
        pair = func_ov002_0223de94((struct node *)self, 0);
        self->result = func_ov002_021b9ecc((u8)pair, (u8)((u16)pair >> 8));
        return 1;
    }
    return 0;
}

