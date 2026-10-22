typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned int a,b; unsigned char pad8[0x14]; struct { unsigned int low8:8; unsigned int:24; }; unsigned char pad20[4]; struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; }; } state_t;
typedef struct { u32 f_0,f_4; } Dims02001e94;
typedef struct { char pad[0x24]; u32 f24; } Arg_02005188;
typedef struct { char pad[0x24]; u32 f24; } Arg_020051cc;
typedef struct { int f0,mode; u32 bits,mask; int f10,kind,pad18[2],index,pad24[3],count; char pad34[0x184]; int f1b8; char pad1bc[0x14]; int f1d0; int pad1d4; int f1d8; char pad1dc[0x14]; int f1f0; char pad1f4[0x40]; int f234; } Self;
typedef struct { char pad[0x68]; int *f_68; } state_ov002_022ac028_t;
struct S022abf88 { char pad0[4]; int f4; char pad1[0x60]; int *f68; char pad2[4]; int *f70; };
extern state_t data_02102c90;
extern char data_ov002_022cbdbc[],data_ov002_022cbdc4[],data_ov002_022cbdcc[],data_ov002_022cbdd4[];
extern int func_0208de4c(void);
extern int func_0208e0a0(void);
extern void func_02094504(int value,void *dest,int size);
extern void func_02001d0c(state_t *p,int a,int b);
extern void func_02001e94(Dims02001e94 *p,u16 *dst,int val,int shift);
extern void func_02005188(Arg_02005188 *a0,int a1,int a2,int a3,int a4,int a5);
extern void func_020051cc(Arg_020051cc *a0,int a1,int a2,int a3,int a4,int a5);
extern int func_020054a4(char *text,int font);
extern char *func_0202b7cc(int idx);
extern char *func_0202b7ec(int idx);
extern char *func_0202b830(int idx);
extern int func_020a978c(char *dst,const char *fmt,...);
extern char *func_020aadf8(char *dst,const char *src);
extern int func_ov002_021afaf0(void);
extern int func_ov002_021afbd4(int idx);
extern void func_ov002_0229cfa0(char *dst,int arg1);
extern int func_ov002_022a0f8c(Self *self,int i);
extern int func_ov002_022abf88(struct S022abf88 *self,int idx);
extern int func_ov002_022ac028(state_ov002_022ac028_t *p,int idx);
extern void func_ov002_022ac67c(Self *self);
void func_ov002_022a10fc(Self *self,int i)
{
    char text[128];
    char temp[128];
    int tile;
    int pixels;
    int map;
    int row;
    int v;
    switch(self->mode) {
    case 12:
        tile=self->count*26+1;
        pixels=func_0208de4c()+(tile<<6);
        func_02094504(0,(void *)pixels,(18-self->count)*0x680);
        row=self->count;
        map=func_0208e0a0()+(row<<6);
        func_02094504(0,(void *)map,(18-row)<<6);
        func_020a978c(text,data_ov002_022cbdbc,i);
        func_02001d0c(&data_02102c90,26,18);
        func_020051cc((Arg_020051cc *)&data_02102c90,(int)text,pixels,104,4,12);
        func_02001e94((Dims02001e94 *)&data_02102c90,(u16 *)(map+0x46),tile,0);
        ((u16 *)map)[0x2e]=0x2281;
        ((u16 *)map)[0x2f]=0x2282;
        ((u16 *)map)[0x4e]=0x2283;
        ((u16 *)map)[0x4f]=0x2284;
        break;
    case 5:
        tile=self->count*26+0xb9;
        pixels=func_0208de4c()+(tile<<6);
        func_02094504(0,(void *)pixels,(18-self->count)*0x680);
        row=self->count;
        map=func_0208e0a0()+((row+4)<<6);
        func_02094504(0,(void *)map,(18-row)<<6);
        func_020a978c(text,data_ov002_022cbdc4,func_0202b7ec(i+1));
        func_02001d0c(&data_02102c90,26,2);
        func_02005188((Arg_02005188 *)&data_02102c90,(int)text,pixels,104-func_020054a4(text,12)/2,2,12);
        func_02001e94((Dims02001e94 *)&data_02102c90,(u16 *)(map+6),tile,0);
        break;
    case 6:
        tile=self->count*26+0x49;
        pixels=func_0208de4c()+(tile<<6);
        func_02094504(0,(void *)pixels,(18-self->count)*0x680);
        row=self->count;
        map=func_0208e0a0()+((row+2)<<6);
        func_02094504(0,(void *)map,(18-row)<<6);
        v=4-func_ov002_022a0f8c(self,i)*3;
        func_020a978c(text,data_ov002_022cbdcc,v,func_0202b830(i+1));
        func_02001d0c(&data_02102c90,26,2);
        func_02005188((Arg_02005188 *)&data_02102c90,(int)text,pixels,104-func_020054a4(text,12)/2,2,12);
        func_02001e94((Dims02001e94 *)&data_02102c90,(u16 *)(map+6),tile,0);
        break;
    case 10:
        tile=self->count*26+1;
        pixels=func_0208de4c()+(tile<<6);
        func_02094504(0,(void *)pixels,(18-self->count)*0x680);
        row=self->count;
        map=func_0208e0a0()+(row<<6);
        func_02094504(0,(void *)map,(18-row)<<6);
        text[0]=0x40; text[1]=0x31;
        func_020a978c(text+2,func_0202b7cc((u16)self->bits),i);
        func_02001d0c(&data_02102c90,26,2);
        func_020051cc((Arg_020051cc *)&data_02102c90,(int)text,pixels,0,2,12);
        func_02001e94((Dims02001e94 *)&data_02102c90,(u16 *)(map+0x18),tile,0);
        break;
    case 3:
        tile=self->count*26+1;
        pixels=func_0208de4c()+(tile<<6);
        func_02094504(0,(void *)pixels,(18-self->count)*0x680);
        row=self->count;
        map=func_0208e0a0()+(row<<6);
        func_02094504(0,(void *)map,(18-row)<<6);
        v=func_ov002_021afbd4(i);
        if(v==0) return;
        if(func_ov002_022a0f8c(self,i)==0) {
            func_ov002_0229cfa0(temp,(int)func_0202b7cc(v));
            func_020a978c(text,data_ov002_022cbdd4,temp);
        } else {
            func_020aadf8(text,func_0202b7cc(v));
        }
        func_02001d0c(&data_02102c90,24,18);
        func_02005188((Arg_02005188 *)&data_02102c90,(int)text,pixels,0,5,12);
        func_02001e94((Dims02001e94 *)&data_02102c90,(u16 *)(map+0x88),tile,0);
        break;
    default:
        if(self->mode<0) {
            self->f10=func_ov002_022abf88((struct S022abf88 *)self,i);
            if(self->f10==0) self->f10=1;
            self->index=i;
            if(i<self->pad24[1]) {
                self->pad24[1]=i; self->f234=i;
                func_ov002_022ac67c(self);
            } else if(i>=self->pad24[1]+6) {
                self->pad24[1]=i-5; self->f234=i-5;
                func_ov002_022ac67c(self);
            }
            if(func_ov002_021afaf0()>1 || -self->mode==0x48) {
                if(func_ov002_022ac028((state_ov002_022ac028_t *)self,self->index)>0) {
                    self->f1b8=0; self->f1d0=0; self->f1d8=1; self->f1f0=0;
                } else {
                    self->f1b8=1; self->f1d0=0; self->f1d8=0; self->f1f0=0;
                }
            }
        }
        break;
    case 9: break;
    }
}
