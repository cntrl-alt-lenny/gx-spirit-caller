typedef unsigned short u16;
typedef unsigned int u32;
struct Record { u16 id; u16 owner:1; u16 pad:13; u16 toggle:1; u16 spare:1; u16 bit0:1; u16 bit1:1; u16 more:4; u16 index:9; u16 last:1; u16 rest[9]; };
struct Cmd { u16 cmd; u16 a[383]; union { u32 flags; struct { u32 busy:1; u32 rest:31; } bits; } f; };
struct State { char p0[0x480]; int count; int selected; char p1[0x120]; int f5a8; char p2[0x28]; int n; int f5d8; unsigned char kinds[32]; u32 values[32]; char p3[0x10]; int f68c; int f690; int f694; int f698; };
struct Global { char p0[0xd10]; int done; char p1[0x58]; int side; char p2[0x1c]; int f8c; };
extern struct Cmd data_ov002_022cd968;
extern struct Global data_ov002_022d016c;
extern struct State data_ov002_022ce288;
extern struct { int pad; int side; } data_ov002_022cd73c;
extern struct Record data_ov002_022ce588[];
extern struct { u16 first; u16 second; u16 third; u16 rest[381]; } data_ov002_022cd96a;
extern u16 data_ov002_022cd96c[];
extern char data_ov002_022cd300[], data_ov002_022d0f1c[];
extern struct { char pad[12]; u16 c; u16 e; } data_ov002_022cdc68;
extern struct { u16 flags; u16 pad; } data_ov002_022d0250[];
extern int func_0202e234(int x);
extern int func_ov002_021ae754(void);
extern void *func_ov002_021b1ce0(void);
extern void func_ov002_021b1458(int,int,int,int);
extern void func_ov002_021b1488(int,int);
extern void func_ov002_021b0c54(struct Record *,int);
extern void func_ov002_021d48a8(u16,u16,u16,u16);
/* Original supplies no argument to these unused-parameter callees. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2bd4(void);
extern void func_ov002_021e2c5c();
extern void func_ov002_021e2e80(int,u32,int,u32);
extern int func_ov002_021fd928(struct Record *);
extern void func_ov002_02244fe4(int,u32);
extern void func_ov002_02259774(int,int,int,int);
extern int func_ov002_0226ad24(int,int,void *,int);
extern void func_ov002_0227aa50(void);
extern int func_ov002_0229cd08(int);
/* The caller tests r0 although the existing thunk's definition returns void. */
/* Original call supplies no argument to the pointer thunk. */
extern int func_ov002_0229cd34();
extern int func_ov002_0229cd70(int,int,int);
#define COPY(d,s,n) func_ov002_0229cd70((int)(d),(int)(s),n)
int func_ov002_021b15ec(void) {
    u32 size;
    int i;
    u16 *src;
    int n;
    struct Record *rec;
    if (data_ov002_022cd968.f.bits.busy) return 1;
    data_ov002_022cd968.cmd = 0;
    size = func_ov002_0229cd08((int)&data_ov002_022cd968);
    if (size == 0) {
        if (!func_ov002_0229cd34() || func_ov002_021b1ce0()) {
            data_ov002_022d016c.done=1; return 0;
        }
        return 1;
    }
    func_ov002_021b1488(data_ov002_022cd968.cmd,0);
    switch(data_ov002_022cd968.cmd) {
    case 0: return 1;
    case 2:
        data_ov002_022cd968.f.bits.busy=1;
        func_ov002_021b1458(3,0,0,0);
        func_ov002_021ae754(); return 1;
    case 3: data_ov002_022cd968.f.bits.busy=1; return 1;
    case 21:
        COPY(data_ov002_022cd300,&data_ov002_022cd96a,28);
        func_ov002_0227aa50(); return 1;
    case 22: COPY(data_ov002_022cd300,&data_ov002_022cd96a,28); return 1;
    case 23: data_ov002_022cd968.f.flags |= 2; return 1;
    case 9: func_ov002_02244fe4(data_ov002_022cd968.a[0],data_ov002_022cd968.a[1] | (data_ov002_022cd968.a[2]<<16)); return 1;
    case 10:
        switch(data_ov002_022cd968.a[0]) {
        case 1: func_ov002_021e2b3c(); break;
        case 2: func_ov002_021e2bd4(); break;
        case 0: func_ov002_021e2c5c(); break;
        } return 1;
    case 12:
        data_ov002_022ce288.selected=0;
        data_ov002_022ce288.f694=0;
        data_ov002_022ce288.f698=0;
        data_ov002_022cd968.f.flags |= 0x10;
    case 11:
        n=data_ov002_022cd968.a[0];
        data_ov002_022ce288.n=n;
        src=(u16 *)&data_ov002_022cd96a;
        ++src;
        for(i=0;i<n;i++) {
            data_ov002_022ce288.kinds[i]=src[0];
            data_ov002_022ce288.values[i]=src[1] | (src[2]<<16);
            src+=3;
        } return 1;
    case 13: data_ov002_022cd968.f.flags |= 0x20; return 1;
    case 14:
        data_ov002_022d016c.side=data_ov002_022cd73c.side^1;
        func_ov002_02259774(data_ov002_022cd96a.first,data_ov002_022cd96a.second,data_ov002_022cd96a.third,3);
        data_ov002_022ce288.f68c=1;
        data_ov002_022cd968.f.flags |= 0x20; return 1;
    case 18: COPY(&data_ov002_022ce588[data_ov002_022cd968.a[0]],data_ov002_022cd96c,24); return 1;
    case 19: data_ov002_022ce288.selected=data_ov002_022cd968.a[0]; return 1;
    case 20:
        func_ov002_021e2e80(data_ov002_022cd968.a[0],data_ov002_022cd968.a[1] | (data_ov002_022cd968.a[2]<<16),data_ov002_022cd968.a[5],data_ov002_022cd968.a[3] | (data_ov002_022cd968.a[4]<<16)); return 1;
    case 15:
        data_ov002_022ce288.selected=data_ov002_022cd968.a[0];
        data_ov002_022ce288.f694=0; data_ov002_022ce288.f698=1;
        data_ov002_022cd968.f.flags |= 0x10; return 1;
    case 16: data_ov002_022cd968.f.flags |= 0x20; return 1;
    case 17:
        data_ov002_022d016c.side=data_ov002_022cd73c.side^1;
        func_ov002_02259774(data_ov002_022cd96a.first,data_ov002_022cd96a.second,data_ov002_022cd96a.third,3);
        data_ov002_022ce288.f68c=1;
        data_ov002_022cd968.f.flags |= 0x20; return 1;
    case 30:
        func_ov002_0226ad24(data_ov002_022cd73c.side,data_ov002_022cd968.a[0],data_ov002_022cd96c,8);
        data_ov002_022d016c.f8c=1; return 1;
    case 31:
        COPY(data_ov002_022d0f1c,&data_ov002_022cd96a,16);
        data_ov002_022cd968.f.flags |= 0x200; return 1;
    case 28:
        i=data_ov002_022cd968.a[0];
        data_ov002_022ce288.selected=i;
        COPY(&data_ov002_022ce588[i],data_ov002_022cd96c,24);
        data_ov002_022cdc68.c &= ~0xff00;
        data_ov002_022cd968.f.flags |= 0x1000; return 1;
    case 29:
        data_ov002_022cd968.f.flags |= 0x2000;
        COPY(&data_ov002_022ce588[data_ov002_022ce288.selected],&data_ov002_022cd96a,24); return 1;
    case 26:
        i=data_ov002_022cd968.a[0]; data_ov002_022ce288.selected=i;
        COPY(&data_ov002_022ce588[i],data_ov002_022cd96c,24);
        data_ov002_022cdc68.e &= ~0xff;
        data_ov002_022cd968.f.flags |= 0x400; return 1;
    case 27:
        data_ov002_022cd968.f.flags |= 0x800;
        COPY(&data_ov002_022ce588[data_ov002_022ce288.selected],&data_ov002_022cd96a,24); return 1;
    case 24:
        i=data_ov002_022cd968.a[0]; rec=&data_ov002_022ce588[i];
        data_ov002_022ce288.selected=i;
        COPY(rec,data_ov002_022cd96c,24);
        if (!rec->bit1) {
            if (!func_0202e234(rec->id) && data_ov002_022cd73c.side==(rec->owner ^ rec->toggle))
                data_ov002_022d0250[rec->index].flags |= 0x8000;
            func_ov002_021b0c54(rec,data_ov002_022ce288.selected);
        }
        if (!func_ov002_021fd928(rec)) { func_ov002_021b1458(25,0,0,0); return 1; }
        data_ov002_022cdc68.e &= ~0xff00;
        data_ov002_022cd968.f.flags |= 0x4000; return 1;
    case 25:
        data_ov002_022ce288.f5a8=0;
        if(size<24) return 1;
        if(data_ov002_022ce288.count>1) COPY(&data_ov002_022ce588[data_ov002_022ce288.count-2],&data_ov002_022cd96a,48);
        else COPY(&data_ov002_022ce588[data_ov002_022ce288.count-1],&data_ov002_022cd96a,24);
        return 1;
    case 6: return 1;
    case 7: func_ov002_021d48a8(data_ov002_022cd968.a[0],data_ov002_022cd968.a[1],data_ov002_022cd968.a[2],data_ov002_022cd968.a[3]); return 1;
    case 8: data_ov002_022cd968.f.flags |= 8; return 1;
    case 1: data_ov002_022d016c.done=1; return 0;
    default: func_ov002_021b1458(1,0,0,0); data_ov002_022d016c.done=1; return 0;
    }
}





