extern char data_021a07f4[];
extern char *func_0207d1b4(char *root, int key);

char *func_0207d18c(int key)
{
    char *root = data_021a07f4;
    char *r;

    r = func_0207d1b4(root, key);
    if (r != 0)
        root = r + 0xc;
    return root;
}
