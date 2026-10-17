struct S {
    char pad0[0xcec];
    int fcec;
    char pad1[0xd1c - 0xcf0];
    int fd1c;
    int fd20;
};
typedef int (*Fn)(void);
extern struct S data_ov002_022d016c;
extern Fn data_ov002_022ca998[];
extern int func_ov002_021b3ecc(int, int, int);
extern int func_ov002_022663cc(void);

int func_ov002_021b08a8(void) {
    Fn fn;
    if (func_ov002_021b3ecc(data_ov002_022d016c.fcec, 0xb, 0x151e) != 0) {
        if (func_ov002_022663cc() == 0) {
            return 0;
        }
    }
    fn = data_ov002_022ca998[data_ov002_022d016c.fd1c];
    if (fn != 0) {
        if (fn() != 0) {
            data_ov002_022d016c.fd20 = 0;
            data_ov002_022d016c.fd1c++;
        }
        return 0;
    }
    return 1;
}
