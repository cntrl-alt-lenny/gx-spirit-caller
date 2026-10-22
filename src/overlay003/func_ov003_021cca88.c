typedef struct { int pad[3]; int count; } State;
typedef struct { int pad[19]; int choice; int side; int pad54; int ready; } Global;
typedef struct { unsigned short x,y; unsigned char w,h; } Rect;
extern Global data_ov003_021cf6c0;
extern int data_02104cec[];
extern char data_021040ac[];
extern unsigned short data_02104bac[];
extern Rect data_ov003_021cf1b8[];
extern void *func_020061ac(void);
extern int func_02034784(void);
extern int func_02037208(int,int,int,int);
extern int func_020a991c(void);
extern int func_ov003_021cef78(int,int,int);
extern int func_ov003_021cefec(int,void *);
extern int func_ov003_021cf064(int,void *);
int func_ov003_021cca88(int arg) {
    Global *g = &data_ov003_021cf6c0;
    State *s = (State *)arg;
    int old, i;
    switch (data_02104cec[*(int *)(data_021040ac+0xc3c) ^ (g->side < 0)]) {
    case 1:
        old = g->choice;
        s->count++;
        if (s->count < 32) g->choice = (s->count / 8) & 1;
        else g->choice = (func_020a991c() % 4) > 0;
        if (g->choice != old) func_ov003_021cef78(arg,g->choice,0);
        if (s->count >= 32) func_02037208(58,-1,0,1);
        return s->count >= 32;
    case 2:
        if (g->ready) func_02037208(58,-1,0,1);
        return g->ready;
    default:
        if (func_02034784() == 2) {
            s->count++;
            if (s->count >= 600) { func_02037208(58,-1,0,1); return 1; }
        }
        if (data_02104bac[0x52/2]) {
            if (data_02104bac[0x56/2] & 0xc0) {
                g->choice = 1-g->choice;
                func_ov003_021cef78(arg,g->choice,0);
                func_02037208(56,-1,0,1);
            } else if (data_02104bac[0x54/2] & 1) { func_02037208(58,-1,0,1); return 1; }
        } else if (func_020061ac()) {
            for (i=0;i<2;i++) {
                if (func_ov003_021cefec(arg,&data_ov003_021cf1b8[i+3]) && g->choice != i) {
                    g->choice=i;
                    func_ov003_021cef78(arg,i,0);
                    func_02037208(56,-1,0,1);
                    return 0;
                }
            }
            return 0;
        } else {
            for (i=0;i<2;i++) {
                if (func_ov003_021cf064(arg,&data_ov003_021cf1b8[i+3])) { func_02037208(58,-1,0,1); return 1; }
            }
        }
    }
    return 0;
}

