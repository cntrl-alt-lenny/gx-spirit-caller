typedef struct Owner Owner;
extern int data_0219e3f0;
extern int func_0205673c(Owner **out, int a, int b);

int func_02056068(Owner **out, int a, int b) {
    if (data_0219e3f0 != 1) return 2;
    if (out == 0) return 2;
    return func_0205673c(out, a, b);
}
