#include <nitro/os_thread.h>
typedef struct { char pad[0xae]; unsigned char a,b; } state_0203baa0_t;
typedef struct { char pad[0x78]; void *a,*b,*c,*d; } FreeObj;
struct F02088518 { char pad[68]; int f44,f48; };
typedef struct { int f_0; char pad[6]; unsigned short h_a; } state_0_a_t;
typedef struct { void *head,*tail; unsigned short count,offset; } List;
typedef struct { int *owner; int body[43]; unsigned short flags; } Obj;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int);
extern void func_0203baa0(state_0203baa0_t *);
extern void func_0203bbac(FreeObj *);
/* The original caller forwards three arguments; the C wrapper uses only p. */
extern int func_0203c638();
extern int func_0207cfdc(state_0_a_t *, char *);
extern void func_0207cff4(List *,void *);
extern void func_0207d12c(char *,char *);
extern void func_020882d4(int *);
extern void func_02088518(struct F02088518 *);
extern void func_02092748(OSMutex *);
extern void func_020927b8(char *);
extern int data_0219b328;
extern char data_0219b384[],data_0219b36c[];
extern List data_0219d070,data_0219d07c;
void func_0203c46c(Obj *p, int arg) {
    int irq;
    char *node;
    if (!p) return;
    if (arg) {
        p->flags |= 0x1000;
        func_0203c638((char *)p,0,arg);
        return;
    }
    data_0219b328 = 1;
    func_020927b8(data_0219b384);
    func_020927b8(data_0219b36c);
    p->flags |= 1;
    func_020882d4(p->body);
    if (!(p->flags & 0x2000)) {
        func_02088518((struct F02088518 *)p->body);
        func_0203baa0((state_0203baa0_t *)p);
    }
    irq = OS_DisableIrq();
    node = 0;
    for (;;) {
        node = (char *)func_0207cfdc((state_0_a_t *)&data_0219d070,node);
        if (!node) break;
        if (*(Obj **)(node+8) == p) {
            func_0207cff4(&data_0219d070,node);
            func_0207d12c((char *)&data_0219d07c,node);
        }
    }
    OS_RestoreIrq(irq);
    func_0203bbac((FreeObj *)p);
    p->flags = 0;
    *p->owner = 0;
    func_02092748((OSMutex *)data_0219b36c);
    func_02092748((OSMutex *)data_0219b384);
    data_0219b328 = 0;
}

