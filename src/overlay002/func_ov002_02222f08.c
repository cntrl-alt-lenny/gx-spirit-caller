typedef unsigned short u16;
struct Self { u16 id; u16 side:1; u16 rest:15; };
struct State { char pad[0x5a8]; int state; };
struct Info { char pad[0xb0]; u16 value; };
struct Card { unsigned int id:13; unsigned int rest:19; };
struct Player { char pad[0xc]; unsigned int count; char gap[0x110]; struct Card cards[1]; char tail[0x744]; };
extern struct State data_ov002_022ce288;
extern struct Info data_ov002_022d0e6c;
extern struct Player data_ov002_022cf16c[];
struct Count { unsigned int count; char pad[0x864]; };
extern struct Count data_ov002_022cf178[];
/* Original passes a card ID although the current C callee declares void. */
extern int func_0202e328(unsigned int card);
extern void func_ov002_021ae400(int a, int b);
/* This call uses a numeric side selector in r0. */
extern void func_ov002_021d7970(int arg0, int arg1, int arg2);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern void func_ov002_0226af94(int arg0, int arg1, int arg2);
int func_ov002_02222f08(struct Self *self) {
    unsigned int i;
    unsigned int count;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        count = data_ov002_022cf178[(1-self->side)&1].count;
        if (count == 0) return 0;
        for (i=0; i < count; i++) {
            if (func_0202e328(data_ov002_022cf16c[(1-self->side)&1].cards[i].id) != 0) {
                func_ov002_0226af94(self->side,self->id,1);
                return 0x7f;
            }
            count = data_ov002_022cf16c[(1-self->side)&1].count;
        }
        return 0x64;
    case 0x7f:
        func_ov002_021d7970(1-self->side,data_ov002_022d0e6c.value,1);
        return 0;
    case 0x64:
        func_ov002_021e27c0(1-self->side,1);
        return 0x63;
    case 0x63:
        func_ov002_021ae400(self->side,0x11);
        return 0x62;
    case 0x62:
        func_ov002_021e27c0(1-self->side,0);
        return 0;
    }
    return 0;
}



