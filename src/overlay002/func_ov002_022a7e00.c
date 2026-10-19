typedef struct { char pad[0x5a0]; unsigned short entries[10]; int count; int active; int selected; int timer; } State;
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; } Obj;
typedef struct { void *task; int f4,f8,fc; short f10; unsigned short f12,f14,f16; int f18; char tail[0xc]; } Desc;
extern char data_ov002_022cc2e0[], data_ov002_022cc2f8[];
extern void *func_02006c0c(void *,int,int);
extern void Task_Invoke(void *p);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Desc *);
extern void *func_ov002_021afb90(int i);
extern int func_ov002_021c9650(int,int,int);
void func_ov002_022a7e00(State *s, int a, int b, int c, int flag) {
    Desc d;
    void *task;
    int value;
    int i;
    if (s->count == 0) {
        task=func_02006c0c(flag ? data_ov002_022cc2e0 : data_ov002_022cc2f8,4,0);
        func_0201d47c((Obj *)&d);
        d.f14=(d.f14 & ~0xf)|9;
        d.task=task;
        d.fc=0xae80;
        d.f14 |= 0x10;
        d.f10=-1;
        func_0201e5b8(&d);
        Task_Invoke(task);
    }
    if (flag) {
        s->selected=0;
        s->count = s->count > c+1 ? s->count : c+1;
        s->active=s->count;
        *(unsigned int *)func_ov002_021afb90(c) &= ~0x4000;
        return;
    }
    value=func_ov002_021c9650(a,b,c);
    for(i=0;i<s->count;i++) {
        if(value==s->entries[i]) return;
    }
    s->selected=-1;
    s->entries[s->count++]=value;
    s->active=s->count;
}

