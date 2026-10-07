/* func_0201d47c: clear a 0x28-byte object, then set two byte fields at +0x1c. */
typedef struct {
    char pad[0x1c];
    unsigned int a : 8;
    unsigned int b : 8;
} Obj;

extern void func_0209448c(int val, void *dest, unsigned int size);

int func_0201d47c(Obj *o) {
    func_0209448c(0, o, 0x28);
    o->a = 0x20;
    o->b = 0x20;
    return 0;
}
