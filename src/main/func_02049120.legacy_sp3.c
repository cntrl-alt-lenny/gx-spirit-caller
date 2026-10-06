typedef struct {
    char _pad0[0x14];
    int count; /* +0x14 */
} State;

extern State *data_0219dc80;
extern int func_0204918c(int i);

int func_02049120(int key) {
    int i;
    if (data_0219dc80 == 0 || key == 0) {
        return -1;
    }
    for (i = 0; i < data_0219dc80->count; i++) {
        if (key == func_0204918c(i)) {
            return i;
        }
    }
    return -1;
}
