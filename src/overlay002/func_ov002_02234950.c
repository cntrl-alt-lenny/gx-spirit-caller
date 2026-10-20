typedef unsigned char u8;
typedef unsigned short u16;
struct Node0223def4 { char pad[8]; u16 arr8[5]; u16 f18; };
typedef struct { u16 bit0:1; u16 rest:15; } Bits;
struct State { char pad[0x5a8]; int state; };
struct Results { char pad[0xd70]; int a, b, c; };
struct Owner { int pad, player; };
typedef struct { u16 id:13; u16 rest:3; u16 other; } Card;
extern struct State data_ov002_022ce288;
extern struct Results data_ov002_022d016c;
extern struct Owner data_ov002_022cd73c;
extern Card data_ov002_022d0250[];
extern int func_ov002_0223def4(struct Node0223def4 *, int);
extern int func_ov002_021bd030(int);
extern int func_ov002_021b99b4(int, int);
extern int func_ov002_022577dc(void *);
extern int func_0202b100(int);
extern void func_ov002_0229ce5c(char *, int, int);
extern void func_ov002_021ae400(int, int);
extern void func_ov002_0225935c(int, int, int);
extern int func_ov002_0225764c(int, int, int);
extern int func_ov002_022593f4(void);
extern int func_ov002_021d8414(int, int, int, int, int, int, int);
extern void func_ov002_021d5d58(int, int, int, int);
extern int func_ov002_021b0c04(void *, int);
#define PLAYER (((Bits *)((char *)self + 2))->bit0)
int func_ov002_02234950(struct Node0223def4 *self) {
    char buf[0x100];
    int id = func_ov002_0223def4(self, 0);
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021bd030(PLAYER) < 0) return 0;
        if (func_ov002_021b99b4(PLAYER, id) < 0) return 0;
        self->arr8[1] = id;
        if (func_ov002_022577dc(self) != 0) return 0x7f;
        return 0;
    case 0x7f:
        func_ov002_0229ce5c(buf, 0x45, func_0202b100(data_ov002_022d0250[id].id));
        func_ov002_021ae400(PLAYER, (int)buf);
        func_ov002_0225935c(PLAYER, 0x10d3, (int)func_ov002_0225764c);
        return 0x7e;
    case 0x7e:
        if (func_ov002_022593f4() != 0) {
            int a = data_ov002_022d016c.a;
            int sum = data_ov002_022d016c.b + data_ov002_022d016c.c;
            int slot = func_ov002_021bd030(PLAYER);
            func_ov002_021d8414(PLAYER, 0xe, id, PLAYER, slot, 1, 0);
            func_ov002_021d5d58(PLAYER, (u16)((u8)PLAYER | ((u8)slot << 8)), (u16)((u8)a | ((u8)sum << 8)), 0xb);
            if (PLAYER == data_ov002_022cd73c.player) func_ov002_021b0c04((void *)0x30, 1);
            return 0;
        }
        return 0x7f;
    }
    return 0;
}


