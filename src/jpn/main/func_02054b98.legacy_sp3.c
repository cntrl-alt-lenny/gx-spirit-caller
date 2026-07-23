extern int func_0206e6ac(int a, int *out);

int func_02054b98(int a) {
    int out;
    if (func_0206e6ac(a, &out) == 0) {
        return -1;
    }
    return out;
}
