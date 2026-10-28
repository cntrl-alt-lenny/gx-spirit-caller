typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;
typedef struct { int f0,f4; short next,f0a; } Node;
typedef struct { u16 x,y; unsigned char width,height; } Ov016Rect;
struct Ov016State { int pad[6]; int value,kind; };
extern void func_ov016_021b5154(int,int,int,u16,int,int,int);
extern void func_ov016_021b5188(int,int,u64);
extern int func_ov016_021b287c(Ov016Rect *);
extern void func_ov016_021b3498(void *,int,int,u16 *);
extern int func_ov016_021b5390(struct Ov016State *);
extern int func_ov016_021b5414(int,int);
/* The original caller supplies an additional palette parameter. */
extern int func_ov016_021b5424(int,u16 *,const u16 *,int,...);
extern Node *func_02005dac(int,int);
extern void *func_020061ac(void);
extern void func_020944a4(int,int,int);
extern char data_02104bac[];
struct Mode { u32 pad; u32 mode:3; u32 other:29; }; extern struct Mode data_02104f4c;
extern int data_ov016_021bac38[];
struct Colors { u16 v[5]; }; extern struct Colors data_ov016_021b8df8;
extern u16 data_ov016_021b9184[],data_ov016_021b918e[],data_ov016_021b9198[],data_ov016_021b91a2[],data_ov016_021b91ac[];
extern char data_ov016_021bab44[];
typedef struct { u32 attr; u16 tile; } Sprite; typedef struct { u16 v[5]; } Rect;
int func_ov016_021b423c(struct Ov016State *state) {
    int *p=(int *)state;
    int j,busy,cell,i;
    u16 *rect;
    Sprite sprite;
    struct Colors colors;
    if (p[0]!=1) return 0;
    busy=data_ov016_021bac38[2];
    func_ov016_021b5154((int)p,2,-1,13,45,0,0);
    func_ov016_021b5154((int)p,1,-1,13,116,0,0);
    cell=23;
    if ((*(u16 *)(data_02104bac+82)&0x200) && busy==0) cell=24;
    func_ov016_021b5154((int)p,0,cell,6,144,0,0);
    cell=25;
    if ((*(u16 *)(data_02104bac+82)&0x100) && busy==0) cell=26;
    func_ov016_021b5154((int)p,0,cell,236,144,0,0);
    func_ov016_021b5188((int)p,0,((u64)(u32)p[2]<<32)|(u64)(u32)p[1]);
    func_ov016_021b5188((int)p,1,((u64)(u32)p[4]<<32)|(u64)(u32)p[3]);
    i=11-p[5];
    sprite.attr=0x80000083|((((u32)(218-i*17-(i/4)*4)-2)&0x1ff)<<16);
    sprite.tile=128;
    func_020944a4((int)&sprite,(int)func_02005dac(1,0),6);
    colors=data_ov016_021b8df8;
    rect=data_ov016_021b9184; cell=40;
    if(func_ov016_021b287c((Ov016Rect *)rect) && busy==0) cell++;
    func_ov016_021b3498(data_ov016_021bab44,0,cell,rect);
    rect=data_ov016_021b918e; cell=20;
    if(func_ov016_021b287c((Ov016Rect *)rect) && busy==0) cell++;
    func_ov016_021b3498(data_ov016_021bab44,0,cell,rect);
    rect=data_ov016_021b9198; cell=22;
    if(func_ov016_021b287c((Ov016Rect *)rect) && busy==0) cell++;
    func_ov016_021b3498(data_ov016_021bab44,0,cell,rect);
    rect=data_ov016_021b91a2; cell=(data_02104f4c.mode)==0?24:28;
    if(func_ov016_021b287c((Ov016Rect *)rect) && busy==0) cell++;
    func_ov016_021b3498(data_ov016_021bab44,0,cell,rect);
    rect=data_ov016_021b91ac; i=data_02104f4c.mode; cell=i==0?26:28+i*2;
    if(func_ov016_021b287c((Ov016Rect *)rect) && busy==0) cell++;
    func_ov016_021b3498(data_ov016_021bab44,0,cell,rect);
    for(j=0;j<10;j++) {
        rect=(u16 *)((Rect *)data_ov016_021b9184+(j+5));
        cell=j*2;
        if(func_ov016_021b287c((Ov016Rect *)rect) && busy==0) cell++;
        func_ov016_021b3498(data_ov016_021bab44,0,cell,rect);
    }
    if(func_020061ac()==0 && busy==0) {
        i=func_ov016_021b5414((int)p,func_ov016_021b5390(state));
        rect=(u16 *)((Rect *)data_ov016_021b9184+i);
        if(i==3) {
            sprite.attr=(((rect[0]-5)&511)<<16)|(((rect[1]-5)&255)|0xc0004000);
            sprite.tile=0x42b8;
            func_020944a4((int)&sprite,(int)func_02005dac(2,0),6);
            sprite.attr=(((rect[0]-5)&511)<<16)|((rect[1]+25)&255);
            sprite.tile=0x42ba;
            func_020944a4((int)&sprite,(int)func_02005dac(2,0),6);
            sprite.attr=(((rect[0]+27)&511)<<16)|(((rect[1]+25)&255)|0x40004000);
            sprite.tile=0x42bb;
            func_020944a4((int)&sprite,(int)func_02005dac(2,0),6);
            sprite.attr=(((rect[0]-5)&511)<<16)|(((rect[1]+33)&255)|0xc0004000);
            sprite.attr|=0x20000000;
            sprite.tile=0x42b8;
            func_020944a4((int)&sprite,(int)func_02005dac(2,0),6);
        } else if(i==4) {
            sprite.attr=(((rect[0]-5)&511)<<16)|(((rect[1]-5)&255)|0xc0000000);
            sprite.tile=0x42b8;
            func_020944a4((int)&sprite,(int)func_02005dac(2,0),6);
        } else {
            sprite.attr=(((rect[0]-5)&511)<<16)|(((rect[1]-5)&255)|0xc0000000);
            sprite.tile=0x42a8;
            func_020944a4((int)&sprite,(int)func_02005dac(2,0),6);
        }
        func_ov016_021b5424((int)p,(u16 *)0x05000696,colors.v,5,0x00600100);
    }
    return 1;
}



