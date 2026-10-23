typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u16 id; u16 bit0:1; u16 padbits:13; u16 bit14:1; u16 bit15:1; u16 pad[2]; u16 value; } Obj;
struct Global { char pad[0x5a8]; int state; };
struct Card { u32 id:13; u32 bit13:1; u32 pad:8; u32 slot:8; u32 rest:2; };
struct State { char pad[12]; u32 count; char pad2[272]; struct Card cards[1]; };
struct Settings { char pad[22]; u16 bits0:3; u16 bit3:1; u16 mode:2; u16 rest:10; };
struct Big { char pad[0xd50]; int active; char pad2[16]; int kind; };
extern struct Global data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern struct Settings data_ov002_022cd300;
extern int data_ov002_022cd744[];
extern struct Big data_ov002_022d016c;
extern void func_ov002_021ae400(int a,int b);
extern int func_ov002_021e27c0(int self_thing,int arg1);
extern void func_ov002_022592b8(int arg);
extern void func_ov002_0226b094(int arg0,int arg1);
extern int func_ov002_0226eb5c(int,int,int,int);
extern int func_ov002_02271a78(int arg0,int arg1,int arg2);
extern void func_ov002_02290c9c(int arg);
int func_ov002_02238864(Obj *p) {

    struct State *state;
    struct Card *card;
    int offset;
    int side = p->bit0 ^ p->bit14;
    switch(data_ov002_022ce288.state) {
    case 0x80: {
        u32 i;



        if (p->value == 0) return 0;
        offset = side & 1;
        i = 0;
        if (i < *(u32 *)(data_ov002_022cf178+offset * 0x868)) {


            do {
                if (func_ov002_0226eb5c(side, ((struct State *)(data_ov002_022cf16c+(side & 1) * 0x868))->cards[i].bit13 + (((struct State *)(data_ov002_022cf16c+(side & 1) * 0x868))->cards[i].slot << 1), 1, p->value)) {
                    func_ov002_021ae400(side,0x27);
                    return 0x7f;
                }
                i++;

            } while (i < ((struct State *)(data_ov002_022cf16c+(side & 1) * 0x868))->count);
        }
        func_ov002_021e27c0(side,1);
        return 0x78;
    }
    case 0x7f:
        data_ov002_022cd300.mode = p->value;
        if (data_ov002_022cd744[side] == 1) func_ov002_02290c9c(side);
        else func_ov002_022592b8(6);
        return 0x7e;
    case 0x7e:
        if (data_ov002_022d016c.active == 0) return 0x80;
        if (data_ov002_022d016c.kind != 4 && data_ov002_022d016c.kind != 6) return 0x7f;
        func_ov002_02271a78(data_ov002_022d016c.kind == 4 ? 1 : 0,0,p->value+1);
        return 0x7d;
    case 0x7d:
        return data_ov002_022cd300.bit3 ? 0x7f : 0;
    case 0x78:
        func_ov002_0226b094(1-side,p->id);
        return 0x77;
    case 0x77:
        func_ov002_021e27c0(side,0);
        return 0;
    }
    return 0;
}










