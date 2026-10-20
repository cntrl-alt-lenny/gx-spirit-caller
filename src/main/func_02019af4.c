extern char *GetSystemWork(void);
extern void *func_02018bc0(int x);
extern void func_02019acc(int bit);
typedef struct { char pad[0xa68]; unsigned int flags; } Global;
extern Global data_02104f4c;
typedef struct { unsigned int a:2; unsigned int b:2; } Bits;
void func_02019af4(int id, int value) {
    Bits *rec;
    GetSystemWork();
    switch (id) {
    case 0x1b: func_02019acc(1); break;
    case 0x3f: func_02019acc(2); break;
    case 0x1c: func_02019acc(3); break;
    case 0x5e: func_02019acc(4); break;
    case 0x19: func_02019acc(5); break;
    case 0x3e: func_02019acc(9); break;
    case 0x39: func_02019acc(0xa); break;
    case 0x29: func_02019acc(0x11); break;
    case 0x36: func_02019acc(0x13); break;
    case 0x38: func_02019acc(0x14); break;
    case 0x35: func_02019acc(0x15); break;
    case 0x3a:
    case 0x48: func_02019acc(0x16); break;
    case 0x31:
        data_02104f4c.flags |= (value & 1) << 6;
        data_02104f4c.flags |= ((value & 2) != 0) << 18;
        break;
    case 5:
    case 0x4b:
        data_02104f4c.flags |= (value & 1) << 7;
        data_02104f4c.flags |= ((value & 2) != 0) << 8;
        break;
    }
    rec = (Bits *)((char *)func_02018bc0(id) + 0x10);
    rec->b |= value;
}
