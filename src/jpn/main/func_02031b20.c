/* func_02031b20: push `node` onto the head of the list at global+0x4c4. Seeds
 * node->f4 with a fixed table address; re-reads the head between stores. */
extern char data_0219acd8[];
extern char data_0219b19c[];
void func_02031b20(int *node){
    int *head = *(int **)(data_0219acd8 + 0x4c4);
    head[1] = (int)node;
    node[1] = (int)data_0219b19c;
    node[0] = *(int *)(data_0219acd8 + 0x4c4);
    *(int **)(data_0219acd8 + 0x4c4) = node;
}
