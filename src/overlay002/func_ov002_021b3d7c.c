extern char data_ov002_022d0650[];

int func_ov002_021b3d7c(int node, int val, int kindArg)
{
    int count = 0;

    while (node != 0) {
        char *p = data_ov002_022d0650 + node * 8;
        struct { unsigned short kind : 4; } *kf = (void *)(p + 2);
        unsigned int kind = kf->kind;
        int next = *(unsigned short *)(p + 6);

        if (kind < 6) {
            unsigned short id = *(unsigned short *)(p + 0);
            if (id == val && kind == kindArg)
                count++;
        }
        node = next;
    }
    return count;
}
