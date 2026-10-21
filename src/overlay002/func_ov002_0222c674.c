typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct Card { unsigned int id:13; unsigned int flag:1; unsigned int rest:18; };
struct State { char pad[0x5a8]; int state; };
struct Row { char pad[0x260]; struct Card card; char tail[0x604]; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf17c[];
extern struct Row data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_020305d8(int arg);
extern void func_ov002_021ae400(int a,int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c988c(int player,int kind,int extra);
/* Original caller supplies only r0; remaining parameters are unused here. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca440(int arg0,int arg1);
extern void func_ov002_021d87dc(int arg0);
extern int func_ov002_021df708(int arg0,int arg1);
/* Original caller supplies r0-r2; the thunk replaces r3. */
extern int func_ov002_021e13f4();
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_0222c674(struct Self *self) {
    int state = data_ov002_022ce288.state;
    switch (state) {
    case 0x80:
        if (*(int *)(data_ov002_022cf17c + (self->side & 1) * 0x868) == 0) return 0;
        return func_ov002_0225368c(self->side, self->id, 0) ? 0x7e : 0x64;
    case 0x7e:
        func_ov002_021e2b3c(state);
        return 0x7d;
    case 0x7d: {
        struct Row *row;
        unsigned int flag;
        int side = self->side;
        unsigned int id;
        int off = (side & 1) * 0x868;
        if (*(int *)(data_ov002_022cf17c + off) != 0) {
            row = &data_ov002_022cf16c[side & 1];
            id = row->card.id;
            flag = row->card.flag;
            func_ov002_021df708(side, id);
            if (func_ov002_021c988c(side, 0xd, 0) == 0) func_ov002_021e2818(side);
            func_ov002_021d87dc(side);
            if (func_0202e234(id) != 0 && func_020305d8(id) != 0) {
                if (func_ov002_021bc618(self->side) != 0 && func_ov002_021ca2b8(self->side) != 0 && func_ov002_021ca440(self->side,id) != 0) {
                    func_ov002_0227adb8(flag, (int)&row->card, 1, 0);
                } else {
                    func_ov002_021e13f4(side,1,0);
                }
            } else {
                func_ov002_021e13f4(side,1,0);
                return 0x7d;
            }
        }
        return 0x7c;
    }
    case 0x7c: func_ov002_021e2c5c(state); return 0;
    case 0x64: func_ov002_021ae400(self->side,0xd); return 0x63;
    case 0x63: func_ov002_0226b054(1-self->side); return 0x62;
    case 0x62: func_ov002_021e286c(self->side); return 0;
    default: return 0;
    }
}




