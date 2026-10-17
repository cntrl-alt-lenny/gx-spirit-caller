typedef struct { char pad[0x3d]; unsigned char lvl; } Node;
extern char data_021a485c[];
extern char data_021a4868[];
extern Node *func_0207cfdc(void *list, int z);
extern void func_0207cff4(void *list, Node *n);
extern void func_02087790(Node *n);
extern void func_020877c8(Node *n);

Node *func_0208771c(int lvl)
{
    Node *n = func_0207cfdc(data_021a485c, 0);
    if (n == 0) {
        n = func_0207cfdc(data_021a4868, 0);
        if (lvl < n->lvl) {
            return 0;
        }
        func_02087790(n);
    }
    func_0207cff4(data_021a485c, n);
    n->lvl = lvl;
    func_020877c8(n);
    return n;
}
