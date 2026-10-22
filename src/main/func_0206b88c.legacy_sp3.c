typedef struct {
    char pad[0x18];
    void *field_18;
} Obj02068ab4;

typedef struct {
    char pad[0x498];
    int field_498;
    int field_49c;
} State;

extern State *data_0219ecd4;
extern int data_02101df8;
extern int func_02068ab4(Obj02068ab4 *self, int b, int c);
/* The thunk forwards two comparison operands and its integer result. */
extern int func_020b1958(int a, int b);

int func_0206b88c(Obj02068ab4 **a, Obj02068ab4 **b) {
    int first;
    int second;
    int result;
    
    result = func_020b1958(func_02068ab4(*a, data_0219ecd4->field_498, (int)&data_02101df8), func_02068ab4(*b, data_0219ecd4->field_498, (unsigned int)&data_02101df8));
    if (data_0219ecd4->field_49c == 0) result = -result;
    return result;
}




