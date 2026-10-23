typedef struct {
    char _pad[4];
    unsigned int f_4;
    unsigned int f_8;
} state_v_t;
typedef struct { char pad[0x24]; int f_24; } context_t;
/* The existing void signature omits the pointer forwarded in r0. */
extern int func_02053688();
extern int func_02053704(void *p);
extern unsigned long long func_0205370c(state_v_t *p);
extern int func_020534d4(unsigned long long id, int extra);
/* The assembly thunk forwards all three argument registers to 020534d4. */
extern void *func_020534b4(unsigned long long id, int extra);
int func_02052f04(context_t *self, state_v_t *p) {
    unsigned long long id;
    switch (func_02053688(p)) {
    case 2:
        id = func_0205370c(p);
        if (!func_020534d4(id, self->f_24)) return 0;
        return (int)func_020534b4(id, self->f_24);
    case 3:
        return func_02053704(p);
    case 1:
        return -1;
    default:
        return 0;
    }
}
