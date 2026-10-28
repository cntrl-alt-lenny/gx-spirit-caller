typedef struct Inner { int value; int pad; int a; int b; } Inner;
typedef struct Item { int value; int pad; Inner *inner; } Item;
typedef struct Owner { char pad[0x198]; int value; char pad2[0x58]; char buf[0x23c]; volatile int count; } Owner;
extern int func_0205d6bc(void **pp, int val, int *out);
extern int func_0205ffc0(int *p, int b);
extern void func_02058070(int a, int b, int c);
extern void func_02058038(void *a0, void *a1, int unused2);
/* The original passes only one argument to this thunk. */
extern int func_020453b4();
extern int func_0205d4c0(void *self);
extern int func_0205d674(int **p, Item *item);
extern int func_0205d560(Owner **pp, void (*fn)(int, int, int), int arg);
extern void func_020a6d54(int a,int b,int c,int d);
extern int func_02056a34(void *unused, void *p, int thr);
extern char data_020fff64[],data_020fff78[],data_020fff84[],data_020fff90[],data_020fffa0[],data_020fffa8[],data_020fffb4[],data_020fffc0[];
int func_02056884(Owner **pp, int key) {
 int n;
 Owner *o = *pp;
 Item *items[2];
 if (!func_0205d6bc((void **)pp,key,(int *)&items[0])) { func_0205ffc0((int *)pp,(int)data_020fff64); return 2; }
 func_02058070((int)pp,(int)o->buf,(int)data_020fff78);
 func_02058070((int)pp,(int)o->buf,(int)data_020fff84);
 func_02058038(pp,o->buf,o->value);
 func_02058070((int)pp,(int)o->buf,(int)data_020fff90);
 func_02058038(pp,o->buf,items[0]->value);
 func_02058070((int)pp,(int)o->buf,(int)data_020fffa0);
 if (items[0]->inner != 0) {
 n = items[0]->inner->value;
 if (n < 0) func_020a6d54((int)data_020fffa8,(int)data_020fffb4,0,0x1fd);
 func_020453b4(items[0]->inner->a); items[0]->inner->a = 0;
 func_020453b4(items[0]->inner->b); items[0]->inner->b = 0;
 func_020453b4((int)items[0]->inner); items[0]->inner = 0;
 if (func_0205d4c0(items[0])) func_0205d674((int **)pp, items[0]);
 o->count--; if (o->count < 0) func_020a6d54((int)data_020fffc0,(int)data_020fffb4,0,0x204);
 func_0205d560(pp,(void (*)(int,int,int))func_02056a34,n);
 }
 return 0;
}





