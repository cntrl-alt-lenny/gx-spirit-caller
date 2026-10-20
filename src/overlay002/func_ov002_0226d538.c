struct State { char pad[0xd44]; int value; char pad2[0x54]; int phase; };
struct Output { char pad[0xb0]; unsigned short value; };
extern struct State data_ov002_022d016c;
extern struct Output data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern int data_ov002_022cd524;
extern void func_ov002_021ae6d0(int arg0, int arg1, int arg2, int arg3);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_0227b0b8(int player, int count, int mode);

int func_ov002_0226d538(int player, int id, int amount) {
    int value;
    int limit;
    int raw;
    switch (data_ov002_022d016c.phase) {
    case 0:
        data_ov002_022d016c.phase++;
        return 0;
    case 1:
        switch (id) {
        case 0x14be:
            if (data_ov002_022cd744[player] == 1)
                data_ov002_022d016c.value = amount;
            else
                func_ov002_021ae6d0(0x12d, 0x12f, 1, amount);
            break;
        case 0x159a:
            if (data_ov002_022cd744[player] == 1)
                data_ov002_022d016c.value = func_ov002_021b00d0(4) + 4;
            else
                func_ov002_021ae6d0(0x118, 0x130, 1, 12);
            break;
        case 0x1766:
            raw = *(int *)(data_ov002_022cf16c + (player & 1) * 0x868) - 1;
            if (raw > 0xffff) raw = 0xffff;
            value = raw / 1000;
            if (data_ov002_022cd744[player] == 1) {
                data_ov002_022cd524 = player;
                limit = (func_ov002_0227b0b8(1-player, -1, 0) + 999) / 1000;
                if (limit <= 3) limit = 3;
                if (value >= limit) value = limit;
                data_ov002_022d016c.value = value;
            } else {
                func_ov002_021ae6d0(0x12d, 0x12e, 1, value);
            }
            break;
        }
        data_ov002_022d016c.phase++;
        return 0;
    default:
        data_ov002_022d0e6c.value = data_ov002_022d016c.value;
        return 1;
    }
}

