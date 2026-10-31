typedef struct {
 unsigned int a,b; unsigned char pad8[0x14];
 struct { unsigned int low8:8; unsigned int:24; };
 unsigned char pad20[4];
 struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; };
} state_t;
typedef struct { int a,b,count,value,field10; char pad[0x10]; int field24; } Input;
typedef struct { char pad[0x54]; int value; char rest[0x34]; } Entry;
typedef struct { char pad[0x1dc]; int position,x,unused,y; } State;
typedef struct { char pad[0xd8]; unsigned short active; } StateC;
extern char data_ov016_021bac64[];
extern char data_ov016_021b9740[];
extern state_t data_02102c90;
extern State data_ov016_021bb2c4;
extern StateC data_ov016_021bb3c4;
extern void func_02094504(int value, void *dest, int size);
extern char *func_0208df60(void);
extern void func_02001d0c(state_t *p, int a, int b);
extern void *func_0202c0c0(int id);
extern int func_020054a4(void *text, int font);
extern void func_02005088(int a0,int a1,int a2,int a3,int a4,int a5);
extern int func_ov016_021b75c8(Input *arg);
extern void func_ov016_021b77cc(State *s);
int func_ov016_021b61dc(Input *p) {
 char *table = data_ov016_021b9740;
 void *text;
 char *bg;
 func_02094504(0,data_ov016_021bac64,0x28);
 p->field10=0;
 p->field24=0;
 func_02094504(0,func_0208df60()+0x40,0x580);
 func_02001d0c(&data_02102c90,0x16,2);
 text=func_0202c0c0(0x6b9);
 bg=func_0208df60();
 func_02005088((int)&data_02102c90,(int)text,(int)(bg+0x40),(0xb0-func_020054a4(func_0202c0c0(0x6b9),0xc))/2+1,2,0xc);
 for(p->count=0;p->count<0x3c;p->count++) {
  if (*(int *)(table+p->count*0x54+0x8c)==0) break;
 }
 func_ov016_021b75c8(p);
 *(int *)0x04000014=0x160;
 *(int *)0x04000018=0x160;
 data_ov016_021bb2c4.position=0;
 data_ov016_021bb3c4.active=1;
 data_ov016_021bb2c4.x=-128;
 data_ov016_021bb2c4.y=-184;
 func_ov016_021b77cc(&data_ov016_021bb2c4);
 return 1;
}
