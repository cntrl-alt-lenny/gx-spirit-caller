typedef struct { unsigned int id:13; unsigned int player:1; unsigned int flag:1; unsigned int other:7; unsigned int index:8; unsigned int top:2; } Slot;
typedef struct { unsigned short player:1; unsigned short kind:5; unsigned short extra:8; unsigned short a:1; unsigned short b:1; } Packed;
typedef struct { unsigned short id:13; unsigned short rest:3; unsigned short pad; } Entry;
typedef struct { unsigned short f0,f2,f4,f6; char pad[0x804]; int state; } State;
extern State data_ov002_022ce950;
extern Entry data_ov002_022d0250[];
extern char data_ov002_022cf1ac[];
extern int func_0203058c(int a);
extern int func_ov002_021b00e8(int player,int type);
extern int func_ov002_021b9210(int bit0);
extern void func_ov002_021b9254(int,int,Slot *,int,int);
extern void func_ov002_021b9368(int,int,Slot *,int);
extern void func_ov002_021ba11c(int player,const int *value);
extern void func_ov002_021ba1e8(int arg0,int arg1);
extern void func_ov002_021c2a40(Slot *s);
extern void func_ov002_021c2abc(Slot *,int);
extern void *func_ov002_021c93f0(int player,int kind,int extra);
extern int func_ov002_021c9504(int player,int kind,int extra);
extern int func_ov002_0229ade0(int,...);
void func_ov002_021d01e0(void) {
    int player,kind,extra,id,flags,index;
    Packed packed;

    Slot *p;
    player = (data_ov002_022ce950.f0 & 0x8000) ? 1:0;
    kind = data_ov002_022ce950.f2 & 0xff;
    extra = (data_ov002_022ce950.f2 >> 8) & 0xff;
    flags = data_ov002_022ce950.f6;
    id = data_ov002_022ce950.f4;
    if (kind + extra <= 10) { kind += extra; extra = 0; }
    packed.player = (unsigned short)player;
    packed.kind = (unsigned short)kind;
    packed.extra = (unsigned short)extra;
    packed.a = (unsigned short)(flags % 10);
    packed.b = (unsigned short)(flags / 10);
    if ((kind >= 12 ? func_ov002_021b00e8(player,kind) : func_ov002_021c9504(player,kind,extra)) != 0) {
        ((Slot *)func_ov002_021c93f0(player,kind,extra))->id = id;
        p = func_ov002_021c93f0(player,kind,extra);
        index = ((Slot *)func_ov002_021c93f0(player,kind,extra))->index * 2 + p->player;
        data_ov002_022d0250[index].id = (unsigned short)id;
    } else {
        Slot slot = {0};
        slot.id = id;
        slot.player = player;
        slot.flag = func_0203058c(id);
        slot.index = func_ov002_021b9210(player);
        index = slot.index * 2 + slot.player;
        data_ov002_022d0250[index].id = (unsigned short)id;
        if (kind < 5) {
            func_ov002_021b9254(player,kind,&slot,packed.b,packed.a);
            *(unsigned int *)(data_ov002_022cf1ac + (player & 1)*0x868 + kind*0x14) &= ~0x200000;
            if (func_0203058c(id)) *(unsigned int *)(data_ov002_022cf1ac + (player & 1)*0x868 + kind*0x14) |= 0x10;
        } else if (kind <= 10) {
            func_ov002_021b9368(player,kind,&slot,packed.a);
            *(unsigned int *)(data_ov002_022cf1ac + (player & 1)*0x868 + kind*0x14) &= ~0x100000;
        } else {
            slot.flag = 0;
            switch(kind) {
            case 12: func_ov002_021ba1e8(player,(int)&slot); break;
            case 13: func_ov002_021ba11c(player,(const int *)&slot); break;
            case 14: func_ov002_021c2a40(&slot); break;
            case 15: func_ov002_021c2abc(&slot,0); break;
            }
        }
    }
    func_ov002_0229ade0(0x1b,*(unsigned short *)&packed,id,index);
    data_ov002_022ce950.state = 0;
}

