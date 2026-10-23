typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int x,y; } Vec;
typedef struct { u32 attr; u16 tile; u16 pad; } Sprite;
typedef struct { u16 side:1,index:5,offset:8,active:1,pad:1; } Bits;
struct Mask { char pad[0x588]; u32 bits[2]; };
struct Packed { unsigned short a:1,b:5,c:8; };
struct Obj { char _pad[0x590]; struct Packed p; };
extern unsigned short data_ov002_022d1a9c;
extern struct { int pad,side; } data_ov002_022cd73c;
extern struct { char pad[0x38]; int frame; } data_021040ac;
extern short data_020bef80[];
extern char data_ov002_022d0f98[];
extern struct { char pad[0xd0]; int mode; } data_ov002_022d0f2c;
extern int func_ov002_022ae718(unsigned short *p);
extern void func_ov002_022a6e04(Vec *,void *,int,int,int);
extern unsigned int func_02006194(void);
/* The original passes self although the C definition has no parameters. */
extern int func_ov002_022a8694();
extern int func_0207f05c(void *,Sprite *,int);
extern int func_ov002_022a6afc(struct Obj *self);
extern int func_ov002_022a6bdc(char *self);
void func_ov002_022a9d9c(char *self) {
    int colors[6];
    Sprite sprite;
    Vec pos3, pos2, pos;
    Sprite cursor;
    Vec cp;
    Vec s, r, q, p;
    int a,b,i,j,sel,tile,n,alpha;
    char *side;
    if (data_ov002_022d1a9c != 0) {
        sprite.attr = 0x80000000;
        sprite.tile = 0x3573;
        if (func_ov002_022ae718(&data_ov002_022d1a9c) != 0) {
            func_ov002_022a6e04(&s,self,data_ov002_022cd73c.side,13,0);
            pos3 = s;
            n = data_021040ac.frame;
            sprite.tile &= ~0xc00;
            sprite.attr = (sprite.attr & 0xfe00ff00) | ((pos3.y-32 + ((data_020bef80[((u16)(n << 11) >> 4)*2] * 4) >> 12)) & 255) | (((pos3.x-16)&511)<<16);

            sprite.attr |= 0x2000;
            sprite.attr &= ~0xc00;
            sprite.tile = (sprite.tile & ~0xf000) | 0x1000;
            n = ((n / 16)&1)*0x400 + 0xb980;
            sprite.tile = (sprite.tile & ~0x3ff) | (n/128);
            func_0207f05c(data_ov002_022d0f98,&sprite,1);
        } else {
            a = ((*(u32 *)(self+0x580)>>1)&3)*0x200;
            b = (*(u32 *)(self+0x580)&3)*0x200;
            side = self;
            for (i=0;i<2;i++) {
                if (i == ((Bits *)(self+0x594))->side && func_02006194()!=0 && func_ov002_022a8694(self)!=0) sel=((Bits *)(self+0x594))->index;
                else sel=-1;
                for (j=0;j<15;j++) {
                    if ((((struct Mask *)self)->bits[i] & (1<<j)) && j!=11) {
                        tile = sel==j ? b:a;
                        func_ov002_022a6e04(&r,self,i,j,0);
                        pos2=r;
                        sprite.attr = (sprite.attr & 0xfe00ff00) | ((pos2.y-16)&255) | (((pos2.x-16)&511)<<16);
                        n=tile+0xb980+((j<10)<<11);
                        sprite.tile=(sprite.tile & ~0x3ff)|(n/128);
                        func_0207f05c(data_ov002_022d0f98,&sprite,1);
                    }
                }
                if (i==((Bits *)(self+0x594))->side && ((Bits *)(self+0x594))->index==11 && func_02006194()!=0 && func_ov002_022a8694(self)!=0) sel=((Bits *)(self+0x594))->offset;
                else sel=-1;
                n=*(int *)(side+0x484);
                if(n>=8)n=8;
                for(j=n-1;j>=0;j--) {
                    int offset=j+*(int *)(side+0x488);
                    if (((struct Mask *)self)->bits[i] & (1<<(j+16))) {
                        tile=sel==offset ? b:a;
                        func_ov002_022a6e04(&q,self,i,11,offset);
                        pos=q;
                        sprite.attr=(sprite.attr & 0xfe00ff00) | ((pos.y-16)&255) | (((pos.x-16)&511)<<16);
                        n=tile+0xb980;
                        sprite.tile=(sprite.tile & ~0x3ff)|(n/128);
                        func_0207f05c(data_ov002_022d0f98,&sprite,1);
                    }
                }
                side+=0xcc;
            }
        }
    }
    if (!((volatile Bits *)(self+0x590))->active) return;
    if ((*(int *)(self+0x578)&4) || *(int *)(self+0x57c)!=0) return;
    func_ov002_022a6e04(&p,self,((Bits *)(self+0x590))->side,((Bits *)(self+0x590))->index,((Bits *)(self+0x590))->offset);
    cp=p;
    cursor.attr=(((cp.x-16)&511)<<16) | (((cp.y-16)&255) | 0x80000000);
    cursor.tile=0x400;
    if (((Bits *)(self+0x590))->index<=9) cursor.tile=(cursor.tile & ~0x3ff)|4;
    func_0207f05c(data_ov002_022d0f98,&cursor,1);
    if(func_ov002_022a6afc((struct Obj *)self)!=0) {
        colors[0]=31; colors[1]=24; colors[2]=28; colors[3]=31; colors[4]=3; colors[5]=18;
    } else {
        colors[0]=0; colors[1]=31; colors[2]=30; colors[3]=0; colors[4]=14; colors[5]=31;
    }
    alpha=0;
    if(data_ov002_022d0f2c.mode==0) alpha=func_ov002_022a6bdc(self);
    n=256-alpha;
    for(alpha=0;alpha<6;alpha++) colors[alpha]=31+(((colors[alpha]-31)*n)>>8);
    *(u16 *)0x0500061e=colors[0]|(colors[1]<<5)|(colors[2]<<10);
    *(u16 *)0x0500061c=colors[3]|(colors[4]<<5)|(colors[5]<<10);
}





