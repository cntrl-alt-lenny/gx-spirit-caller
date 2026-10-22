typedef unsigned char u8;
typedef struct {
    char _pad_18[0x18];
    void *field_18;
} Obj02068ab4;
typedef struct {
    char _pad_498[0x498];
    int field_498;
    int field_49c;
} Context0206b8fc;
extern Context0206b8fc *data_0219ecd4;
extern int data_02101df8;
extern int func_02068ab4(Obj02068ab4 *self, int b, int c);
extern int func_020aaf40(const u8 *a, const u8 *b);

int func_0206b8fc(Obj02068ab4 **a, Obj02068ab4 **b) {
    int first;
    int second;
    int result;
    result = func_020aaf40((const u8 *)func_02068ab4(*a, data_0219ecd4->field_498, (int)&data_02101df8), (const u8 *)func_02068ab4(*b, data_0219ecd4->field_498, (unsigned int)&data_02101df8));
    if (data_0219ecd4->field_49c == 0) result = -result;
    return result;
}


