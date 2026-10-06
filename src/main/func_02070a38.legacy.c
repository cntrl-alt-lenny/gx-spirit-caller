typedef struct { char pad[0xa4]; int *f_a4; } child_a4_t;
typedef struct { char pad[4]; child_a4_t *ptr_4; } data_021a63d0_t;
extern data_021a63d0_t data_021a63d0;
struct S02074b90;
extern int func_02074b90(int *a, struct S02074b90 *b);
extern int func_02070ac0(int *out, void *arg1);
extern int func_02070b4c(int *out, void *arg1);
int func_02070a38(int *out)
{
    void *connection = data_021a63d0.ptr_4->f_a4;
    if (connection != 0) {
        if ((unsigned char)(*((unsigned char *)connection + 8) + 246) <= 1)
            return func_02070b4c(out, connection);
        if (*((unsigned char *)connection + 9) != 0)
            return func_02074b90(out, connection);
        return func_02070ac0(out, connection);
    }
    *out = 0;
    return 0;
}
