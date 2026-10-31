typedef struct { int pad[3]; int count, choice; } State;
typedef struct { int pad[17]; int choice; } Global;
typedef struct { unsigned short x,y; unsigned char w,h; } Rect;
extern Global data_ov003_021cf6c0;
extern int data_02104cec[];
extern char data_021040ac[];
extern unsigned short data_02104bac[];
extern Rect data_ov003_021cf1b8[];
extern void *func_020061ac(void);
extern int func_02034784(void);
extern int func_02034844(void);
extern int func_02037208(int,int,int,int);
extern int func_ov003_021cefec(int,void *);
extern int func_ov003_021cf064(int,void *);
int func_ov003_021cc8b8(int arg) {
    Global *g = &data_ov003_021cf6c0;
    State *s = (State *)arg;
    int i;
    if (data_02104cec[*(int *)(data_021040ac+0xc3c)] == 1) {
        g->choice = !func_02034844();
        s->choice = g->choice;
        return 1;
    }
    if (func_02034784() == 2) {
        s->count++;
        if (s->count >= 600) { g->choice=s->choice; return 1; }
    }
    if (data_02104bac[0x29]) {
        if (data_02104bac[0x2b] & 0x10) {
            s->choice++;
            if (s->choice > 2) s->choice=0;
            func_02037208(56,-1,0,1);
        } else if (data_02104bac[0x2b] & 0x20) {
            s->choice--;
            if (s->choice < 0) s->choice=2;
            func_02037208(56,-1,0,1);
        } else if (data_02104bac[0x2a] & 1) {
            g->choice=s->choice; return 1;
        }
    } else if (func_020061ac()) {
        for (i=0; i<3; i++) {
            if (func_ov003_021cefec(arg,&data_ov003_021cf1b8[i]) && s->choice != i) {
                s->choice=i;
                func_02037208(56,-1,0,1);
                return 0;
            }
        }
        return 0;
    } else {
        int j; Rect *rect; for (j=0,rect=data_ov003_021cf1b8; j<3; j++,rect++) { if (func_ov003_021cf064(arg,rect)) {
                g->choice=s->choice; return 1;
            }
        }
    }
    return 0;
}


