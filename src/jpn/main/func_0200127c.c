/* func_0200127c: big state-dispatcher. If func_02000fc8() signals busy,
 * return 1 immediately. Otherwise switch on data_02103fcc.f_3c (current
 * state): most handled states call func_02000cc4() then set a new
 * "next action" into data_02103fcc.f_b64 and return 0; state 0 and any
 * unhandled state return 1; state 4 just returns 0.
 */
typedef struct {
    char _pad0[0x3c];
    int f_3c;
    int f_40;
    char _pad1[0xb64 - 0x44];
    int f_b64;
} state_021040ac_t;

extern state_021040ac_t data_02103fcc;
extern int func_02000fc8(void);
extern void func_02000cc4(void);
extern int func_02000d4c(void);

int func_0200127c(void)
{
    state_021040ac_t *p = &data_02103fcc;

    if (func_02000fc8() != 0) {
        return 1;
    }

    switch (data_02103fcc.f_3c) {
    case 1:
        func_02000cc4();
        p->f_b64 = 3;
        break;
    case 2:
        switch (data_02103fcc.f_40) {
        case 1:
            func_02000cc4();
            p->f_b64 = 9;
            break;
        case 2:
            func_02000cc4();
            p->f_b64 = 0xf;
            break;
        case 3:
            func_02000cc4();
            p->f_b64 = 0x13;
            break;
        case 4:
            func_02000cc4();
            p->f_b64 = 0x11;
            break;
        }
        break;
    case 3:
        func_02000cc4();
        p->f_b64 = 0x2f;
        break;
    case 5:
        switch (data_02103fcc.f_40) {
        case 1:
            func_02000cc4();
            p->f_b64 = 0x31;
            break;
        case 2:
            func_02000cc4();
            p->f_b64 = 0x1d;
            break;
        }
        break;
    case 6:
        switch (data_02103fcc.f_40) {
        case 1:
            func_02000cc4();
            p->f_b64 = 0x15;
            break;
        case 2:
            func_02000cc4();
            p->f_b64 = 0x35;
            break;
        case 3:
            func_02000cc4();
            p->f_b64 = 0x2d;
            break;
        case 4:
            func_02000cc4();
            p->f_b64 = 0x37;
            break;
        }
        break;
    case 21:
        func_02000cc4();
        p->f_b64 = 7;
        data_02103fcc.f_3c = 0;
        break;
    case 23:
        data_02103fcc.f_3c = 1;
        p->f_b64 = func_02000d4c() - 1;
        break;
    case 4:
        break;
    case 0:
    default:
        return 1;
    }
    return 0;
}
