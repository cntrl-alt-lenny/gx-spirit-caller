typedef struct {
    char pad[0x8];
    unsigned int byte0 : 8;
    unsigned int pad2 : 24;
} Result0201a824;

extern void *GetSystemWork(void);
extern Result0201a824 *func_02018bc0(int);

int func_0201a824(void) {
    Result0201a824 *p;
    GetSystemWork();
    p = func_02018bc0(0x1b);
    return p->byte0 == 0;
}
