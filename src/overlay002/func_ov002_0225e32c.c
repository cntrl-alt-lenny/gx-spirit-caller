typedef unsigned int u32;
typedef unsigned short u16;
typedef struct S { int pad0[2]; int f8, fc, f10; int pad14[8]; int f34; } S;
struct Packed { u32 amount:16, side:1, slot:4, flag:1, other:4, unused:6; };
typedef union { struct Packed b; u32 packed; } Packed;
struct Pending { u32 amount; int side, slot, flag, other; };
struct Card { u32 lo:13, hi:19; };
struct Globals { int f0, f4, f8; char p0[8]; int f14; int f18, f1c, f20; char p1[0x78]; struct Pending pending[2]; struct Card c4; char p2[0x10]; struct Card d8; };
struct State { char p[0xcec]; int side; char q[8]; int phase; char r[0x34]; int step; };
struct Request { u16 card; u16 side:1, rest:15; int fields[5]; };
extern struct Globals data_ov002_022cd3f4;
extern S data_ov002_022cd420[];
extern struct Pending data_ov002_022cd490[];
extern struct State data_ov002_022d016c;
extern int func_ov002_021b4120(int,int,int);
extern int func_ov002_021badb0(S *);
extern void func_ov002_021d5b80(int,int,int,int);
extern int func_ov002_021de480(int,int,int,int);
extern int func_ov002_021dee94(struct Request *, int);
extern int func_ov002_021df938(int,int,int,int);
extern void func_ov002_021dfa80(struct Pending *);
/* The C definitions have one unused parameter; this caller passes none. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_021e30b4(int,int,int);
extern void func_ov002_02244fe4(int,u32);
int func_ov002_0225e32c(int side) {
    S *p = &data_ov002_022cd420[side];
    int other = data_ov002_022cd3f4.f4;
    S *q = &data_ov002_022cd420[1-side];
    int i;
    switch(data_ov002_022d016c.step) {
    case 0:
        if(data_ov002_022cd3f4.f14 == 0) {
            Packed event;
            struct Globals *pending;
            func_ov002_021e2b3c();
            pending = &data_ov002_022cd3f4;
            for(i=0; i<2; i++,pending = (struct Globals *)((char *)pending + 0x14)) {
                u32 amount = pending->pending[0].amount;
                if(amount != 0) {
                    if(amount > 0xffff) amount = 0xffff;
                    event.b.amount = amount;
                    event.b.side = pending->pending[0].side;
                    event.b.slot = pending->pending[0].slot;
                    event.b.flag = pending->pending[0].flag;
                    event.b.other = pending->pending[0].other;
                    func_ov002_02244fe4(14,event.packed);
                }
            }
            func_ov002_021e2c5c();
        }
        data_ov002_022d016c.step++;
        return 0;
    case 1:
        data_ov002_022d016c.step++;
        return 0;
    case 2:
        func_ov002_021e2b3c();
        switch(p->f10) {
        case 0x12ac:
            if(func_ov002_021badb0(p)) func_ov002_021d5b80(side,data_ov002_022cd3f4.f1c,0x12ac,1);
            break;
        case 0x13cb:
            if(data_ov002_022cd3f4.f8 == 0 && data_ov002_022d016c.side == side && data_ov002_022d016c.phase == 3 && q->pad14[6] == 0)
                func_ov002_021e30b4(((u32)side << 31 & 0x80000000) | 0x1e200000 | (((u32)data_ov002_022cd3f4.f1c << 16) & 0x1f0000) | (u16)p->f10,(u16)p->fc,0);
            break;
        }
        if(q->pad14[6] != 0 && side != other && data_ov002_022cd3f4.d8.lo != 0) {
            switch(p->f10) {
            case 0x13b1: case 0x16cb: case 0x17e3: case 0x1826: case 0x1861: case 0x19d3: case 0x19d4: case 0x1a93:
                func_ov002_021e30b4(((u32)side << 31 & 0x80000000) | 0x1e200000 | (((u32)data_ov002_022cd3f4.f1c << 16) & 0x1f0000) | (u16)p->f10,(u16)p->fc,0);
                break;
            }
        }
        if(p->pad14[6] != 0 && side != other && data_ov002_022cd3f4.c4.lo != 0 && q->f10 == 0x13b1)
            func_ov002_021e30b4(((u32)other << 31 & 0x80000000) | 0x1e200000 | (((u32)data_ov002_022cd3f4.f20 << 16) & 0x1f0000) | (u16)q->f10,(u16)q->fc,0);
        for(i=0; i<2; i++) func_ov002_021dfa80(&data_ov002_022cd490[i]);
        for(i=0; i<2; i++) {
            int who = data_ov002_022d016c.side ^ i;
            int n = func_ov002_021b4120(who,11,0x1589);
            if(n > 0) func_ov002_021df938(1-who,n,1,0x1589);
        }
        if(data_ov002_022cd3f4.f8 == 0 && func_ov002_021badb0(q)) {
            switch(q->f10) {
            case 0x16bf:
                if(q->f8 != 0) {
                    if(q->pad14[6] != 0) {
                        struct Request req = {0};
                        req.side = (u16)other;
                        func_ov002_021dee94(&req,1);
                    } else func_ov002_021de480(other,data_ov002_022cd3f4.f20,0,0);
                }
                break;
            case 0x129a:
                if(q->f8 == 0 && side != other) {
                    if(q->pad14[6] != 0) {
                        struct Request req = {0};
                        req.card = q->f10;
                        req.side = (u16)other;
                        func_ov002_021dee94(&req,1);
                    } else func_ov002_021de480(other,data_ov002_022cd3f4.f20,0,0);
                }
                break;
            }
        }
        func_ov002_021e2c5c();
        data_ov002_022d016c.step++;
        return 0;
    }
    return 1;
}


