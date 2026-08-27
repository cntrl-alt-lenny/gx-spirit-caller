extern void *func_02045398(int size);
extern void func_020a6c60(const char *msg, const char *file, int a, int line);

extern char data_020ffa7c[];
extern char data_020ffa24[];
extern char data_020ffa84[];
extern char data_020ffa90[];

void *func_02054144(int elemSize, int count, int extra) {
    void *obj = func_02045398(0x18);

    if (obj == 0) {
        func_020a6c60(data_020ffa7c, data_020ffa24, 0, 0x52);
    }
    if (elemSize == 0) {
        func_020a6c60(data_020ffa84, data_020ffa24, 0, 0x53);
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
        void *buf = func_02045398(*(int *)((char *)obj + 0x4) * *(int *)((char *)obj + 0x8));
        *(void **)((char *)obj + 0x14) = buf;
        if (*(void *volatile *)((char *)obj + 0x14) == 0) {
            func_020a6c60(data_020ffa90, data_020ffa24, 0, 0x5e);
        }
    } else {
        *(int *)((char *)obj + 0x14) = 0;
    }

    return obj;
}
