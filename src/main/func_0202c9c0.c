typedef unsigned int u32;
typedef struct {
    void *resource;
    int unk4;
    int unk8;
    u32 flags;
    short position;
    unsigned short unk12;
    unsigned short layer : 4;
    unsigned short rest : 12;
    char pad[0x12];
} Obj;
typedef struct {
    int active, status;
    char pad8[0x14];
    int x, y, ready;
    char pad28[0x40];
    int layer1, layer2;
} State;
extern State data_0219ad48;
extern char data_020b4728[], data_020c6ca8[], data_020c6cc0[], data_020c6cdc[];
extern int func_0202c730(int x);
extern int func_0202c770(int sel);
extern void func_0202c7e8(unsigned int layer, unsigned int x, unsigned int y);
extern int func_0201d530(int sel);
extern int func_0201d4b4(int sel);
extern void func_02094504(int value, int dest, u32 size);
extern void func_0208ff84(void *a, int b, u32 n);
extern void func_0208ffec(void *src, int off, u32 n);
extern void *func_02006c0c(void *name, int type, int flags);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void Task_Invoke(void *p);
extern int func_02034784(void);
void func_0202c9c0(int active) {
    data_0219ad48.active = active;
    if (func_0202c730(data_0219ad48.layer1)) {
        u32 enabled = *(volatile u32 *)0x04001000 & 0x1f00;
        int a = func_0202c770(data_0219ad48.layer1);
        int b = func_0202c770(data_0219ad48.layer2);
        enabled = (enabled >> 8) & ~(a | b);
        *(volatile u32 *)0x04001000 = (*(volatile u32 *)0x04001000 & ~0x1f00) | (enabled << 8);
    } else {
        u32 enabled = *(volatile u32 *)0x04000000 & 0x1f00;
        int a = func_0202c770(data_0219ad48.layer1);
        int b = func_0202c770(data_0219ad48.layer2);
        enabled = (enabled >> 8) & ~(a | b);
        *(volatile u32 *)0x04000000 = (*(volatile u32 *)0x04000000 & ~0x1f00) | (enabled << 8);
    }
    if (!data_0219ad48.active) return;
    data_0219ad48.x = -1;
    data_0219ad48.y = -1;
    func_0202c7e8(data_0219ad48.layer1, 0, 0);
    func_02094504(0, func_0201d530(data_0219ad48.layer1), 0x20);
    func_02094504(0, func_0201d4b4(data_0219ad48.layer1), 0x600);
    func_0202c7e8(data_0219ad48.layer2, -4, 0);
    func_02094504(0, func_0201d4b4(data_0219ad48.layer2), 0x600);
    if (func_0202c730(data_0219ad48.layer1)) {
        func_0208ff84(data_020b4728, 0, 0x20);
        func_0208ff84(data_020b4728, 0x20, 0x20);
    } else {
        func_0208ffec(data_020b4728, 0, 0x20);
        func_0208ffec(data_020b4728, 0x20, 0x20);
    }
    {
        Obj o;
        void *p = func_02006c0c(data_020c6ca8, 4, 0);
        func_0201d47c(&o);
        o.resource = p;
        o.layer = (unsigned short)data_0219ad48.layer1;
        o.unk8 = -1;
        o.flags = 0x5200;
        o.position = 0x80;
        func_0201e5b8(&o);
        Task_Invoke(p);
    }
    if (func_02034784()) {
        Obj o;
        void *p = func_02006c0c(func_02034784() == 2 ? data_020c6cc0 : data_020c6cdc, 4, 0);
        func_0201d47c(&o);
        o.resource = p;
        o.layer = (unsigned short)data_0219ad48.layer1;
        o.unk8 = -1;
        o.flags = 0x20;
        o.position = 0xa0;
        func_0201e5b8(&o);
        Task_Invoke(p);
    }
    data_0219ad48.status = -1;
    data_0219ad48.ready = data_0219ad48.status > 0;
}


