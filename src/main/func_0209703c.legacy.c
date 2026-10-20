void func_0209703c(void *arg)
{
    char *p = arg;
    int position = *(int *)(p + 0x2c);
    int amount = *(int *)(p + 0x38);
    void *dev = *(void **)(p + 8);
    int param = *(int *)(p + 0x30);
    *(int *)(p + 0x2c) = position + amount;
    (*(void (**)(void *, int, int, int))((char *)dev + 0x48))(dev, param, position, amount);
}
