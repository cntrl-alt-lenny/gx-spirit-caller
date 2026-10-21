/* The assembly IRQ primitive returns its previous mask in r0. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_020928cc(void *address, unsigned int size);

typedef struct {
    char _pad[0x86];
    unsigned short h_86;
} state_inner_t;

typedef struct {
    int f_0;
    state_inner_t *p;
} state_t;

extern state_t *data_021a8d2c;

int func_0209d69c(void) {
    state_inner_t *p;
    unsigned short value;
    int saved;
    saved = OS_DisableIrq();
    if (data_021a8d2c) {
        p = data_021a8d2c->p;
        func_020928cc(&p->h_86, 2);
        value = p->h_86;
    } else {
        value = 0;
    }
    OS_RestoreIrq(saved);
    return value;
}

