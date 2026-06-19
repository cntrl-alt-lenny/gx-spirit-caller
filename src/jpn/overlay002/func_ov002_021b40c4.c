/* func_ov002_021b40c4: Cluster A 2-D 0x868 lookup → 021b3cb0(v,arg2,-1);
 * returns the matched node's f4, or -1 if none. */
struct node { char _pad[4]; unsigned short f4; };
extern unsigned short data_ov002_022cf0c6[];
extern struct node *func_ov002_021b3bd0(int a, int b, int c);
int func_ov002_021b40c4(int arg0, int arg1, int arg2) {
    unsigned short v = *(unsigned short *)((char *)data_ov002_022cf0c6 + (arg0 & 1) * 0x868 + arg1 * 20);
    struct node *r = func_ov002_021b3bd0(v, arg2, -1);
    return r ? r->f4 : -1;
}
