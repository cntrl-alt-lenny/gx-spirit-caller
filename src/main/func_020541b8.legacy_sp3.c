extern void *func_020453e8(int size);
extern void func_020a6d54(const char *msg, const char *file, int a, int line);

extern char data_020ffb5c[];
extern char data_020ffb04[];
extern char data_020ffb64[];
extern char data_020ffb70[];

void *func_020541b8(int elemSize, int count, int extra) {
    void *obj = func_020453e8(0x18);

    if (obj == 0) {
        func_020a6d54(data_020ffb5c, data_020ffb04, 0, 0x52);
    }
    if (elemSize == 0) {
        func_020a6d54(data_020ffb64, data_020ffb04, 0, 0x53);
    }

    if (count == 0) {
        count = 8;
    }

    *(int *)((char *)obj + 0x0) = 0;
    *(int *)((char *)obj + 0x4) = count;
    *(int *)((char *)obj + 0x8) = elemSize;
    *(int *)((char *)obj + 0xc) = count;
    *(int *)((char *)obj + 0x10) = extra;

    if (*(int *)((char *)obj + 0x4) != 0) {
        void *buf = func_020453e8(*(int *)((char *)obj + 0x4) * *(int *)((char *)obj + 0x8));
        *(void **)((char *)obj + 0x14) = buf;
        if (*(void *volatile *)((char *)obj + 0x14) == 0) {
            func_020a6d54(data_020ffb70, data_020ffb04, 0, 0x5e);
        }
    } else {
        *(int *)((char *)obj + 0x14) = 0;
    }

    return obj;
}
