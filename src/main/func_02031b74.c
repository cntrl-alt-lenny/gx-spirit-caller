/* func_02031b74: push `node` onto the head of the list at global+0x4c4. Seeds
 * node->f4 with a fixed table address; re-reads the head between stores. */
extern char data_0219adb8[];
extern char data_0219b27c[];
void func_02031b74(int *node){
    int *head = *(int **)(data_0219adb8 + 0x4c4);
    head[1] = (int)node;
    node[1] = (int)data_0219b27c;
    node[0] = *(int *)(data_0219adb8 + 0x4c4);
    *(int **)(data_0219adb8 + 0x4c4) = node;
}
