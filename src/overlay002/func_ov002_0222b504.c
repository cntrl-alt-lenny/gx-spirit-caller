typedef unsigned int u32;
struct Self { unsigned short a; unsigned short player:1; unsigned short flags:15; };
struct Card { u32 id:13; u32 rest:19; };
struct Slot { struct Card card; char pad[16]; };
struct Player { char pad0[12]; int count; char pad1[32]; struct Slot slots[11]; char pad2[20]; struct Card deck[80]; char tail[0x608]; };
struct World { char pad[0xcec]; int side; };
extern char data_ov002_022cf16c[];
extern struct World data_ov002_022d016c;
extern int func_ov002_02257704(void *self);
/* Original calls omit the unused parameter. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_021de8fc(int a, int b, int c);
extern int func_0202df78(int a, int b);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern void func_ov002_021d7b44(int player, void *card, int flag);
extern void func_ov002_021e1920(int arg0,int arg1,int arg2,int arg3);
extern int func_0202e2f8(int unused0);
extern int func_0202e2c8(int unused0);
extern int func_ov002_021e2b1c(int arg0);
extern int func_ov002_021e286c(int arg0);
int func_ov002_0222b504(struct Self *self) {
    int i, side;
    int j;
    int flag = 0;
    int player = 1 - self->player;
    int mask = func_ov002_02257704(self);
    struct Player *p;
    func_ov002_021e2b3c();
    func_ov002_021de8fc((int)self, mask, 0);
    p = (struct Player *)(data_ov002_022cf16c + (player & 1) * 0x868);
    for (side = 0; side < 2; side++) {
        int s = data_ov002_022d016c.side ^ side;
        int bit = s * 16;
        struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (s & 1) * 0x868 + 0x30);
        for (i = 0; i <= 10; bit++, slot++, i++) {
            if (mask & (1 << bit)) {
                int id = slot->card.id;
                for (j = p->count - 1; j >= 0; j--) {
                    if (func_0202df78(p->deck[j].id, id)) {
                        void *card = func_ov002_021c93f0(player, 11, j);
                        func_ov002_021d7b44(player, card, player != self->player ? 1 : 0);
                    }
                }
                func_ov002_021e1920(player, id, 1, player != self->player ? 1 : 0);
                if (func_0202e2f8(id) == 0) {
                    if (func_0202e2c8(id) == 0) flag = 1;
                }
            }
        }
    }
    func_ov002_021e2c5c();
    if (flag) {
        func_ov002_021e2b1c(15);
        func_ov002_021e286c(player);
    }
    return 0;
}


