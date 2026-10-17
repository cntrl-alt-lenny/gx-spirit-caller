typedef struct {
    unsigned short type;
    unsigned short f2;
    unsigned short f4;
    unsigned short f6;
    int f8;
    int fc;
    unsigned short f10;
    unsigned short f12;
    unsigned char mac[6];
    unsigned short f1a;
    int f1c;
    unsigned short f20;
    unsigned short f22;
    char pad[0x44 - 0x24];
} Event;

typedef void (*EventCb)(Event *ev);

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02093a20(unsigned char *out);
extern void func_020945f4(void *dst, int val, int size);
extern unsigned short func_0209d6f0(void);
extern unsigned short func_0209d724(void);
extern int func_0209dc8c(void);
extern char *func_0209dca8(void);

int func_0209e7f0(int id, EventCb cb, int arg) {
    Event ev;
    int irq;
    int rc;
    char *slot;
    if (cb != 0) {
        func_020945f4(&ev, 0, sizeof(Event));
        ev.type = 0x82;
        ev.f2 = 0;
        ev.f4 = 0x19;
        ev.f6 = id;
        ev.f8 = 0;
        ev.fc = 0;
        ev.f10 = 0;
        ev.f1a = 0xffff;
        ev.f1c = arg;
        ev.f12 = 0;
        func_02093a20(ev.mac);
    }
    irq = OS_DisableIrq();
    rc = func_0209dc8c();
    if (rc != 0) {
        OS_RestoreIrq(irq);
        return rc;
    }
    slot = func_0209dca8() + id * 4;
    *(EventCb *)(slot + 0xcc) = cb;
    *(int *)(slot + 0x10c) = arg;
    if (cb != 0) {
        ev.f22 = func_0209d6f0();
        ev.f20 = func_0209d724();
        cb(&ev);
    }
    OS_RestoreIrq(irq);
    return 0;
}
