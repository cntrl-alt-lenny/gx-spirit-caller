typedef struct { char *p; int n; } T;
extern T data_0219a924;
extern T data_0219a924_alias;
extern void Task_InvokeLocked(void);
extern void func_02027144(void *);
int func_02027048(void) {
    T *q = &data_0219a924_alias;
    int i = 0;
    int off;
    if (data_0219a924.n > 0) {
        off = i;
        do {
            char *b = q->p;
            if (*(int *)(b + off) != 0) func_02027144(b + off);
            i++;
            off += 0xe0;
        } while (i < q->n);
    }
    if (q->p != 0) {
        Task_InvokeLocked();
        q->p = 0;
    }
    *(unsigned short *)0x05000000 = 0;
    *(unsigned short *)0x05000400 = 0;
    return 1;
}
