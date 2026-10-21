typedef unsigned int u32;
typedef struct { signed char code, sub; short x,y; } Entry;
typedef struct {
 char pad[0x240];
 u32 mode;
 char pad244[0x14];
 u32 low258:10, slot:8, high258:14;
 char pad25c[0xc];
 u32 low268:13, dir:4, high268:15;
 u32 word26c;
 u32 id:8, high270:24;
 char pad274[0xc];
 u32 flags;
} State;
extern State data_ov011_021d403c;
extern Entry data_ov011_021d3594[];
extern const signed char data_ov011_021d35ac[][2];
extern const unsigned char data_ov011_021d3394[][114];
extern void func_ov011_021cbc08(int a,int b);
extern int func_ov011_021ca400(int x,int y);
extern void func_ov011_021cbc1c(void);
extern void func_ov011_021cb218(void);
extern void func_ov011_021cd940(void *xy);
extern void func_ov011_021ceffc(void);
extern void func_ov011_021ccfcc(void);
extern void func_ov011_021d18b4(int n,int *x,int *y);
extern int func_ov011_021d0e88(int arg0);
extern void func_ov011_021d1080(int slot,int *out_x,int *out_y);
void func_ov011_021d191c(int n) {
 State *s=&data_ov011_021d403c;
 int pos[2];
 int x,y;
 if(n>=125) {
  Entry *p=&data_ov011_021d3594[n-125];
  func_ov011_021cbc08(p->x<<12,p->y<<12);
  s->dir=p->sub;
  s->flags |= 0x200;
  s->mode=(s->mode & ~7)|3;
  s->dir=func_ov011_021ca400(p->x,p->y);
  s->flags &= ~0x100;
  func_ov011_021cbc1c();
  func_ov011_021cb218();
  pos[0]=p->x<<12;
  pos[1]=p->y<<12;
  func_ov011_021cd940(pos);
  func_ov011_021ceffc();
  func_ov011_021ccfcc();
  return;
 }
 if(n>=102) {
  int i=n-101;
  const signed char *p=data_ov011_021d35ac[i-1];
  s->slot=p[1]+15;
  func_ov011_021d18b4(i,&x,&y);
  func_ov011_021cbc08(x,y);
  s->id=func_ov011_021ca400(x>>12,y>>12);
  s->dir=data_ov011_021d3394[p[0]-1][p[1]-1];
 } else {
  s->slot=func_ov011_021d0e88(n);
  func_ov011_021d1080(s->slot,&x,&y);
  func_ov011_021cbc08(x,y);
  s->dir=func_ov011_021ca400(x>>12,y>>12);
 }
 s->flags |= 0x200;
 s->mode=(s->mode & ~7)|3;
 func_ov011_021cbc1c();
 s->flags &= ~0x100;
 func_ov011_021cb218();
 func_ov011_021ceffc();
 func_ov011_021ccfcc();
}







