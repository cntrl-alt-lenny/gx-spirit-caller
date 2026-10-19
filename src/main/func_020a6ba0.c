typedef struct Obj { char pad[8]; int f8; int fc; } Obj;
typedef void (*Callback)(void);
typedef struct { Callback fn; Callback fn4; int count; int flag; } State;
extern char data_021a63d0[];
extern int data_021aa040;
extern int data_021aa064;
extern Obj data_021aa088;
extern int data_021a9f30[];
extern Callback data_021a9f40[];
extern int func_0209268c(Obj *o);
extern void func_02092748(Obj *o);
extern void func_020927b8(char *self);
extern int func_020a70fc(void *p);
extern void func_020b4314(void *p);
void func_020a6ba0(void) {
    if (func_0209268c(&data_021aa088) == 0) {
        data_021aa040 = *(int *)(*(char **)(data_021a63d0 + 4) + 0x6c);
        data_021aa064 = 1;
    } else if (data_021aa040 == *(int *)(*(char **)(data_021a63d0 + 4) + 0x6c)) {
        data_021aa064++;
    } else {
        func_020927b8((char *)&data_021aa088);
        data_021aa040 = *(int *)(*(char **)(data_021a63d0 + 4) + 0x6c);
        data_021aa064 = 1;
    }
    while (data_021a9f30[2] > 0) {
        data_021a9f40[--data_021a9f30[2]]();
    }
    if (--data_021aa064 == 0) func_02092748(&data_021aa088);
    if ((*(Callback *)data_021a9f30) != 0) {
        (*(Callback *)data_021a9f30)();
        (*(Callback *)data_021a9f30) = 0;
    }
    func_020b4314((void *)func_020a70fc(0));
}

