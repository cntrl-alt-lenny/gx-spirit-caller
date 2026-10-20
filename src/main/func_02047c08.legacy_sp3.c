typedef unsigned int u32;
typedef unsigned long long u64;
typedef struct { u32 a,b,c; } Tri;
typedef struct Config {
    unsigned short name[26];
    char text[12];
    void *(*alloc)(void *, unsigned int);
    void (*free)(int,int,int);
} Config;
extern char *data_0219dc78;
extern int data_0219dc74;
extern void *data_0219dc7c;
extern int func_02053190(void *p);
extern int func_020531a0(void *p);
extern int func_020531c0(void *p);
extern void func_02053230(void *self);
extern void func_0205337c(void *, unsigned int, char *);
extern void func_020536c8(void *, int);
extern u64 func_020930b0(void);
extern int func_020459c4(unsigned short *arr);
extern void func_020945f4(void *, int, unsigned int);
extern void func_02094688(const void *, void *, unsigned int);
extern void func_020aadf8(char *, const char *);
extern void *func_020454cc(void *, unsigned int);
extern void func_0204548c(int,int,int);
extern void *func_020454ac(int,int,int);
extern int func_0204052c(Config *config, void *arg);
void func_02047c08(void *cb, int arg) {
    Config config;
    void *handle;
    u64 result;
    func_020945f4(&config,0,0x48);
    data_0219dc7c=cb;
    data_0219dc74=arg;
    if (func_02053190(*(void **)(data_0219dc78+0x1c))) {
        func_0205337c(*(char **)(data_0219dc78+0x1c)+0x10,*(u32 *)(*(char **)(data_0219dc78+0x1c)+0x24),data_0219dc78+0x248);
    } else {
        if (!func_020531a0(data_0219dc78+0x3c)) {
            if (func_020531c0(*(char **)(data_0219dc78+0x1c)+4))
                *(Tri *)(data_0219dc78+0x3c)=*(Tri *)(*(char **)(data_0219dc78+0x1c)+4);
            else func_02053230(data_0219dc78+0x3c);
        } else {
            func_020536c8(data_0219dc78+0x3c,(int)((func_020930b0()*0x5d588b656c078965ULL+0x269ec3ULL)>>32));
        }
        func_0205337c(data_0219dc78+0x3c,*(u32 *)(data_0219dc78+0xc),data_0219dc78+0x248);
    }
    func_02094688(*(void **)(data_0219dc78+0x10),&config,(func_020459c4(*(unsigned short **)(data_0219dc78+0x10))<<1)+2);
    func_020aadf8(config.text,data_0219dc78+0x251);
    config.alloc=func_020454cc;
    config.free=func_0204548c;
    handle=func_020454ac(0,0x1c10,4);
    *(void **)(data_0219dc78+0x24)=handle;
    *(u64 *)(data_0219dc78+0x28)=func_020930b0();
    func_0204052c(&config,handle);
}


