typedef struct {
    char _pad0[0x198];
    int f_198;
} obj_t;

extern void func_02058070(void *self, void *buf, void *key);
extern void func_02058038(void *self, void *buf, int value);

extern char data_02100790[];
extern char data_021007a8[];
extern char data_021007b4[];
extern char data_021007bc[];

int func_0205a0ec(void *self, int arg1, int arg2) {
    obj_t *obj = *(obj_t **)self;

    func_02058070(self, (char *)obj + 0x1f4, data_02100790);
    func_02058038(self, (char *)obj + 0x1f4, obj->f_198);
    func_02058070(self, (char *)obj + 0x1f4, data_021007a8);
    func_02058038(self, (char *)obj + 0x1f4, arg1);
    func_02058070(self, (char *)obj + 0x1f4, data_021007b4);
    func_02058038(self, (char *)obj + 0x1f4, arg2);
    func_02058070(self, (char *)obj + 0x1f4, data_021007bc);
    return 0;
}
