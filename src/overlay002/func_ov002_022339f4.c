typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u16 id; u16 side:1; u16 rest:15; u16 pad[2]; u16 value; u16 count; } Self;
typedef struct { unsigned int id:13; unsigned int flag:1; unsigned int rest:8; unsigned int count:8; unsigned int top:2; } Entry;
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern struct { char pad[0xd70]; int a; int b; int c; } data_ov002_022d016c;
extern int func_0202b100(int a0);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int,int,int,int);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021d5d48(int a,int b,int c,int unused);
extern int func_ov002_021d8414(int,int,int,int,int,int,int);
extern int func_ov002_021d87a4(int,int,int);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_0225764c(int,int,int);
extern int func_ov002_02257b48(void *p,void *q);
extern void func_ov002_0225935c(int,int,int);
extern int func_ov002_022593f4(void);
extern void func_ov002_0229ce5c(char *,int,int);
int func_ov002_022339f4(Self *self, void *q) {
    char text[256];
    Entry *entry;
    int a, total, slot, result;
    switch(data_ov002_022ce288.state) {
    case 0x80:
        result = func_ov002_02257b48(self,q);
        if (result == 0) return 0;
        func_ov002_021e2b3c(result);
        return 0x7f;
    case 0x7f:
        if (func_ov002_02257b48(self,q) == 0) return 0x64;
        func_ov002_021ae400(self->side,0x139);
        return 0x7e;
    case 0x7e:
        func_ov002_021af9d0(self->side,6,self->id,0);
        return 0x7d;
    case 0x7d:
        self->value = ((Entry *)func_ov002_021afb74())->id;
        entry = (Entry *)func_ov002_021afb74();
        self->count = ((Entry *)func_ov002_021afb74())->count * 2 + entry->flag;
        func_ov002_021d87a4(self->side,14,self->count);
        return 0x7c;
    case 0x7c:
        func_ov002_0229ce5c(text,0x45,func_0202b100(self->value));
        func_ov002_021ae400(self->side,(int)text);
        func_ov002_0225935c(self->side,self->id,(int)func_ov002_0225764c);
        return 0x7b;
    case 0x7b:
        if (func_ov002_022593f4() == 0) return 0x7c;
        total = data_ov002_022d016c.b + data_ov002_022d016c.c;
        a = data_ov002_022d016c.a;
        slot = func_ov002_021bd030(self->side);
        func_ov002_021d8414(self->side,14,self->count,self->side,slot,1,0);
        result = (u8)self->side | ((u8)slot << 8);
        func_ov002_021d5d48(self->side,(u16)result,(u16)((u8)a | ((u8)total << 8)),result);
        return 0x7f;
    case 0x64:
        func_ov002_021e2c5c((int)self);
        return 0;
    }
    return 0;
}


