typedef unsigned char u8;
typedef struct {
 u8 pad0[0x458];
 int f458, f45c;
 u8 *f460, *f464;
 u8 pad468[0x1c];
 int f484; u8 *f488; int f48c; u8 *f490;
 u8 b494[0x100]; int f594;
 u8 b598[8]; int f5a0; u8 *f5a4; int f5a8;
 u8 f5ac, f5ad, f5ae, f5af;
 char b5b0[0x100], b6b0[0x100], b7b0[0x50];
 u8 pad800[0xc]; unsigned int f80c;
} Ctx;
extern int func_020779d8(unsigned char **pp);
extern void func_02077954(char *dst, char *src, int n);
extern int func_020778c4(unsigned char *table, int kind);
extern void func_02094688(const void *src, void *dst, int n);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
extern int func_020aaddc(const char *s);
extern unsigned char *data_02101f00[];
int func_02077398(Ctx *c, u8 **pp, int depth, int index, int mode) {
 unsigned int kind;
 int n;
 int tag;
 u8 *p;
 int i;
 u8 *value;
 u8 *s;
 u8 *end;
 p = *pp;
 tag = *p++;
 n = func_020779d8(&p);
 if (n < 0 || n > 0x7d0) return 1;
 kind = tag & 0x1f;
 switch (kind) {
 case 2:
  if (c->f5ad) {
   if (index == 0) {
    while (*p == 0) { n--; p++; }
    if (mode != 0) {
     if (mode == 2) { c->f484=n; c->f488=p; }
    } else if (n <= 0x100) { func_02094688(p,c->b494,n); c->f594=n; }
   } else if (index == 1) {
    while (*p == 0) { n--; p++; }
    if (mode != 0) {
     if (mode == 2) { c->f48c=n; c->f490=p; }
    } else if (n <= 8) { func_02094688(p,c->b598,n); c->f5a0=n; }
   }
  }
  p += n;
  break;
 case 3:
  if (depth == 1 && mode != 2) { c->f5a4=p+1; c->f5a8=n-1; }
  if (c->f5ad) {
   p++;
   if (func_02077398(c,&p,depth,0,mode)) return 1;
   c->f5ad=0;
  } else p+=n;
  break;
 case 6: {
  value=p;
  for (i=0;i<6;i++) {
   s=data_02101f00[i];
   if (func_020a7440(value,s,func_020aaddc((char *)s)) == 0) {
    switch (i) {
    case 1: case 2:
     if (mode == 0) c->f45c=i;
     c->f5ad=i; break;
    case 3: case 4:
     if (mode != 2) c->f458=i;
     break;
    case 5:
     if (mode != 2) c->f5ae=i;
     break;
    }
    break;
   }
  }
  p+=n;
  break;
 }
 case 12: case 19: case 20: case 22:
  if (mode != 2) {
   if (c->f5ac) {
    func_02077954(c->b6b0,(char *)p,n);
    if (c->f5ae == 5 && n <= 0x4f) {
     func_02094688(p,c->b7b0,n);
     c->b7b0[n]=0;
    }
   } else func_02077954(c->b5b0,(char *)p,n);
  }
  c->f5ae=0; p+=n;
  break;
 case 23: case 24:
  if (mode != 2) {
   unsigned int value=func_020778c4(p,kind);
   if (index == 0) {
    if (c->f80c >= value) c->f5af=1;
   } else {
    if (c->f80c > value) c->f5af=0;
   }
  }
  p+=n; c->f5ac=1;
  break;
 case 16: {

  if (depth == 0 && index == 0 && mode != 2) c->f460=p;
  end=p+n;
  for(i=0;p<end;) {
   int result=func_02077398(c,&p,depth+1,i,mode);
   i++;
   if (result) return 1;
  }
  if (depth == 1 && index == 0 && mode != 2) c->f464=p;
  break;
 }
 case 17: {
  end=p+n;
  while (p<end) {
   if (func_02077398(c,&p,depth+1,0,mode)) return 1;
  }
  break;
 }
 default:
  if (tag == 0xa0) {
   end=p+n;
   while (p<end) {
    if (func_02077398(c,&p,depth+1,0,mode)) return 1;
   }
  } else p+=n;
  break;
 }
 *pp=p;
 return 0;
}









