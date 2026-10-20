typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 value; u16 player:1; u16 rest:15; } Arg;
typedef struct { u32 id:13; u32 flag:1; u32 unused:8; u32 kind:8; u32 tail:2; } Card;
typedef struct { char pad[0x120]; Card cards[466]; } Player;
extern u32 data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern Player data_ov002_022cf16c[];
extern u16 data_ov002_022d0e6c[];
extern int data_ov002_022cd3f4[];
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern void func_ov002_021ae430(int a, const char *src);
extern int func_ov002_021de910(int a, int b, int c);
extern int func_ov002_021e278c(int arg0, int arg1);
extern const char *func_ov002_021f4260(int a, int b);
extern void func_ov002_0226af78(int arg0, int arg1);
extern void func_ov002_0226b0b0(int arg0, int arg1, int arg2);
int func_ov002_02224404(Arg *p) {
    switch(data_ov002_022ce288[0x16a]) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + (p->player & 1) * 0x868) == 0) return 0;
        func_ov002_0226af78(p->player, 0);
        return 0x7f;
    case 0x7f:
        data_ov002_022ce288[0x16b] = data_ov002_022d0e6c[0x58];
        func_ov002_0226b0b0(1-p->player, p->value, data_ov002_022d0e6c[0x58]);
        return 0x7e;
    case 0x7e:
        func_ov002_021ae430(p->player,func_ov002_021f4260(p->value,data_ov002_022d0e6c[0x58]));
        return 0x7d;
    case 0x7d: {
        int id, ok;
        func_ov002_021e278c(p->player, data_ov002_022cf16c[p->player & 1].cards[data_ov002_022ce288[0x16b]].kind * 2 + data_ov002_022cf16c[p->player & 1].cards[data_ov002_022ce288[0x16b]].flag);
        id = data_ov002_022cf16c[p->player & 1].cards[data_ov002_022ce288[0x16b]].id;
        ok = 0;
        switch(data_ov002_022d0e6c[0x58]) {
        case 0: ok = func_0202e234(id); break;
        case 1: ok = func_0202b878(id) == 0x16; break;
        case 2: ok = func_0202b878(id) == 0x17; break;
        }
        if (!ok) func_ov002_021de910((int)p, data_ov002_022cd3f4[0],data_ov002_022cd3f4[7]);
        return 0;
    }
    }
    return 0;
}

