typedef struct Obj { char pad[8]; int f8; int fc; } Obj;
typedef struct Thread { char pad[0x6c]; int id; } Thread;
typedef struct { int pad; Thread *current; } ThreadState;
typedef struct { char pad[0x1c]; int value; } State;
typedef void (*Callback)(int);
extern Obj data_021aa130;
extern ThreadState data_021a63d0;
extern State data_021aa040;
extern State data_021aa064;
extern Callback data_021aa464[];
extern int func_0209268c(Obj *o);
extern void func_02092748(Obj *o);
extern void func_020927b8(char *self);
extern void func_020a6b54(void *arg);
int func_020aacac(int n) {
    Callback callback;
    if (n < 1 || n > 7) return -1;
    if (func_0209268c(&data_021aa130) == 0) {
        data_021aa040.value = data_021a63d0.current->id;
        data_021aa064.value = 1;
    } else if (data_021aa040.value == data_021a63d0.current->id) {
        data_021aa064.value++;
    } else {
        func_020927b8((char *)&data_021aa130);
        data_021aa040.value = data_021a63d0.current->id;
        data_021aa064.value = 1;
    }
    callback = data_021aa464[n - 1];
    if (callback != (Callback)1) data_021aa464[n - 1] = 0;
    if (--data_021aa064.value == 0) func_02092748(&data_021aa130);
    if (callback == (Callback)1 || (callback == 0 && n == 1)) return 0;
    if (callback == 0) func_020a6b54(0);
    callback(n);
    return 0;
}
