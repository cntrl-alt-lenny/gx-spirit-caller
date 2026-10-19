typedef unsigned int u32;
typedef struct { unsigned int a,b; unsigned char pad8[0x14]; struct { unsigned int low8:8; unsigned int:24; }; unsigned char pad20[4]; struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; }; } state_t;
typedef struct { unsigned int f_0, f_4; } Dims02001e94;
typedef struct { char pad[0x24]; unsigned int f24; } Arg_02005188;
typedef struct { int pad0; int mode; char pad8[0x28]; unsigned int count; } Self;
extern state_t data_02102c90;
extern int func_0208de4c(void);
extern int func_0208e0a0(void);
extern void func_02001d0c(state_t *p,int a,int b);
extern void func_02001e94(Dims02001e94 *p,unsigned short *dst,int val,int shift);
extern void func_02005088(int a0,int a1,int a2,int a3,int a4,int a5);
extern void func_02005188(Arg_02005188 *a0,int a1,int a2,int a3,int a4,int a5);
extern char *func_0202b7cc(int idx);
extern void func_02094504(int value,void *dest,int size);
void func_ov002_022a0e60(Self *self,u32 text)
{
    int base = func_0208de4c();
    ((u32 *)&data_02102c90)[3] = 0;
    if (text != 0) {
        if ((unsigned short)(text >> 16) == 0)
            text = (u32)func_0202b7cc(text);
        if (self->mode < 0) {
            func_02001d0c(&data_02102c90,0x1a,2);
            func_02094504(0,(void *)(base+0x40),0x680);
            func_02005088((int)&data_02102c90,text,base+0x40,4,1,0xc);
            func_02001e94((Dims02001e94 *)&data_02102c90,(unsigned short *)(func_0208e0a0()+0x46),2,0);
        } else {
            func_02001d0c(&data_02102c90,0x1a,0x12);
            func_02094504(0,(void *)(base+0x40),0x7500);
            func_02005188((Arg_02005188 *)&data_02102c90,text,base+0x40,0,0,0xc);
            func_02001e94((Dims02001e94 *)&data_02102c90,(unsigned short *)(func_0208e0a0()+0x46),1,0);
        }
    }
    self->count = ((((u32 *)&data_02102c90)[3]+0x14)>>3)+1;
}
