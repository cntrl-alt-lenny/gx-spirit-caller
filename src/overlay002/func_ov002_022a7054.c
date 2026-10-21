typedef unsigned short u16;
typedef struct { u16 a:1, b:5, c:8, d:1, e:1; } Bits;
typedef struct { int f0; unsigned int f4; } Data;
extern Data data_02104f4c;
extern Data data_ov002_022cd73c;
extern int func_ov002_0229dd0c(void *self, int x, int y);
extern int func_ov002_0229da1c(void *self, int arg1);
extern void func_ov002_022a82d4(char *obj, int reset);
int func_ov002_022a7054(char *self, int x, int y) {
    int i, n;
    char *p;
    unsigned int flags;
    int side, dx, dy;
    for(i=0,p=self+0x3e0;i<2;i++,p+=0xcc) {
        n=func_ov002_0229dd0c(p,x,y);
        if(n>=0) {
            Bits s;
            if(func_ov002_0229da1c(self+0x3e0+i*0xcc,n))
                func_ov002_022a82d4(self,0);
            s.a=i;
            s.b=11;
            s.c=n;
            s.d=1;
            s.e=0;
            *(u16 *)(self+0x590)=*(u16 *)&s;
            return 1;
        }
    }
    side=data_ov002_022cd73c.f4;
    flags=(data_02104f4c.f4<<27)>>30;
    if(flags&1) x+=0x18;
    if(flags&2) y+=0x10;
    if(y<0x68) { x=0x118-x; side^=1; y=0xd0-y; }
    dx=x-0x46;
    if(dx>=-24) {
        if(dx<0) {
            Bits s;
            dy=y-0x69;
            if(dy>=0 && dy<0x3a) {
            s.a=side;
            s.b=dy<0x1d?10:12;
            s.c=0;
            s.d=1;
            s.e=0;
            *(u16 *)(self+0x590)=*(u16 *)&s;
            return 1;
            }
        } else if(dx<0x8c) {
            int col=dx/28;
            Bits s;
            dy=y-0x69;
            if(dx%28==0 || dy%29==0) return 0;
            if(dy>=0 && dy<0x3a) {
            s.a=side;
            s.b=col+(dy<29?0:5);
            s.c=0;
            s.d=1;
            s.e=0;
            *(u16 *)(self+0x590)=*(u16 *)&s;
            return 1;
            }
        } else if(dx<0xa4) {
            Bits s;
            dy=y-0x69;
            if(dx%28==0 || dy%29==0) return 0;
            if(dy>=0 && dy<0x3a) {
            s.a=side;
            s.b=dy<29?14:13;
            s.c=0;
            s.d=1;
            s.e=0;
            *(u16 *)(self+0x590)=*(u16 *)&s;
            return 1;
            }
        } else if(dx<0xbb) {
            Bits s;
            dy=y-0x69;
            if(dx==0xa4 || dy%29==0) return 0;
            if(dy>=0 && dy<29) {
            s.a=side;
            s.b=15;
            s.c=0;
            s.d=1;
            s.e=0;
            *(u16 *)(self+0x590)=*(u16 *)&s;
            return 1;
            }
        }
    }
    return 0;
}







