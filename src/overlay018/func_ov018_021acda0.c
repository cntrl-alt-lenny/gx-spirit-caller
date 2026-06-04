/* func_ov018_021acda0: per-frame tick for the menu's confirm states. After
 * re-seeding the two cell layers (func_ov018_021aa978), branch on the global
 * mode at data_021040ac+0x3c: in mode 2, fire func_02008548 once the OAM
 * ready-bit (bit 0 of oam+0x9b4) latches; in mode 1, fire func_020085e4.
 * Always run the trailer (func_020058b4 + func_020379f8(1)) and return 1.
 */

typedef struct {
    unsigned short b0 : 1;
} OamCtl;

extern char data_ov018_021ae11c[];
extern char data_ov018_021ae120[];
extern char data_ov018_021ad8a8[];
extern char data_021040ac[];
extern void func_ov018_021aa978(void *a, void *b);
extern void func_02008548(void);
extern void func_020085e4(void);
extern void func_020058b4(void);
extern void func_020379f8(int a);

int func_ov018_021acda0(void) {
    char *oam = data_ov018_021ad8a8;
    int state;
    func_ov018_021aa978(data_ov018_021ae11c, data_ov018_021ae120);
    state = *(int *)(data_021040ac + 0x3c);
    if (state == 2) {
        if (((OamCtl *)(oam + 0x9b4))->b0 == 1) {
            func_02008548();
        }
    } else if (state == 1) {
        func_020085e4();
    }
    func_020058b4();
    func_020379f8(1);
    return 1;
}
