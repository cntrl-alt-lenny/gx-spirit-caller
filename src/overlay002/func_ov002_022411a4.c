typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 rest:15; };
struct node;
struct Target;
struct State { char pad[0x5b8]; int state; };
struct Card { unsigned id:13; unsigned rest:19; char pad[16]; };
struct Table { char pad[0x30]; struct Card cards[100]; char rest[104]; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct Table data_ov002_022cf16c[];
extern int data_ov002_022d016c[];
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_0223dcc0(struct Target *self, int side, int slot);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_022410f0(void *self, int a1, int a2);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern int func_ov002_022577dc(void *self);
/* Original caller supplies only r0 and r1 to the forwarding thunk. */
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0229ce5c(char *out, int fmt, int arg);
int func_ov002_022411a4(struct Self *self) {
    char buf[0x100];
    int side, slot, i;
    int packed; int low, high; u16 v16;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (!func_ov002_022577dc(self)) return 1;
        func_ov002_021ae400(self->player, 0x8b);
        func_ov002_0225935c(self->player, self->id, (int)func_ov002_022575c8);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if (!func_ov002_02257878(self, func_ov002_022410f0)) return 1;
        if (data_ov002_022cd744[self->player] == 1) {
            side = (unsigned char)func_ov002_0223de94((struct node *)self, 0) ^ 1;
            for (i = 0; i < 2; i++, side ^= 1) {
                for (slot = 0; slot <= 4; slot++) {
                    if (func_ov002_022410f0(self, side, slot)) {
                        func_ov002_0223dcc0((struct Target *)self, side, slot);
                        return 1;
                    }
                }
            }
            return 1;
        } else {
            packed = func_ov002_0223de94((struct node *)self, 0);
            low = (unsigned char)packed;
            v16 = (u16)packed;
            high = (v16 >> 8) & 0xff;
            func_ov002_0229ce5c(buf, 0x8c, func_0202b100(data_ov002_022cf16c[low & 1].cards[high].id));
            func_ov002_021ae400(self->player, (int)buf);
            func_ov002_0225935c(self->player, self->id, (int)func_ov002_022410f0);
            data_ov002_022ce288.state++;
            return 0;
        }
    case 1:
    case 3:
        if (func_ov002_022593f4()) {
            func_ov002_0223dcc0((struct Target *)self, data_ov002_022d016c[0x35c], data_ov002_022d016c[0x35d] + data_ov002_022d016c[0x35e]);
            data_ov002_022ce288.state++;
            return 0;
        } else {
            data_ov002_022ce288.state--;
            return 0;
        }
        return 0;
    default: return 1;
    }
}





