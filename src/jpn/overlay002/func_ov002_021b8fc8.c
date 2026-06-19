/* func_ov002_021b8fc8: classify a per-player table slot (Cluster A). Reads the
 * low-13-bit id at row arg1 (+48) of player (arg0&1)'s cf16c table, maps it
 * through func_0202de48, and returns: 1 if the mapped type is 0 or 7; for type
 * 8, whether func_ov002_021b8f20 reports clear (==0); otherwise 0. */

struct slot { unsigned int id : 13; };

extern char data_ov002_022cf08c[];
extern int func_0202de48(int a);
extern int func_ov002_021b8f20(int a, int b);

int func_ov002_021b8fc8(int arg0, int arg1) {
    char *base = data_ov002_022cf08c + (arg0 & 1) * 0x868;
    int v = ((struct slot *)(base + arg1 * 20 + 48))->id;
    switch (func_0202de48(v)) {
    case 0:
    case 7:
        return 1;
    case 8:
        return func_ov002_021b8f20(arg0, arg1) == 0;
    default:
        return 0;
    }
}
