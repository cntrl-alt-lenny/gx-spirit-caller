typedef struct {
    char pad[0x2c];
    unsigned short limit2c;
    unsigned short limit2e;
} Limits;

typedef struct {
    char pad[0xa4];
    Limits *limits;
} Context;

typedef struct {
    void *head;
    Context *context;
} GlobalList;

typedef struct {
    char pad[0x24];
    int limit;
} Settings;

extern GlobalList data_021a63d0;
extern Settings data_0219ecec;
/* Assembly primitive returns the previous IRQ mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern int func_020b3870(int numerator, int denominator);

int func_0206d404(int size) {
    Limits *limits = data_021a63d0.context->limits;
    int saved = OS_DisableIrq();
    int quantum;
    int count;
    if (limits != 0) {
        int a = limits->limit2e;
        if (a != 0 && limits->limit2c != 0) {
            int b = limits->limit2c;
            int cap = data_0219ecec.limit;
            if (a > b) a = b;
            if (a > cap) a = cap;
            quantum = a * 2;
        } else {
            quantum = data_0219ecec.limit * 2;
        }
    } else {
        quantum = data_0219ecec.limit * 2;
    }
    OS_RestoreIrq(saved);
    if (quantum > 0) {
        count = func_020b3870(size, quantum);
        if (count > 0) return quantum * count;
    }
    return size;
}
