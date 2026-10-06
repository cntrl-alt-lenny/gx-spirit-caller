typedef struct {
    char         _pad[0xea0];
    unsigned int count;
} obj_020339d4_t;

extern int func_02046ac4(void);
extern int func_020469d0(unsigned char id);
extern void func_02052870(unsigned int mask, int a, int b);

void func_020339d4(obj_020339d4_t *o, unsigned int mask, int a, int b) {
    unsigned int i;

    for (i = 0; i < o->count; i++) {
        if (i != func_02046ac4() && (mask & (1 << i))) {
            if (func_020469d0(i) == 0) {
                mask &= ~(1 << i);
            }
        }
    }
    func_02052870(mask, a, b);
}
