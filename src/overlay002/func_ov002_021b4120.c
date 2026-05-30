/* func_ov002_021b4120: Cluster A 2-D 0x868 lookup → 021b3c10(v,arg2);
 * returns the matched node's f4, or -1 if none. */
struct node { char _pad[4]; unsigned short f4; };
extern unsigned short data_ov002_022cf1a6[];
extern struct node *func_ov002_021b3c10(int a, int b);
int func_ov002_021b4120(int arg0, int arg1, int arg2) {
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cf1a6 + (arg0 & 1) * 0x868 + arg1 * 20);
    struct node *r = func_ov002_021b3c10(v, arg2);
    return r ? r->f4 : -1;
}
