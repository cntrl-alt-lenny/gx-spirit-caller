struct El02010f84 {
    int   _blk00[12];  /* 0x00-0x2f: identity-Q12-matrix-shaped init via func_020110c4(&e[i]) */
    int   _blk30[12];  /* 0x30-0x5f: same, via func_020110c4((char*)&e[i]+0x30) */
    int   f60;
    int   f64;
    int   f68;
    int   f6c;
    int   f70;
    int   f74;
    int   f78;
    int   f7c;
    int   f80;
    int   f84;
    int   f88;
    int   f8c;
    int   f90;
    short h94;
    short h96;
    short h98;
    short h9a;
    int   f9c;
    int   fa0;
    char  pad_a4[4];   /* 0xa4-0xa7: unconfirmed, true gap */
    int   fa8;
    int   fac;
    int   fb0;         /* holds &func_02010eb8 in mode 1, 0 otherwise */
    int   fb4;
};

struct El02010f84 data_0218fd10[2];
