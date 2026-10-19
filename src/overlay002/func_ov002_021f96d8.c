typedef unsigned short u16;
typedef unsigned int u32;
struct St { u16 f0; u16 bit:1; u16 rest:15; u16 f4[4]; u16 fc; };
struct State { char pad[0x5b4]; int step; };
struct Result { char pad[0xd70]; int player; int pad2; int idx; };
struct Card { u32 id:13; u32 rest:19; };
extern struct State data_ov002_022ce288;
extern struct Result data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021d7c40(void *arg0, int arg1);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_0202b8f0(u32 id);
extern int func_ov002_021f9624(u32 player, int kind, int idx);
extern void func_ov002_02290500(int player, int kind, int (*callback)(u32,int,int));
int func_ov002_021f96d8(struct St *p) {
    switch (data_ov002_022ce288.step) {
    case 0:
        func_ov002_021ae400(p->bit, 0x3a);
        if (data_ov002_022cd744[p->bit] == 1)
            func_ov002_02290500(p->bit, 2, func_ov002_021f9624);
        else
            func_ov002_022592ec((int)func_ov002_021f9624);
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        if (func_ov002_022593f4() != 0) {
            int player = data_ov002_022d016c.player;
            int idx = data_ov002_022d016c.idx;
            func_ov002_021d7c40((void *)player, idx);
            p->fc = func_0202b8f0(((struct Card *)(data_ov002_022cf16c + ((u32)player & 1) * 0x868 + idx * 4 + 0x120))->id);
            return 1;
        }
        data_ov002_022ce288.step--;
        return 0;
    }
    return 0;
}





