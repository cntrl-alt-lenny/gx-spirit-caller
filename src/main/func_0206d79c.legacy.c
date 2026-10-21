typedef struct {
    unsigned short first;
    unsigned short last;
} Indices;

int func_0206d79c(void *a0) {
    char *base = *(char **)((char *)a0 + 0x68);
    Indices *indices = (Indices *)(base + 0x100);
    int size = *(int *)(base + 0xf8);
    int result = indices->first;
    result = indices->last - result;
    result--;
    if (result < 0) result += size;
    return result;
}
