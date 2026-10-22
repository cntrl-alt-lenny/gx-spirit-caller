typedef struct { char pad[0x18]; unsigned int f18; char pad2[4]; unsigned int f20; } state_02001d98_t;
extern void func_02001d68(int arg);
extern void func_02001d84(void *p,int b,int c);
extern void func_02001d98(state_02001d98_t *p,int v);
extern void func_02004f58(int a,int b,int c,int d,int e,int f);
extern int func_020054f0(int a0,int a1,int a2);
extern int func_02005554(int a0,int a1,int a2);
extern void *func_0208dd9c(void);
extern void func_02094504(int a,void *b,int c);
extern int func_0202c0c0(int id);
/* This caller supplies a third argument although the C callee ignores it. */
extern int func_ov006_021b9dec(int unused,int x,int value);
extern int func_ov006_021b9e08(int unused,int x,int value);
extern int OS_SPrintf(char *dst,const char *fmt,...);
extern char data_ov006_0224f448[];
extern unsigned short data_ov006_02257548[];
extern struct { int pad; unsigned int mode:3; } data_02104f4c;
int func_ov006_021bf01c(char *obj) {
    char text[64];
    char number[32];
    char *buf;
    char *str = data_ov006_0224f448;
    buf = func_0208dd9c();
    int diff = data_ov006_02257548[0x36] - data_ov006_02257548[0x3b];
    int width,x,y;
    func_02094504(0,buf+0x40,0x1000);
    func_02001d68(data_02104f4c.mode);
    if (data_02104f4c.mode == 0) func_02001d84(obj+4,9,0);
    else func_02001d98((state_02001d98_t *)(obj+4),5);
    if (data_02104f4c.mode != 0) str = (char *)func_0202c0c0(0x479);
    else if (diff == 0) str = (char *)func_0202c0c0(0x476);
    else if (diff < 0) {
        if (data_02104f4c.mode == 0) func_ov006_021b9e08((int)str,(int)number,diff < 0 ? -diff : diff);
        else func_ov006_021b9dec((int)str,(int)number,diff < 0 ? -diff : diff);
        OS_SPrintf(text,(char *)func_0202c0c0(0x477),number);
        str = text;
    } else {
        if (data_02104f4c.mode == 0) func_ov006_021b9e08((int)str,(int)number,diff);
        else func_ov006_021b9dec((int)str,(int)number,diff);
        OS_SPrintf(text,(char *)func_0202c0c0(0x478),number);
        str = text;
    }
    if (data_02104f4c.mode == 0) width = func_020054f0((int)str,10,9);
    else width = func_02005554((int)str,10,5);
    if (*(int *)(obj+0x74)) { x=165-width/2; y=7; }
    else { x=165-width/2; y=13; }
    func_02004f58((int)(obj+4),(int)str,(int)(buf+0x40),x,y,10);
    if (*(int *)(obj+0x74) != 0) {
        str=(char *)func_0202c0c0(0x47a);
        if (data_02104f4c.mode == 0) width=func_020054f0((int)str,10,9);
        else width=func_02005554((int)str,10,5);
        x=171-width;
        if (data_02104f4c.mode != 0) x+=16;
        func_02004f58((int)(obj+4),(int)str,(int)(buf+0x40),x,22,10);
    }
    func_02001d84(obj+4,0,0);
    func_02001d98((state_02001d98_t *)(obj+4),-1);
    return 1;
}




