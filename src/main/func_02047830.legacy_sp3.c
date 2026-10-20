typedef unsigned char u8;
typedef struct { unsigned int a,b,c; } Tri;
typedef struct { char pad[0x10]; Tri hdr; int f1c; unsigned int f20; char pad1[0x18]; int f3c; } Obj;
typedef struct { char pad[0x108]; int x108; char pad10c[0xcc]; int x1d8; } Conn;
typedef struct { int words[0x81]; } Result;
typedef void (*ResultCb)(Conn **pp, Result *res, void *user);
extern char *data_0219dc78;
extern int data_0219dc74;
extern void (*data_0219dc7c)(void *,void *,int);
extern void func_0205337c(void *a0, unsigned int a1, char *a2);
extern void func_02053024(Obj *self, Tri *src, int val);
extern int func_02055c04(Conn **pp, int code, char *buf);
extern int func_02055c70(Conn **pp, void *buf, int a2, int a3, ResultCb cb, void *user);
extern void func_02055e28(char *obj);
extern int func_02047fb8(int param);
extern void func_02047c08(void *cb, int arg);
extern int func_02047e88(int a, int b, int unused, int d);
extern int func_020aaf40(const u8 *a, const u8 *b);
void func_02047830(Conn **pp, Result *res, void *user) {
    char first[21];
    char second[21];
    char third[21];
    char *g;
    if (res->words[0] != 0) return;
    if (*(int *)(data_0219dc78+4)==3) {
        if (*(signed char *)((char *)res+0x8e)==0) {
            func_0205337c(*(char **)(data_0219dc78+0x1c)+4, *(unsigned int *)(data_0219dc78+0xc), first);
            if (func_02047fb8(func_02055c04(pp,0x705,first))) return;
            *(int *)(data_0219dc78+4)=4;
            if (func_02047fb8(func_02055c70(pp,(void *)res->words[1],0,0,func_02047830,0))) return;
        } else {
            func_02055e28((char *)pp);
            func_02047c08((void *)func_02047e88,0);
            *(int *)(data_0219dc78+4)=1;
        }
    } else if (*(int *)(data_0219dc78+4)==4) {
        func_0205337c(*(char **)(data_0219dc78+0x1c)+4, *(unsigned int *)(data_0219dc78+0xc), second);
        if (func_020aaf40((u8 *)res+0x8e,(u8 *)second)==0) {
            func_0205337c(data_0219dc78+0x3c,*(unsigned int *)(data_0219dc78+0xc),third);
            func_02053024(*(Obj **)(data_0219dc78+0x1c),(Tri *)(data_0219dc78+0x3c),res->words[1]);
            func_02055e28((char *)pp);
            g=data_0219dc78;
            data_0219dc7c(g+0x48,g+0x148,data_0219dc74);
        } else {
            if (func_02047fb8(func_02055c70(pp,(void *)res->words[1],0,0,func_02047830,0))) return;
        }
    }
}
