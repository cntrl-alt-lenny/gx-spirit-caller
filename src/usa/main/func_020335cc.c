typedef struct {
    char pad[0xeac];
    unsigned int field_eb4;
} Obj0203361c;

extern int func_0203347c(Obj0203361c *);
extern void func_02032d1c(Obj0203361c *);
extern void func_02047110(void);

void func_020335cc(Obj0203361c *arg0) {
    if ((arg0->field_eb4 & 1) == 0) {
        return;
    }
    if (func_0203347c(arg0) == 0) {
        func_02032d1c(arg0);
    }
    func_02047110();
    func_0203347c(arg0);
}
