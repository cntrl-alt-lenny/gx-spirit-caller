typedef unsigned long long u64;
typedef struct Config {
    unsigned short name[26];
    char text[12];
    void (*alloc)(int, int);
    void (*tail)(int, int, int);
} Config;
extern char *data_0219dc78;
extern int data_0219dc74;
extern void (*data_0219dc7c)(void *,void *,int);
extern void func_02040258(int *out);
extern int func_020402ec(void);
extern void func_0204037c(void);
extern int func_0204052c(Config *config, void *arg);
extern void func_0204548c(int a,int b,int c);
extern void func_020454cc(int a,int b);
extern int func_020459c4(unsigned short *arr);
extern void func_02047de8(int a,int b,int c,int d);
extern void func_02047ea0(void *,void *,int);
extern void func_020480b4(int,int);
/* The existing void thunk declaration loses the result consumed here. */
extern int func_02053190(void *p);
extern u64 func_020930b0(void);
extern void func_020945f4(void *,int,unsigned int);
extern void func_02094688(const void *,void *,unsigned int);
extern void func_020aadf8(char *,const char *);
extern u64 func_020b3808(u64,u64);
void func_020479ec(void) {
    struct { int code; char pad[0x46]; char a[0x12d]; char b[0x4d]; } first;
    int second[113];
    Config config;
    if (func_020402ec()==0x15) {
        func_02040258(&first.code);
        func_020aadf8(data_0219dc78+0x48,first.a);
        func_020aadf8(data_0219dc78+0x148,first.b);
        func_0204037c();
        func_0204548c(0,*(int *)(data_0219dc78+0x24),0);
        *(int *)(data_0219dc78+0x24)=0;
        if (func_02053190(*(void **)(data_0219dc78+0x1c))) {
            data_0219dc7c(data_0219dc78+0x48,data_0219dc78+0x148,data_0219dc74);
        } else {
            func_02047de8((int)(data_0219dc78+0x48),(int)(data_0219dc78+0x148),(int)func_02047ea0,3);
        }
    } else {
        if (func_020402ec()==0) return;
        if (func_020b3808((func_020930b0()-*(u64 *)(data_0219dc78+0x28))<<6,0x82ea)>0x2710) {
            func_02040258(second);
            func_0204037c();
            func_0204548c(0,*(int *)(data_0219dc78+0x24),0);
            *(int *)(data_0219dc78+0x24)=0;
            func_020480b4(2,second[0]);
        } else {
            func_0204037c();
            func_020945f4(&config,0,0x48);
            func_02094688(*(void **)(data_0219dc78+0x10),&config,(func_020459c4(*(unsigned short **)(data_0219dc78+0x10))<<1)+2);
            func_020aadf8(config.text,data_0219dc78+0x251);
            config.alloc=func_020454cc;
            config.tail=func_0204548c;
            func_0204052c(&config,*(void **)(data_0219dc78+0x24));
        }
    }
}


