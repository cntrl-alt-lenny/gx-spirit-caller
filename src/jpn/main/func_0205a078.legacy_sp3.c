typedef struct {
    char _pad0[0x198];
    int f_198;
} obj_t;

extern void func_02057ffc(void *self, void *buf, void *key);
extern void func_02057fc4(void *self, void *buf, int value);

extern char data_021006b0[];
extern char data_021006c8[];
extern char data_021006d4[];
extern char data_021006dc[];

int func_0205a078(void *self, int arg1, int arg2) {
    obj_t *obj = *(obj_t **)self;

    func_02057ffc(self, (char *)obj + 0x1f4, data_021006b0);
    func_02057fc4(self, (char *)obj + 0x1f4, obj->f_198);
    func_02057ffc(self, (char *)obj + 0x1f4, data_021006c8);
    func_02057fc4(self, (char *)obj + 0x1f4, arg1);
    func_02057ffc(self, (char *)obj + 0x1f4, data_021006d4);
    func_02057fc4(self, (char *)obj + 0x1f4, arg2);
    func_02057ffc(self, (char *)obj + 0x1f4, data_021006dc);
    return 0;
}
