typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Card { u16 id; u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1; u16 unused4:5; u16 active:1; u16 unused5:10; u16 pad[9]; u16 effect; u16 owner:1; u16 unused6:15; } Card;
struct Entry { u32 id:13; u32 rest:19; };
struct State { char pad[0x5a8]; int state; };
struct Info { char pad[0xb0]; u16 slot; };
extern struct State data_ov002_022ce288;
extern struct Info data_ov002_022d0e6c;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_0202b950(int unused0);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021c3bdc(int idx);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021df818(Card *card, int side, int amount);
extern void func_ov002_021e2550(void *self, int a, int b, int c);
extern int func_ov002_021e27c0(int self_thing, int arg1);
/* Original supplies no argument to the unused-argument counter helpers. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern void func_ov002_0226af94(int arg0, int arg1, int arg2);
int func_ov002_02238d4c(Card *p) {
    int i, slot, value;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + ((1-p->side)&1)*0x868) == 0) return 0;
        if (func_ov002_021c3bdc(1-p->side) == 0) {
            func_ov002_021e27c0(1-p->side, 1);
            return 0x6e;
        }
        func_ov002_0226af94(p->side, p->id, 1);
        return 0x7f;
    case 0x7f:
        slot = data_ov002_022d0e6c.slot;
        value = func_0202b950(((struct Entry *)(data_ov002_022cf16c + ((1-p->side)&1)*0x868 + 0x120))[slot].id);
        if (value != 0xffff) {
            for (i=0; i<=4; i++) {
                char *row = data_ov002_022cf16c + (p->side&1)*0x868 + i*0x14;
                if (((struct Entry *)(row+0x30))->id != 0 && *(u16 *)(row+0x38) != 0) {
                    if (func_ov002_021c8470(p->side, i) >= value) {
                        func_ov002_021e2b3c();
                        func_ov002_021e2550(1-p->side, slot, (int)(data_ov002_022cf16c + ((1-p->side)&1)*0x868 + 0x120 + slot*4), 1);
                        func_ov002_021df818(p, 1-p->side, 0x1f4);
                        func_ov002_021e2c5c();
                        return 0;
                    }
                }
            }
        }
        func_ov002_021df818(p, p->side, 0x1f4);
        return 0;
    case 0x6e:
        func_ov002_021ae400(p->side, 0x11);
        return 0x64;
    case 0x64:
        func_ov002_021e27c0(1-p->side, 0);
        return 0;
    }
    return 0;
}

