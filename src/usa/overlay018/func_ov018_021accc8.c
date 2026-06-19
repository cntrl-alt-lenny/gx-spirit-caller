/* func_ov018_021accc8: per-frame tick for the menu's confirm states. After
 * re-seeding the two cell layers (func_ov018_021aa898), branch on the global
 * mode at data_02103fcc+0x3c: in mode 2, fire func_0200852c once the OAM
 * ready-bit (bit 0 of oam+0x9b4) latches; in mode 1, fire func_020085c8.
 * Always run the trailer (func_02005898 + func_020379a8(1)) and return 1.
 */

typedef struct {
    unsigned short b0 : 1;
} OamCtl;

extern char data_ov018_021ae03c[];
extern char data_ov018_021ae040[];
extern char data_ov018_021ad7c8[];
extern char data_02103fcc[];
extern void func_ov018_021aa898(void *a, void *b);
extern void func_0200852c(void);
extern void func_020085c8(void);
extern void func_02005898(void);
extern void func_020379a8(int a);

int func_ov018_021accc8(void) {
    char *oam = data_ov018_021ad7c8;
    int state;
    func_ov018_021aa898(data_ov018_021ae03c, data_ov018_021ae040);
    state = *(int *)(data_02103fcc + 0x3c);
    if (state == 2) {
        if (((OamCtl *)(oam + 0x9b4))->b0 == 1) {
            func_0200852c();
        }
    } else if (state == 1) {
        func_020085c8();
    }
    func_02005898();
    func_020379a8(1);
    return 1;
}
