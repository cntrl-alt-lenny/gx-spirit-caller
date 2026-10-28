typedef unsigned short u16;
struct Self {
    u16 id;
    u16 side:1;
    u16 pad1:13;
    u16 flip:1;
    u16 pad2:1;
    u16 pad3:6;
    u16 index:9;
    u16 pad6[3];
    u16 result;
};
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern int func_ov002_0227ddf8(struct Self *self);
extern int func_ov002_021ae4bc(int self, int idx);
extern void func_ov002_021df780(int arg0, int arg1);
int func_ov002_021f5090(struct Self *self) {
    int player = self->side ^ self->flip;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (*(int *)(data_ov002_022cf16c + (player & 1) * 0x868) <= 2000) return 1;
        if (data_ov002_022cd744[player] == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_0227ddf8(self);
        } else {
            func_ov002_021ae4bc(250, self->index);
        }
        ++data_ov002_022ce288.state;
        return 0;
    case 1:
        if (*(int *)(data_ov002_022d016c + 0xd44) != 0) {
            func_ov002_021df780(player, 2000);
        }
        self->result = *(int *)(data_ov002_022d016c + 0xd44);
        return 1;
    }
    return 1;
}

