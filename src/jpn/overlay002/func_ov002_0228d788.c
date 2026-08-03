extern int func_ov002_021afff0(int n);
extern int func_ov002_022574e0(void *name, int arg1, int id);
extern void func_ov002_0223dbd0(void *name, int arg1, int id);

int func_ov002_0228d788(void *name, int arg1) {
    int arr[11];
    int i;
    int k, id, attempt;

    for (i = 0; i <= 10; i++) {
        arr[i] = i;
    }

    for (i = 10; i > 0; i--) {
        int j = func_ov002_021afff0(i + 1);
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }

    for (attempt = 0; attempt < 2; attempt++) {
        for (k = 0; k <= 10; k++) {
            id = arr[k];
            if (func_ov002_022574e0(name, arg1, id)) {
                func_ov002_0223dbd0(name, arg1, id);
                return 1;
            }
        }
        arg1 ^= 1;
    }

    return 0;
}
