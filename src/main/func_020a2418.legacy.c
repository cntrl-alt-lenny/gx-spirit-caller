typedef struct { unsigned char pad[0x1d1f]; unsigned char tag; unsigned char pad20; unsigned char index; unsigned char pad22[0x1e]; void *handle; void *file; unsigned char pad48[6]; unsigned short status; unsigned char pad50[2]; unsigned char active; unsigned char pad53; unsigned char *ptr; unsigned char *ptr2; } View;
typedef struct { int f0; unsigned short *f4; void *f8,*fc,*f10; int f14; unsigned char f18; } Input;
typedef struct node_020a333c { char _pad[0x4bc]; struct node_020a333c *next; } node_020a333c_t;
extern unsigned char *data_021a98fc;
extern unsigned char data_021a9844;
/* The IRQ primitive returns the saved mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern int func_020a3634(void);
extern void func_020a2394(void *,void *);
extern void func_02094688(const void *,void *,int);
extern int func_020a2100(void *,void *);
extern void func_020a34e0(char *p,Input *in,void *extra);
extern void func_020a333c(node_020a333c_t *node);
extern int func_020a5878(void);
/* This caller supplies only r0, unlike the four-argument thunk definition. */
extern int func_020a5864();
extern void func_020a5894(char *a0,char *a1);
int func_020a2418(Input *in,unsigned char *file) {
    unsigned char *p;
    unsigned char index=0xff;
    int saved;
    unsigned char i;
    int off;
    saved=OS_DisableIrq();
    if(!func_020a3634()) { OS_RestoreIrq(saved); return 0; }
    if(data_021a98fc[0x1524]+1>16) { OS_RestoreIrq(saved); return 0; }
    for(i=0;i<16;i++) {
        if(((View *)(data_021a98fc+i*0x5d4))->handle==in) { OS_RestoreIrq(saved); return 0; }
        if(((View *)(data_021a98fc+i*0x5d4))->active==0) { index=i; break; }
    }
    if(i==16) { OS_RestoreIrq(saved); return 0; }
    off=index*0x5d4;
    *(Input **)(data_021a98fc+off+0x1d40)=in;
    p=data_021a98fc+0x1788+off;
    func_020a2394(p,file);
    func_02094688((unsigned char *)in+0x1c,p+0xc4,0x20);
    if(!func_020a2100(data_021a98fc+0x1d2c+off,p)) { OS_RestoreIrq(saved); return 0; }
    func_020a34e0((char *)data_021a98fc+0x186c+off,in,data_021a98fc+0x1300);
    ((View *)(data_021a98fc+off))->index=index;
    func_020a333c((node_020a333c_t *)(data_021a98fc+0x186c+off));
    ((View *)(data_021a98fc+off))->tag=data_021a9844++;
    *(unsigned short *)(data_021a98fc+off+0x1d4e)=1;
    *(unsigned char **)(data_021a98fc+off+0x1d44)=file;
    *(unsigned char **)(data_021a98fc+off+0x1d54)=file+0x1e8;
    *(unsigned char **)(data_021a98fc+off+0x1d58)=file+0x258;
    if(*(int *)(*(unsigned char **)(data_021a98fc+off+0x1d54)+0x6c)!=0 && !func_020a5878()) {
        func_020a5864((int)(data_021a98fc+0x7ce0));
        func_020a5894((char *)data_021a98fc+0x74e0,(char *)0x800);
    }
    ((View *)(data_021a98fc+off))->active=1;
    data_021a98fc[0x1524]++;
    OS_RestoreIrq(saved);
    return 1;
}




