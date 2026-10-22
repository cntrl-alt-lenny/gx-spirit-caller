typedef unsigned short u16;
typedef struct { u16 x,y; unsigned char w,h; } Rect;
struct P021b3f34 { u16 f0,f2,gap4,f6,f8,gap10; };
typedef struct { int active; u16 id; u16 pad; int extra; } Entry;
typedef struct { int a,b,count,start,selected,pad; Entry entries[87]; int spare[2]; int flag; } State;
extern char data_ov019_021b6920[];
extern char data_ov000_021b1d4c[];
extern char data_ov019_021b5ba0[];
extern char data_ov019_021b5baa[];
extern int func_ov019_021b5948(void *);
extern int func_ov019_021b2728(Rect *r);
extern void func_ov019_021b3f34(int a0,int a1,int a2,struct P021b3f34 *p,int x,int y);
extern void func_ov019_021b3f00(int a0,int a1,int a2,u16 a3,int A,int B,int C);
extern unsigned int func_02019124(void);
extern char *GetSystemWork(void);
extern int func_ov005_021aaea8(void *o);
extern void func_ov019_021b2a48(int,int,u16,u16,int);
extern void func_ov019_021b28dc(int x,int y,int flags,int tile,int palette);

int func_ov019_021b3068(State *p) {

    int mode;
    char *rect;
    char *scroll;
    if (*(int *)(data_ov019_021b6920+8))
        func_ov019_021b5948(data_ov019_021b6920);
    rect=data_ov019_021b5ba0;
    mode=0;
    if (func_ov019_021b2728((Rect *)rect)) mode=1;
    func_ov019_021b3f34((int)p,14,mode,(struct P021b3f34 *)rect,-1,-1);
    if (p->count>0) {
        int index=p->start+p->selected;

        rect=data_ov019_021b5baa;
        mode=0;
        if (p->entries[index].active && p->entries[index].id) {
            if (func_02019124()!=255 || ((unsigned int)(*(int *)(GetSystemWork()+0x900)<<7)>>31)) {
                mode=1;
                if (func_ov019_021b2728((Rect *)rect)) mode=2;
            }
        }
        func_ov019_021b3f34((int)p,12,mode,(struct P021b3f34 *)rect,-1,-1);
        func_ov019_021b3f00((int)p,0,p->flag>0?1:-1,132,p->selected*24+8,2,1);
    }
    if (p->flag>0) {
        func_ov019_021b3f34((int)p,p->flag==2?11:13,-1,(struct P021b3f34 *)(data_ov019_021b5ba0+(2-p->flag)*10),-1,-1);
    }
    scroll=data_ov000_021b1d4c;
    if (p->count>6) {
        mode=0;
        if (*(int *)(scroll+24)==2) mode=1;
        func_ov019_021b3f00((int)p,2,mode,232,8,2,1);
        mode=0;
        if (*(int *)(scroll+24)==3) mode=1;
        func_ov019_021b3f00((int)p,3,mode,232,131,2,1);
        mode=0;
        if (*(int *)(scroll+24)==1) mode=1;
        func_ov019_021b3f00((int)p,4,mode,232,func_ov005_021aaea8(scroll),2,1);
    }
    {
    int mode;
    int y,y2,i;
    i=0; y=13; y2=12;
    for(;i<(p->count>6?6:p->count);i++) {
        int index;

        mode=0;
        if (i==p->selected) mode=2;
        index=p->start+i;
        if(p->entries[index].active) {
            int icon=8;
            if(p->entries[index].id) {
                icon=9;
                if(p->entries[index].id>=16) icon=10;
            }
            func_ov019_021b3f00((int)p,icon,0,7,y,2,0);
        }
        func_ov019_021b2a48(21,y,(u16)(0x348+(p->start+i)%8*12),(u16)mode,160);
        func_ov019_021b3f00((int)p,7,0,211,y,2,0);
        func_ov019_021b28dc(211,y2,2,(p->start+i)%8*3+2,mode);
        func_ov019_021b3f00((int)p,6,0,185,y,2,0);
        func_ov019_021b28dc(185,y2,2,(p->start+i)%8*3+1,mode);
        func_ov019_021b3f00((int)p,5,0,159,y,2,0);
        func_ov019_021b28dc(159,y2,2,(p->start+i)%8*3,mode);
        y+=24; y2+=24;

    }
    }
    return 1;
}
