typedef unsigned short u16;
typedef unsigned int u32;
struct Packed { u16 player:1; u16 kind:5; u16 extra:8; u16 flag:1; u16 top:1; };
struct Rec { u32 id:13; u32 flag13:1; u32 mid:8; u32 hi:8; };
struct Card { u32 id:13; u32 rest:19; };
struct TableEntry { u16 id:13; u16 count:2; u16 flag:1; u16 other; };
struct State { u16 f0; struct Packed f2; u16 f4,f6; char pad[0x804]; int f80c,f810,f814; struct Rec f818; };
extern struct State data_ov002_022ce950;
extern struct TableEntry data_ov002_022d0250[];
extern struct Rec data_ov002_022cf168;
extern int data_ov002_022cd73c[];
struct WordEntry { int value; char pad[16]; };
struct WordPlayer { struct WordEntry rows[11]; char tail[0x78c]; };
struct RecEntry { struct Rec rec; char pad[16]; };
struct RecPlayer { char header[0x30]; struct RecEntry rows[11]; char tail[0x75c]; };
struct FlagPlayer { int flags; char pad[0x864]; };
extern struct WordPlayer data_ov002_022cf1ac[],data_ov002_022cf1a8[];
extern struct FlagPlayer data_ov002_022cf288[];
extern struct RecPlayer data_ov002_022cf16c[];
extern int data_ov002_022d016c[];
extern int func_ov002_0229c7f8(int);
extern u32 func_ov002_021b947c(int);
extern void *func_ov002_021c93f0(int,int,int);
extern void func_ov002_021b91c4(int *,const int *);
extern int func_ov002_021b0c04(int,int);
extern int func_ov002_021c97f8(int,int,int);
extern int func_ov002_021c988c(int,int,int);
extern void func_ov002_021baa04(int,int,int);
extern void func_ov002_021bab38(int,int,int,struct Rec *);
extern void func_ov002_021c9b80(int,int,int,int);
extern int func_ov002_0229ade0(int,int,int,int);
extern void func_ov002_021b1f20(int,int,int,int,int);
extern int func_ov002_021b3ecc(int,int,int);
extern int func_ov002_021b3e28(int,int,int);
void func_ov002_021d35fc(void) {
    int id = data_ov002_022ce950.f4;
    struct Packed input = data_ov002_022ce950.f2;
    int player = input.player;
    int kind = input.kind;
    int card = data_ov002_022d0250[id].id;
    int flag = input.flag;
    int top = input.top;
    int hasextra = input.extra != 0;
    int arg = data_ov002_022ce950.f6;
    struct Packed src,dst;
    switch (data_ov002_022ce950.f810) {
    case 0: {
        u32 value;
        int sourceKind;
        int high,low;
        int *p;
        if (func_ov002_0229c7f8(-1) != 0) return;
        value = func_ov002_021b947c(id);
        low = (u16)value;
        sourceKind = (low >> 8) & 0xff;
        high = (u16)(value >> 16);
        p = func_ov002_021c93f0((unsigned char)value,data_ov002_022ce950.f814 = (u16)sourceKind,(u16)high);
        *p &= ~0x80000;
        *p &= ~0x20000;
        *p &= ~0x100000;
        *p &= ~0x200000;
        func_ov002_021b91c4((int *)&data_ov002_022cf168,p);
        if (player == data_ov002_022cd73c[1] && (unsigned char)sourceKind == 14)
            func_ov002_021b0c04(0x1b,1);
        src.player = (unsigned char)value;
        src.kind = (unsigned char)sourceKind;
        src.extra = (u16)high;
        src.top = (u16)func_ov002_021c97f8(src.player,src.kind,src.extra);
        src.flag = (u16)func_ov002_021c988c(src.player,src.kind,src.extra);
        dst.player = (u16)player;
        dst.kind = (u16)kind;
        dst.extra = 0;
        dst.top = (u16)top;
        dst.flag = (u16)flag;
        if (src.kind <= 10) data_ov002_022d0250[id].count = (u16)(data_ov002_022d0250[id].count + 0xffff);
        func_ov002_021baa04(src.player,src.kind,src.extra);
        func_ov002_021bab38(dst.player,dst.kind,(u16)((unsigned char)flag | ((unsigned char)top << 8)),&data_ov002_022cf168);
        func_ov002_021c9b80(player,kind,2,1);
        func_ov002_0229ade0(0x18,(u16)(data_ov002_022ce950.f818.hi * 2 + data_ov002_022ce950.f818.flag13) | 0x20000,*(u16 *)&src,*(u16 *)&dst);
        func_ov002_021c9b80(player,kind,8,1);
        data_ov002_022ce950.f810++;
        break;
    }
    case 1:
        if (hasextra) {
            switch (card) {
            case 0x13a6: func_ov002_021b1f20(player,kind,5,card,0); break;
            case 0x1472: case 0x1636: case 0x172f: case 0x1809: case 0x1aca:
                func_ov002_021b1f20(player,kind,5,0x1472,arg);
                data_ov002_022cf1ac[player & 1].rows[kind].value |= 0x400;
                break;
            case 0x18b4: case 0x18fb: case 0x1a4e:
                data_ov002_022cf1a8[player & 1].rows[kind].value = arg;
                break;
            }
        }
        if (data_ov002_022d016c[0x33e] == 2)
            data_ov002_022cf288[data_ov002_022d016c[0x33b] & 1].flags |= 0x100000;
        if (data_ov002_022ce950.f814 == 11 && func_ov002_021b3ecc(player,11,0x15c7)) {
            int result = func_ov002_021b3e28(player,11,0x15c7);
            func_ov002_021b1f20(player,kind,1,0x15c7,result);
        }
        func_ov002_0229ade0(0x24,0,0,0);
        {
            struct Rec *r = &data_ov002_022cf16c[player & 1].rows[kind].rec;
            u16 packed = (player & 1) | ((kind & 31) << 1) | ((flag & 1) << 14) | ((top & 1) << 15);
            func_ov002_0229ade0(0x34,packed,r->hi * 2 + r->flag13,0);
        }
        data_ov002_022ce950.f810++;
        break;
    case 2:
        if (func_ov002_0229c7f8(0x34) == 0) data_ov002_022ce950.f80c = 0;
        break;
    }
}






