typedef struct {
    char pad[0x48];
    int count;
    unsigned char bytes[1];
} T_0208822c;

extern void func_02094ee8(int mask, int a1);

void func_0208822c(T_0208822c *p, int index, int a1) {
    unsigned char shift;
    if (index > p->count - 1) {
        return;
    }
    shift = p->bytes[index];
    func_02094ee8(1 << shift, a1);
}
