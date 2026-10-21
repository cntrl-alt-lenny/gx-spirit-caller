typedef unsigned int u32;
typedef struct { int v[26]; } Prefix;
typedef struct { int f0, f4, f8, fc; unsigned char kind; char pad11[3]; int f14, f18; int f1c,f20,f24; u32 flags; } Input;
typedef struct { int f0,f4,f8,fc; } Req;
typedef struct { int f0,f4; } Out;
typedef struct { unsigned short f_0; } list_f090;
typedef struct { int key,val,pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Table;
typedef struct {
 Prefix prefix;
 Input input;
 char pad94[4];
 list_f090 *f98; int f9c; int arr[24];
 Out out;
 char pad108[0x60]; u32 mask;
 int triple[3];
 char pad178[0xc]; short h184; unsigned char b186;
 unsigned char active:1; unsigned char rest:7;
 void *f188; short screen; char pad18e[0xc];
 unsigned short bit0:1,bit1:1,bit2:1,rest19a:13;
} Obj;
typedef struct { unsigned int low:8,layers:5,high:19; } Display;
/* Fill32 has a parameterless definition; the original calling convention takes three arguments. */
extern void Fill32();
extern void func_0201ef90(int *,int *,int *,int,int,int,Req *,int,int,Out *);
extern void func_0201f090(list_f090 *,int,int *);
extern char *func_0202162c(void);
extern int func_02021660(Table *,int,int);
extern int func_02029c30(Obj *,int,int);
int func_020296cc(Obj *o, Input *in, int idx) {
 Prefix saved;
 Req req;
 short screen;
 Obj *other;
 saved = o->prefix;
 screen = o->screen;
 Fill32(0,o,0x19c);
 o->prefix = saved;
 o->screen = screen;
 o->input = *in;
 *(struct Triple { int a,b,c; } *)o->triple = *(struct Triple *)&in->f1c;
 o->bit2 = 0;
 o->bit1 = 1;
 o->bit0 = 1;
 o->h184 = -1;
 o->active = 0;
 if (o->screen == 0) { u32 planes = (*(volatile u32 *)0x04000000 & 0x1f00) >> 8; *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0x1f00) | ((planes | 0x10) << 8); }
 else { u32 planes = (*(volatile u32 *)0x04001000 & 0x1f00) >> 8; *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | ((planes | 0x10) << 8); }
 req.f0 = in->f8;
 req.f4 = in->fc;
 if (in->flags & 2) { req.f8 = 0; req.fc = 0; }
 else { req.f8 = in->f0; req.fc = in->f4; }
 if (idx >= 0) {
  other = (Obj *)func_02021660((Table *)func_0202162c(),5,idx);
  o->f98 = other->f98;
  o->f9c = other->f9c;
  func_0201f090(o->f98,o->f9c,o->arr);
 } else {
  func_0201ef90((int *)&o->f98,&o->f9c,o->arr,in->f14,in->f18,o->screen == 0 ? 1 : 2,&req,in->flags & 1,in->kind == 1 ? 0x200 : 0x20,&o->out);
 }
 func_02029c30(o,-1,1);
 return 1;
}



