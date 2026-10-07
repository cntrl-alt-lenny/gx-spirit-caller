extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern void func_02091a8c(void *q);
extern unsigned int data_0219eef4;
extern volatile unsigned int data_0219eefc;
extern void * volatile data_0219ef20;
extern unsigned char *data_0219ef24;
extern volatile unsigned int data_0219ef28;
typedef struct { char pad[0xa4]; int *f_a4; } child_a4_t;
typedef struct { char pad[4]; child_a4_t *ptr_4; } data_021a63d0_t;
extern data_021a63d0_t data_021a63d0;
void *func_0207397c(int *out)
{
    int state = OS_DisableIrq();
    unsigned short size;
    unsigned char *buffer;
    while (data_0219eefc == data_0219eef4) {
        data_0219ef20 = data_021a63d0.ptr_4;
        func_02091a8c(0);
        data_0219ef20 = 0;
    }
    OS_RestoreIrq(state);
    buffer = data_0219ef24;
    do {
        if (data_0219ef28 - data_0219eefc < 2) data_0219eefc = 0;
        size = *(unsigned short *)(buffer + data_0219eefc);
        if (size == 0) data_0219eefc = 0;
    } while (size == 0);
    *out = size - 2;
    return data_0219ef24 + data_0219eefc + 2;
}
