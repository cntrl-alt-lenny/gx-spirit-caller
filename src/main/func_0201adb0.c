extern char *GetSystemWork(void);
extern unsigned char data_0210674c[];
extern unsigned char data_02104f4c[];
extern void func_02009968(int);
extern void func_02009dec(void);
extern void func_02009e9c(void);
extern void func_02009f50(void);
extern void func_0200a380(void);
extern void func_0201904c(int);
extern int func_02019088(int);
/* This call supplies no arguments although the existing thunk declares four. */
extern int func_020190c0();
extern void func_0201a388(void);
extern int func_0201a3b8(int);
extern int func_0201a3ec(void);
extern int func_0201a454(int);
extern int func_0201a498(void);
extern char *func_0201b75c(void);

typedef struct { unsigned short pad, timer; int other; } TimerEntry;
typedef struct { char pad[0xa80]; TimerEntry entries[16]; } Timers;
void func_0201adb0(void) {
    int i;
    char *sw = GetSystemWork();
    unsigned char *p;
    for (i = 0; i < 2 - (*(unsigned short *)(data_0210674c + 0x5c) & 3); i++) {
        func_02009f50();
    }
    *(unsigned short *)(data_0210674c + 0x5c) = 0;
    for (i = 0; i < 0x5f; i++, sw += 0x18) {
        *(unsigned int *)(sw + 0x10) &= ~0xff0;
    }
    switch (func_020190c0()) {
    case 1: func_02009dec(); break;
    case 2: func_02009e9c(); break;
    case 5:
        if (func_0201a454(func_02019088(1))) {
            *(unsigned int *)func_0201b75c() |= 0x4000;
        }
        break;
    case 6:
        if (func_0201a498()) {
            *(unsigned int *)func_0201b75c() &= ~0x4000;
        }
        if (func_0201a3b8(func_02019088(1))) {
            *(unsigned int *)func_0201b75c() |= 0x2000;
        }
        break;
    case 0:
        if (func_0201a3ec()) {
            func_0201a388();
            *(unsigned int *)func_0201b75c() &= ~0x2000;
        }
        break;
    }
    for (i = 0; i < 0x10; i++) {
        if (((Timers *)data_02104f4c)->entries[i].timer != 0)
            --((Timers *)data_02104f4c)->entries[i].timer;
    }
    func_0200a380();
    func_0201904c(1);
    p = data_02104f4c;
    for (i = 0; i < 0x1a; i++, p += 0x1c) {
        func_02009968(i + 1);
        switch (i) {
        case 5: case 13: case 15: case 16:
            p[0x156d] = 0x32;
            break;
        }
    }
}

