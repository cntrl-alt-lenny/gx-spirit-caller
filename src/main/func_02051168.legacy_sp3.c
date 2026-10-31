typedef struct Mgr Mgr;
extern void *func_020498f0(void);
extern void func_02067608(char *a0);
extern void func_020673dc(Mgr *m);

void func_02051168(char *p) {
    if (p == 0) return;
    func_02067608(p);
    if (*(int *)(p + 0xb4) != 0) return;
    switch (*(unsigned char *)((char *)func_020498f0() + 0x15)) {
    case 0:
    case 1:
        switch (*(unsigned int *)((char *)func_020498f0() + 0x1a0)) {
        case 1:
        case 2:
        case 3:
        case 4:
        case 6:
        case 11:
            func_020673dc(*(Mgr **)((char *)func_020498f0() + 0x10));
            break;
        }
        break;
    case 2:
        if (*(int *)((char *)func_020498f0() + 0x1a0) == 11) {
            func_020673dc(*(Mgr **)((char *)func_020498f0() + 0x10));
        }
        break;
    }
}
