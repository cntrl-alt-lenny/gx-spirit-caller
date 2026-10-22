typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 bit:1; u16 rest:15; };
struct Card { u32 id:13; u32 bit:1; u32 rest:18; };
struct State { char pad[0x5a8]; int state; unsigned int value; };
struct Data { char pad[0xb0]; u16 value; };
extern struct State data_ov002_022ce288;
extern struct Data data_ov002_022d0e6c;
struct Count { int count; char pad[0x864]; };
extern struct Count data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202e234(int x);
extern int func_020305d8(int arg);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021ae430(int a, const char *src);
extern int func_ov002_021ba5e0(int idx);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c988c(int player, int kind, int extra);
/* Original caller supplies only r0 to this thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_021d87dc(int arg0);
extern int func_ov002_021df708(int arg0, int arg1);
/* Original caller supplies only r0-r2; thunk overwrites r3. */
extern int func_ov002_021e13f4();
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e286c(int arg0);
/* Original caller supplies no argument; parameter is unused. */
extern void func_ov002_021e2b3c();
/* Original caller supplies no argument; parameter is unused. */
extern void func_ov002_021e2c5c();
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0226b298(int arg0, int arg1, int arg2);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
extern void func_ov002_0229cf10(char *dst, const char *fmt, int val);
int func_ov002_02225814(struct Self *self) {
    char buf[0x100];

    switch (data_ov002_022ce288.state) {
    case 0x80: { unsigned int player;
        player = self->bit;
        if (data_ov002_022cf17c[player & 1].count == 0) return 0;
        if (func_ov002_021ba5e0(player) == 0) return 0x64;
        func_ov002_0226b298(1 - self->bit, self->id, 0);
        return 0x7f; }
    case 0x7f:
        data_ov002_022ce288.value = data_ov002_022d0e6c.value;
        func_ov002_0229cf10(buf, (const char *)0x130, data_ov002_022d0e6c.value);
        func_ov002_021ae430(self->bit, buf);
        return 0x7e;
    case 0x7e:
        func_ov002_021e2b3c();
        return 0x7d;
    case 0x7d: { unsigned int player; char *base; unsigned int id; unsigned int flag; unsigned int offset;
        player = self->bit;
        offset = 0x868 * (player & 1);
        if (data_ov002_022cf17c[player & 1].count != 0) {
            base = data_ov002_022cf16c + offset;

            id = ((struct Card *)(base + 0x260))->id;
            flag = ((struct Card *)(base + 0x260))->bit;
            func_ov002_021df708(player, id);
            if (func_ov002_021c988c(player, 0xd, 0) == 0) func_ov002_021e2818(player);
            func_ov002_021d87dc(player);
            if (func_0202e234(id) != 0 && func_020305d8(id) != 0) {
                if (data_ov002_022ce288.value == func_0202b8a8(id)) {
                    func_ov002_021e13f4(player, 1, 0);
                } else {
                    if (func_ov002_021bc618(self->bit) != 0 && func_ov002_021ca2b8(self->bit) != 0 && func_ov002_021ca440(self->bit, id) != 0) {
                        func_ov002_0227adb8(flag, (int)(base + 0x260), 1, 0);
                    } else {
                        func_ov002_021e13f4(player, 1, 0);
                    }
                }
            } else {
                func_ov002_021e13f4(player, 1, 0);
                return 0x7d;
            }
        }
        return 0x7c; }
    case 0x7c:
        func_ov002_021e2c5c();
        return 0;
    case 0x64:
        func_ov002_021ae400(self->bit, 0xd);
        return 0x63;
    case 0x63:
        func_ov002_0226b054(1 - self->bit);
        return 0x62;
    case 0x62:
        func_ov002_021e286c(self->bit);
        return 0;
    }
    return 0;
}








