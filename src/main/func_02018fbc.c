typedef struct {
    char pad0[0x8d8];
    unsigned int flags8d8;
    char pad1[0x91c - 0x8dc];
    int field91c;
    unsigned int field920;
    unsigned int field924;
    int field928;
} SysWork;

extern void *GetSystemWork(void);
extern unsigned int func_02013a50(int v);
extern void func_02018fa0(int v);

void func_02018fbc(unsigned int n) {
    SysWork *sw = GetSystemWork();
    unsigned int limit = func_02013a50(sw->field91c);

    if (sw->field924 > 2) {
        sw->field924 = sw->field924 - 1;
    } else {
        sw->field924 = 1;
        if (sw->field928 == 0) {
            unsigned int next = sw->field920 + n;
            if (next <= limit) {
                sw->field920 = next;
            } else {
                func_02018fa0(1);
                sw->field920 = 1;
            }
        }
    }
    sw->flags8d8 = (sw->flags8d8 & ~1) | 1;
}
