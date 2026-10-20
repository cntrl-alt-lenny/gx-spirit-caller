typedef unsigned short u16;
typedef unsigned int u32;
struct Arg {
    u16 f0;
    u16 player:1; u16 kind:5; u16 pad2:10;
    u16 a:1; u16 b:1; u16 c:1; u16 pad4:3; u16 key:9; u16 pad5:1;
    u16 f6; u16 f8;
};
struct Row { u32 p0:13; u32 lo:1; u32 p1:8; u32 hi:8; u32 p2:2; };
struct State { char pad[0x5a8]; int state; };
struct Command { char pad[0xd70]; int player; int slot; int offset; };
extern char data_ov002_022cf16c[];
extern struct State data_ov002_022ce288;
extern struct Command data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
int func_ov002_022209b4(struct Arg *p) {
    int key;
    struct Row *row;
    if (p->c) return 0;
    key = p->key;
    row = (struct Row *)(data_ov002_022cf16c + (p->player & 1) * 0x868 + 0x30 + p->kind * 20);
    if (key != row->hi * 2 + row->lo) return 0;
    if (p->f8 == 0) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_022577dc(p) == 0) return 0;
        if (data_ov002_022cd744[p->player] == 1) {
            int j;
            int i;
            for (i=0; i<2; i++) {
                int player = p->player ^ (i == 0 ? 1 : 0);

                for (j=0; j<=4; j++) {
                    if (func_ov002_0225764c((int)p,player,j)) {
                        func_ov002_021de4b0((int)p,player,j);
                        return 0;
                    }
                }
            }
            return 0;
        }
        func_ov002_021ae400(p->player,0x6d);
        func_ov002_0225935c(p->player,p->f0,(int)func_ov002_0225764c);
        return 0x7f;
    case 0x7f:
        if (func_ov002_022593f4() == 0) return 0x80;
        func_ov002_021de4b0((int)p,data_ov002_022d016c.player,data_ov002_022d016c.slot + data_ov002_022d016c.offset);
        return 0;
    default: return 0;
    }
}

