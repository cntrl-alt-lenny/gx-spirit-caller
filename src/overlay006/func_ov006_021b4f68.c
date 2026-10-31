extern int func_0202adf8(int);
extern void func_0202ae1c(int);
extern void func_0202c070(int);
extern int func_0202c24c(int);
extern void func_0202c270(int);
extern void func_020018d4(int);
extern void func_0200197c(int, int, int);
extern void func_02001d68(int);
extern int func_020373cc(int,int,int,int);
extern int func_ov006_021b5dec(void *);
extern char data_ov006_0224f344[], data_ov006_0224f380[], data_ov006_021cf1b0[], data_ov006_0224f448[];
extern struct { int w0; unsigned chan:3; } data_02104f4c;
typedef struct { int a,b,c,n; unsigned flag:1; } State;
extern State data_ov006_0225dc20;
extern int data_ov006_0224f330[];
static inline void init(State *s, int n) {
    int flag=0; s->a=0; s->b=0; s->c=0; s->n=n; if(n>6) flag=1; s->flag=flag;
}
int func_ov006_021b4f68(void) {
    func_0202adf8((int)data_ov006_0224f344);
    func_0202ae1c(data_02104f4c.chan);
    func_0202c070(data_02104f4c.chan);
    func_0202c24c((int)data_ov006_0224f380);
    func_0202c270(data_02104f4c.chan);
    func_020018d4(0xa0);
    func_0200197c(4,(int)data_ov006_021cf1b0,0x80000);
    func_02001d68(data_02104f4c.chan);
    func_ov006_021b5dec(data_ov006_0224f448);
    data_ov006_0225dc20.a=0; data_ov006_0225dc20.b=0; data_ov006_0225dc20.c=0; data_ov006_0225dc20.n=27; data_ov006_0225dc20.flag=(data_ov006_0225dc20.n>6);
    func_020373cc(0x24,1,0,-1);
    data_ov006_0224f330[3]=0;
    data_ov006_0224f330[0]=2;
    return 1;
}



