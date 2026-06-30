extern char data_021a08d4[];
extern char *func_0207d29c(char *root, int key);

char *func_0207d274(int key)
{
    char *root = data_021a08d4;
    char *r;

    r = func_0207d29c(root, key);
    if (r != 0)
        root = r + 0xc;
    return root;
}
