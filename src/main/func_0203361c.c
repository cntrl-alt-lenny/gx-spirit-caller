typedef struct {
    char pad[0xeb4];
    unsigned int field_eb4;
} Obj0203361c;

extern int func_020334cc(Obj0203361c *);
extern void func_02032d70(Obj0203361c *);
extern void func_0204717c(void);

void func_0203361c(Obj0203361c *arg0) {
    if ((arg0->field_eb4 & 1) == 0) {
        return;
    }
    if (func_020334cc(arg0) == 0) {
        func_02032d70(arg0);
    }
    func_0204717c();
    func_020334cc(arg0);
}
