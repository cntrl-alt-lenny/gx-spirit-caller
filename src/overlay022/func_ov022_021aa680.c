typedef struct {
    char gap0[0x198];
    unsigned int enabled : 1;
    unsigned int rest : 31;
} OverlayState;

extern unsigned short data_ov022_021ac36c[];
extern unsigned short data_ov022_021ac56c[];
extern unsigned short data_ov022_021ac76c[];
extern unsigned short data_ov022_021ac96c[];
extern OverlayState data_ov022_021acaa0;
extern void func_ov022_021ab760(unsigned short *, unsigned short *, unsigned int);

void func_ov022_021aa680(int value) {
    unsigned int packed = ((unsigned int)(unsigned short)value << 16) | 0x100;
    func_ov022_021ab760(data_ov022_021ac36c, data_ov022_021ac76c, packed);
    func_ov022_021ab760(data_ov022_021ac56c, data_ov022_021ac96c, packed);
    data_ov022_021acaa0.enabled = 1;
}
