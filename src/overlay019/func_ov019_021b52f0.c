typedef struct { unsigned int a,b; unsigned char pad8[20]; unsigned int low8:8; unsigned int:24; unsigned char pad20[4]; unsigned int:17; unsigned int mid4:4; unsigned int:11; } state_t;
typedef struct { unsigned int file; int unk4; int unk8; unsigned int addr; short size; unsigned short unk12; union { unsigned short bits; struct { unsigned short mode:4, flag:1, rest:11; }; }; char pad16[6]; unsigned int a:8,b:8; int tail[2]; } Obj;
typedef struct { int mode,state,active,hit,unk10,height,y,step; } State;
extern state_t data_02102c90[];
extern char data_ov019_021b6920[],data_ov019_021b5dd4[],data_ov019_021b5df4[];
extern int data_020b4728[];
extern void func_02001d0c(state_t *p,int a,int b);
extern void func_02005088(int a0,int a1,int a2,int a3,int a4,int a5);
extern int func_020054a4(int text,int size);
extern void func_02005ee0(void);
extern void *func_02006c0c(char *name,int heap,int flags);
extern void Task_Invoke(void *p);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern int func_0202c0c0(int id);
extern void *Vram_GetBankBaseCD(void);
extern void *func_0208e1ac(void);
extern void *func_0208e200(void);
extern int OS_SPrintf(char *buffer,const char *format,...);
extern void func_02094504(int a,void *b,int c);
extern void func_02094550(int *src,int *dst,unsigned int count);
#define BG0 (*(volatile unsigned int *)0x04001010)
#define BG1 (*(volatile unsigned int *)0x04001014)
#define DISP (*(volatile unsigned int *)0x04001000)
int func_ov019_021b52f0(State *p,int flags,int text) {
    Obj obj;
    char name1[32],name2[32];
    int vram;
    int version,rows,tile,enable;
    unsigned short *map;

    func_02094504(0,data_ov019_021b6920,32);
    func_02094504(0,func_0208e200(),1024);
    func_02094504(0,func_0208e1ac(),1024);
    p->mode=flags&15;
    p->active=1;
    vram=(int)Vram_GetBankBaseCD();
    func_02094504(0,(void *)(vram+0x1b80),0x1c00);
    func_02001d0c(data_02102c90,28,8);
    func_02005088((unsigned int)data_02102c90,text,(int)(vram+0x1b80),2,2,12);
    version=1;
    if(flags&16) version++;
    OS_SPrintf(name1,data_ov019_021b5dd4,version);
    OS_SPrintf(name2,data_ov019_021b5df4,version);
    func_0201d47c(&obj);
    obj.file=(unsigned int)func_02006c0c(name1,4,0);
    obj.mode=6; obj.addr=0x1a40;
    obj.flag=0; obj.size=32; obj.unk8=-1;
    func_0201e5b8(&obj);
    Task_Invoke((void *)obj.file);
    func_0201d47c(&obj);
    obj.file=(unsigned int)func_02006c0c(name2,4,0);
    obj.mode=9; obj.addr=0x19800;
    obj.flag=0; obj.size=32;
    func_0201e5b8(&obj);
    Task_Invoke((void *)obj.file);
    func_02094550(data_020b4728,(int *)0x05000400,32);
    p->height=*(int *)((char *)data_02102c90+12)+12;
    if(p->mode==1) {
        int button, width;
        p->height+=8;
        p->y=p->height;
        button=func_0202c0c0(31);
        width=func_020054a4(func_0202c0c0(31),12);
        width=(224-width)/2;
        func_02005088((int)&data_02102c90[0].a,button,(int)(vram+0x1b80),width+2,p->height,12);
        p->height+=12;
    }
    { int next,y,x;
    map=(unsigned short *)((char *)func_0208e200()+0x44);
    next=220;
    rows=p->height/8;
    if(p->height%8) rows++;
    for(y=0;y<rows;y++) {
        for(x=0;x<28;x++) { map[x]=next; next=(unsigned short)(next+1); }
        map+=32;
    }
    }
    { int y,x; unsigned short *border;
    border=(unsigned short *)((char *)func_0208e1ac()+2);
    for(y=0;y<rows+2;y++) {
        for(x=0;x<30;x++) {
            switch(x) {
            case 0:
                if(y==0) tile=210;
                else if(y<rows+1) tile=213;
                else tile=216;
            break;
            case 29:
                if(y==0) tile=212;
                else if(y<rows+1) tile=215;
                else tile=218;
            break; default:
                if(y==0) tile=211;
                else if(y<rows+1) tile=214;
                else tile=217;
            }
            border[x]=tile|0x1000;
        }
        border+=32;
    }
    }
    p->height+=24;
    BG0=(p->height<<16)&0x01ff0000;
    BG1=(p->height<<16)&0x01ff0000;
    enable=(DISP&0x1f00)>>8;
    DISP=(DISP&~0x1f00)|((enable|3)<<8);
    func_02005ee0();
    return 1;
}








