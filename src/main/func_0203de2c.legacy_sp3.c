typedef struct {
    char pad[0x10];
    int f10;
    unsigned char f14, f15, f16;
} Obj;
typedef struct {
    char _pad[0xb];
    unsigned char b_b;
} state_b_t;

extern void *func_0203c900(int sel);
extern int func_0203c848(void);
extern int func_0203dde8(int n);
extern int func_0203dde0(void);
extern int func_0203ddc4(state_b_t *p);
extern int func_0203dc94(Obj *p);

int func_0203de2c(void)
{
    void *p = func_0203c900(1);
    int n = func_0203c848();
    if (n < 4) return func_0203dde8(n);
    if (n < 5) return func_0203dde0();
    if (n == 5) return func_0203ddc4(p);
    return func_0203dc94(p);
}
