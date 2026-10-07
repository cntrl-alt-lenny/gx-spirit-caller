struct Nib { unsigned int a : 2; unsigned int b : 2; };

extern void *GetSystemWork(void);
extern char *func_02018bc0(int id);

unsigned int func_02019ea4(int id) {
    char *rec;
    unsigned int b;

    GetSystemWork();
    rec = func_02018bc0(id);
    b = ((struct Nib *)(rec + 0x10))->b;

    switch (id) {
    case 0x19:
    case 0x1b:
    case 0x1c:
    case 0x29:
    case 0x35:
    case 0x36:
    case 0x38:
    case 0x39:
    case 0x3a:
    case 0x3e:
    case 0x3f:
    case 0x48:
    case 0x5e:
        return ~b & 1;
    case 5:
    case 0x31:
    case 0x4b:
        return ~b & 3;
    default:
        return 0;
    }
}
