typedef struct { unsigned short id; unsigned short side:1; unsigned short rest:15; } Self;
typedef struct { unsigned int id:13; unsigned int rest:19; } Card;
typedef struct { char pad[0x418]; Card cards[1]; } Player;
typedef struct { char pad[0x5a8]; int state; } State;
extern State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_02257704(void *self);
extern int func_ov002_021de8fc(int a, int b, int c);
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_0202e234(int x);
extern unsigned int func_0202b878(int id);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
int func_ov002_02232f48(Self *self) {
    int i, id;
    int state = data_ov002_022ce288.state;
    switch (state) {
    case 0x80:
        func_ov002_021e2b3c(state);
        func_ov002_021de8fc((int)self, func_ov002_02257704(self), 0);
        return 0x7f;
    case 0x7f:
        if (func_ov002_021ca698(self->side, 1 - self->side)) {
            for (i = *(int *)(data_ov002_022cf180 + ((1 - self->side) & 1) * 0x868) - 1; i >= 0; i--) {
                id = ((Player *)(data_ov002_022cf16c + ((1 - self->side) & 1) * 0x868))->cards[i].id;
                if (func_0202e234(id) && func_0202b878(id) == 7) {
                    func_ov002_021d8128(1 - self->side, &((Player *)(data_ov002_022cf16c + ((1 - self->side) & 1) * 0x868))->cards[i], 1);
                    return 0x7f;
                }
            }
        }
        return 0x7e;
    case 0x7e:
        func_ov002_021e2c5c(state);
        break;
    }
    return 0;
}

