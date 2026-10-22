typedef struct {
    unsigned int a, b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8:8; unsigned int:24; };
    unsigned char _pad20[4];
    struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
typedef struct { int v[6]; } Labels;
extern char data_02102c90[];
typedef struct { int unused; unsigned int mode:3; unsigned int:29; char pad[0x920]; int level, stage; } System;
extern System data_02104f4c;
extern Labels data_ov019_021b5a50;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02001d68(int arg);
extern void func_02005088(int a0,int a1,int a2,int a3,int a4,int a5);
extern int func_020054a4(int text, int size);
extern int func_020117e4(int a,int b,int c,int d,int e);
extern int func_02011a14(int i);
extern unsigned int func_02011a7c(int idx);
extern int func_02018abc(int x);
extern int func_02018d1c(int arg);
extern int func_02019210(int x);
extern int func_0202c0c0(int x);
extern int func_0208df0c(void);
extern void func_02094504(int value,int dest,int size);
void func_ov019_021b4c74(int *p) {
    int id = p[0xc0/4];
    int x, text, width, level, dest;
    func_02094504(0,func_0208df0c()+0x580,0x500);
    text=func_0202c0c0(id+0x578);
    func_02001d0c((state_t *)data_02102c90,20,2);
    x=0;
    width=func_020054a4(text,12);
    if (0x90-width >= 20) x+=20;
    else x+=0x8e - width;
    dest=func_0208df0c();
    func_02005088((int)data_02102c90,text,dest+0x580,x+6,1,12);
    x=0;
    func_02094504(0,func_0208df0c()+0xa80,0x500);
    id=func_02019210(id);
    level=data_02104f4c.level;
    id=func_020117e4(id,func_02018abc(level)-1,level,data_02104f4c.stage,1);
    if (id==0) text=func_0202c0c0(0);
    else text=func_02011a14(id);
    func_02001d0c((state_t *)data_02102c90,20,2);
    width=func_020054a4(text,12);
    if (width>0x90) {
        text=func_0202c0c0(0);
        width=func_020054a4(text,12);
    }
    if (0x90-width >= 20) x+=20;
    else x+=0x8e - width;
    dest=func_0208df0c();
    func_02005088((unsigned int)data_02102c90,text,dest+0xa80,x+6,1,12);
    {
        Labels labels=data_ov019_021b5a50;
        id=func_02018d1c(func_02011a7c(id));
        if (id>5) id=5;
        func_02001d68(0);
        func_02094504(0,func_0208df0c()+0xf80,0x3c0);
        x=labels.v[id];
        func_02001d0c((state_t *)data_02102c90,10,3);
        id=func_020054a4(x,12);
        dest=func_0208df0c();
        func_02005088((long long)data_02102c90,x,dest+0xf80,(0x50-id)/2,9,12);
    }
    func_02001d68(data_02104f4c.mode);
    p[0xb8/4]=0;
    p[0xbc/4]=1;
}









