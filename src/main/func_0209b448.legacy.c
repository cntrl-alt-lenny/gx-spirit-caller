typedef void (*Callback)(int, int);
typedef struct {
    int field_0;
    Callback field_4;
    int field_8;
} State;
extern State data_021a83e4;

void func_0209b448(int a0) {
    Callback callback = data_021a83e4.field_4;
    int arg = data_021a83e4.field_8;
    if (data_021a83e4.field_0 != 0) {
        data_021a83e4.field_0 = 0;
    }
    if (callback != 0) {
        data_021a83e4.field_4 = 0;
        callback(a0, arg);
    }
}
