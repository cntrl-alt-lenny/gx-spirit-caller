struct Input { unsigned short code; unsigned short side:1; unsigned short rest:15; };
struct State { char pad[0x5a8]; int state; int count; int flag; };
struct Card { unsigned int pad:13; unsigned int side:1; unsigned int rest:18; };
extern struct State data_ov002_022ce288;
extern unsigned char data_ov002_022cf178[];
extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021d71e0(int, int, int);
extern int func_ov002_021e286c(int);
/* This caller supplies only r0 and r1 to the four-argument thunk. */
extern int func_ov002_021e104c();
int func_ov002_022260cc(struct Input *self) {
    int side;
    switch (self->code) {
    case 0x15aa: case 0x17f3: side = 1 - self->side; break;
    case 0x16d9: side = self->side; break;
    }
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.count = 0;
        data_ov002_022ce288.flag = 0;
    case 0x7f:
        if (*(int *)(data_ov002_022cf178 + (side & 1) * 0x868)) {
            if (side != ((struct Card *)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x120))->side) {
                data_ov002_022ce288.flag = 1;
                if (self->code != 0x17f3) data_ov002_022ce288.count++;
            } else { data_ov002_022ce288.count++; }
            func_ov002_021d71e0(side, 0, 1);
            return 0x7f;
        }
        return 0x7e;
    case 0x7e:
        func_ov002_021e286c(side);
        if (data_ov002_022ce288.flag) func_ov002_021e286c(1 - side);
        return 0x7d;
    case 0x7d:
        func_ov002_021e104c(side, data_ov002_022ce288.count);
        return 0x7c;
    }
    return 0;
}

