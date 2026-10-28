typedef unsigned short u16;
typedef unsigned char u8;
struct node; struct Node; struct S021ff3bc; struct Ov002Self;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 pad[4]; u16 choice; };
struct State { char pad[0x5a8]; int phase; int saved; };
struct Shared { char pad[0xd44]; int choice; char pad2[0x28]; int a,b,c; };
struct Row { unsigned id:13; unsigned side:1; unsigned rest:18; };
extern struct State data_ov002_022ce288;
extern struct Shared data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern int func_ov002_0225764c(int,int,int);
/* The original supplies only r0 and r1 to this four-argument forwarding thunk. */
extern int func_ov002_02257878();
extern int func_ov002_021ea2b4(int,int,int);
extern int func_ov002_021ff3bc(struct S021ff3bc *,int);
extern int func_ov002_021ca3f0(int,int);
extern int func_ov002_021f4260(int,int);
extern int func_ov002_021ae514(int,int,int,int,int,int);
extern int func_ov002_0226b0d0(int,int,int);
extern int func_ov002_021d5a08(struct Ov002Self *,int,int,int,u16,u16);
extern void func_ov002_021ae400(int,int);
extern void func_ov002_0225935c(int,int,int);
extern int func_ov002_022593f4(void);
extern int func_ov002_021de4b0(int,int,int);
extern int func_ov002_021bc6c4(int);
extern int func_ov002_0227adb8(int,int,int,int);
extern int func_ov002_021d59cc(int,int,int,int,u16);
int func_ov002_02237f58(struct Self *p, int q) {
    int pair;
    int x,y;
    int flags;
    int a,b,c;

    pair=func_ov002_0223de94((struct node *)p,0);
    x=(u8)pair;
    y=(u8)((u16)pair>>8);
    switch (data_ov002_022ce288.phase) {
    case 0x80:
        if (func_ov002_0223df38((struct Node *)p,0,0)==0) return 0;
        if (func_ov002_0225764c((int)p,x,y)==0) return 0;
        flags=1;
        if(func_ov002_02257878((int)p,func_ov002_021ea2b4)!=0) flags|=2;
        if(func_ov002_021ff3bc((struct S021ff3bc *)p,q)!=0) {
            if(func_ov002_021ca3f0(p->side,0x19ed)!=0) flags|=4;
        }
        if(data_ov002_022cd744[p->side]==1) {
            if(flags&4) data_ov002_022d016c.choice=2;
            else if(flags&2) data_ov002_022d016c.choice=1;
            else data_ov002_022d016c.choice=0;
        } else {
            a=func_ov002_021f4260(p->id,0);
            b=func_ov002_021f4260(p->id,1);
            c=func_ov002_021f4260(p->id,2);
            func_ov002_021ae514(0x103,a,b,c,0,flags);
        }
        return 0x7f;
    case 0x7f:
        p->choice=data_ov002_022d016c.choice+1;
        func_ov002_0226b0d0(1-p->side,p->id,data_ov002_022d016c.choice);
        return 0x7e;
    }
    switch(p->choice) {
    case 1:
        func_ov002_021d5a08((struct Ov002Self *)p,x,y,p->id,3,0);
        return 0;
    case 2:
        switch(data_ov002_022ce288.phase) {
        case 0x7e:
            func_ov002_021ae400(p->side,0x8e);
            func_ov002_0225935c(p->side,p->id,(int)func_ov002_021ea2b4);
            return 0x7d;
        case 0x7d:
            if(func_ov002_022593f4()==0) return 0x7e;
            func_ov002_021de4b0((int)p,data_ov002_022d016c.a,data_ov002_022d016c.b+data_ov002_022d016c.c);
            return 0;
        }
        return 0;
    case 3:
        switch(data_ov002_022ce288.phase) {
        case 0x7e: { struct Row row = {0};
            row.id=0x19ed;
            row.side=p->side;
            data_ov002_022ce288.saved=func_ov002_021bc6c4(p->side);
            func_ov002_0227adb8(p->side,(int)&row,1,(p->id<<16)|1);
            return 0x7d;
        } case 0x7d: func_ov002_021d59cc(x,y,(u16)((u8)p->side|((u8)data_ov002_022ce288.saved<<8)),6,0);
        }
        return 0;
    }
    return 0;
}



