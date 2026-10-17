typedef struct { char pad[0xb84]; int fb84, fb88; char p2[0xba0 - 0xb8c]; int fba0; char p3[0xbb0 - 0xba4]; int fbb0, fbb4; int p4; int fbbc, fbc0, fbc4, fbc8; char p5[0xc38 - 0xbcc]; int fc38, fc3c, fc40, fc44, fc48; } G;
extern G data_021040ac;
extern int func_02011aec(void);
void func_020125ac(void) {
    data_021040ac.fba0 = 0;
    data_021040ac.fbbc = 1;
    data_021040ac.fbc0 = 0x26;
    data_021040ac.fbc4 = -1;
    data_021040ac.fbc8 = func_02011aec();
    data_021040ac.fbb0 = 0;
    data_021040ac.fbb4 = -1;
    data_021040ac.fc38 = 0;
    data_021040ac.fc3c = 0;
    data_021040ac.fc48 = 2;
    data_021040ac.fc40 = 1;
    data_021040ac.fc44 = 1;
    data_021040ac.fb88 = 0;
    data_021040ac.fb84 = 1;
}
