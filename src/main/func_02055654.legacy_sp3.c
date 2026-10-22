typedef struct {
    char pad0[0x108];
    int busy;
    char pad1[0xcc];
    int status;
} State;

extern int func_0205ffc0(int *p, int b);
extern int func_02056884(int *self, int value);
extern char data_020ffc10[];

int func_02055654(int *self, int value) {
    State *state;
    int result;
    if (self == 0 || (state = (State *)*self) == 0) return 2;
    if (state->busy != 0) return 0;
    if (state->status == 4) {
        func_0205ffc0(self, (int)data_020ffc10);
        return 2;
    }
    result = func_02056884(self, value);
    if (result == 0) return 0;
    return result;
}
