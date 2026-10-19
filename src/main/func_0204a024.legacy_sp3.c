extern void *func_020498f0(void);
typedef struct { char data[0x800]; int len; } sbuf_02067294_t;
extern void func_02067294(sbuf_02067294_t *b, char *s);
extern void func_020672f4(int a0, int a1);
extern unsigned char data_0219dcb4[];
extern unsigned char data_0219dcb5[];
extern unsigned char data_0219dcbc[];

void func_0204a024(int code, int out)
{
    int index;
    switch (code) {
    case 8:
        func_020672f4(out, *(unsigned char *)((char *)func_020498f0() + 0x14));
        return;
    case 10:
        func_020672f4(out, *(unsigned char *)((char *)func_020498f0() + 0x16));
        return;
    case 50:
        func_020672f4(out, *(int *)((char *)func_020498f0() + 0x200));
        return;
    case 51:
        func_020672f4(out, *(unsigned char *)((char *)func_020498f0() + 0x15));
        return;
    case 52:
        func_020672f4(out, *(int *)((char *)func_020498f0() + 0x20));
        return;
    case 53:
        func_020672f4(out, 3);
        return;
    case 54:
        func_020672f4(out, 1);
        return;
    }
    index = code - 100;
    if (index < 0) return;
    if (index >= 154) return;
    index *= 12;
    if (data_0219dcb4[index] == 0) return;
    if (data_0219dcb5[index] != 0) {
        func_02067294((sbuf_02067294_t *)out, *(char **)(data_0219dcbc + index));
    } else {
        func_020672f4(out, *(int *)*(char **)(data_0219dcbc + index));
    }
}

