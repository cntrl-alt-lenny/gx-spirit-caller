int func_020558fc(void **self, int *out) {
    void *obj;
    if (self == 0 || (obj = *self) == 0) {
        return 2;
    }
    if (*(int *)((char *)obj + 0x108) != 0) {
        *out = 0;
        return 0;
    } else {
        *out = *(int *)((char *)obj + 0x430);
        return 0;
    }
}
