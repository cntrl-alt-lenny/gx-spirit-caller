extern int func_0202de9c(int a);
extern int func_020300bc(int a);

int func_0203058c(int a) {
    switch (func_0202de9c(a)) {
    case 0:
        return 0;
    case 2:
    case 3:
        return 1;
    }
    return func_020300bc(a) > 0;
}
