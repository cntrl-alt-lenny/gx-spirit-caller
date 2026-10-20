typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    void *task;
    int f4, f8, fc;
    short f10, f12;
    u16 bg:4, enable:1, unused:11;
    u16 f16;
    u32 low:14, bank:3, high:15;
    u32 a:8, b:8;
    char pad[8];
} Obj;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void *func_02006c0c(void *, int, int);
extern void Task_Invoke(void *);
extern int func_02037208(int, int, int, int);
extern int OS_SPrintf(char *, const char *, ...);
extern void func_ov002_0229a414(int flag);
extern void func_ov002_022a392c(void);
extern void func_ov002_022a3f44(void);
extern void func_ov002_022a4874(int *p);
extern void func_ov002_022a4c90(int *p);
extern void func_ov002_022a51cc(void);
extern char data_ov002_022d0f2c[];
extern char *data_ov002_022cbe28[];
extern char data_ov002_022cbfec[];
extern char data_ov002_022cc008[];
void func_ov002_022a57b8(int *p, unsigned int state, int index) {
    p[0] = state;
    p[1] = index;
    p[2] = 0;
    p[3] = 0;
    switch (state) {
    case 1: func_ov002_022a392c(); break;
    case 2: func_ov002_022a3f44(); break;
    case 3: func_ov002_022a4874(p); break;
    case 4: func_ov002_022a4c90(p); break;
    case 6: case 7: case 8: case 9: func_ov002_022a51cc(); break;
    case 5: {
        char buf[32];
        Obj o;
        void *task;
        if (*(int *)(data_ov002_022d0f2c + 0xc8) != 0) func_ov002_0229a414(0);
        OS_SPrintf(buf, data_ov002_022cbfec, data_ov002_022cbe28[index]);
        task = func_02006c0c(buf, 4, 0);
        func_0201d47c(&o);
        o.task = task;
        o.bg = 9;
        o.fc = 0xc980;
        o.f10 = -1;
        func_0201e5b8(&o);
        func_0201d47c(&o);
        o.task = task;
        o.bg = 4;
        o.fc = 0x4780;
        o.f10 = -1;
        func_0201e5b8(&o);
        Task_Invoke(task);
        break;
    }
    case 10: {
        Obj o;
        func_0201d47c(&o);
        o.task = func_02006c0c(data_ov002_022cc008, 4, 0);
        o.bg = 9;
        o.fc = 0xb980;
        o.f10 = -1;
        func_0201e5b8(&o);
        Task_Invoke(o.task);
        func_02037208(0x57, -1, 0, 1);
        break;
    }
    }
}

