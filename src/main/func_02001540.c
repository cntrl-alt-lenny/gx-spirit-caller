typedef struct { char pad[0x38]; int f38; int f3c; int f40; int f44; int f48; char pad2[0xb18]; int state; } State;
extern State data_021040ac;
typedef struct { int (*callback)(void); long long seed; long long multiplier; long long increment; } Dispatch;
extern Dispatch data_02102c60;
extern int func_02000c4c(int idx);
extern void func_02000cc4(void);
extern int func_02000d4c(void);
extern void func_02000e34(void);
extern void func_02000e70(void);
extern void func_02000f84(void);
extern int func_0200127c(void);
extern int func_02001448(void);
extern void func_02009758(int n);
extern void func_0200a26c(int a0);
extern void func_02018b70(unsigned int value);
extern void func_02018e88(int arg0, int arg1, int arg2);
extern void func_02019160(int value);
extern void func_0201a32c(int n);

int func_02001540(void) {
    State *p = &data_021040ac;
    if (data_02102c60.callback != 0) {
        if ((data_02102c60.callback)() != 0) {
            switch (p->state) {
            case 2:
                func_02000e70();
                data_02102c60.seed = data_021040ac.f38;
                data_02102c60.multiplier = 0x5d588b656c078965LL;
                data_02102c60.increment = 0x00269ec3;
                data_021040ac.f3c = 0;
                data_021040ac.f40 = 0;
                data_021040ac.f44 = 0;
                data_021040ac.f48 = 0;
                break;
            case 6: func_0200127c(); break;
            case 4:
                if (func_0200127c() != 0) {
                    func_02000f84();
                    return 0;
                }
                break;
            case 8:
                if (func_02001448() != 0)
                    p->state = func_02000d4c() - 1;
                break;
            case 10: p->state = func_02000d4c() - 1; break;
            case 12: p->state = func_02000d4c() - 1; break;
            case 14: p->state = func_02000d4c() - 1; break;
            case 16: p->state = func_02000d4c() - 1; break;
            case 18: p->state = func_02000d4c() - 1; break;
            case 20: p->state = func_02000d4c() - 1; break;
            case 22: p->state = func_02000d4c() - 1; break;
            case 24: p->state = func_02000d4c() - 1; break;
            case 26: p->state = func_02000d4c() - 1; break;
            case 28: p->state = func_02000d4c() - 1; break;
            case 30: p->state = func_02000d4c() - 1; break;
            case 32: p->state = func_02000d4c() - 1; break;
            case 34:
                func_02009758(0x21);
                func_02018b70(1);
                func_0200a26c(7);
                func_0200a26c(10);
                p->state = func_02000d4c() - 1;
                p->state = func_02000d4c() - 1;
                func_02018e88(0, 0xd8000, 0xe4000);
                func_02019160(2);
                func_02000cc4();
                p->state = 0x25;
                break;
            case 38: func_02000e34(); break;
            case 36: func_02000e34(); break;
            case 42: p->state = func_02000d4c() - 1; break;
            case 46: p->state = func_02000d4c() - 1; break;
            case 44:
                func_0201a32c(data_021040ac.f3c);
                p->state = func_02000d4c() - 1;
                break;
            case 48: p->state = func_02000d4c() - 1; break;
            case 50: p->state = func_02000d4c() - 1; break;
            case 52: p->state = func_02000d4c() - 1; break;
            case 54: p->state = func_02000d4c() - 1; break;
            case 56: p->state = func_02000d4c() - 1; break;
            }
            func_02000f84();
        }
        return 0;
    } else {
        *(int *)&data_02102c60.callback = func_02000c4c(p->state);
    }
    return 0;
}



