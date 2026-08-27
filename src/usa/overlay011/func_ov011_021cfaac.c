/* func_ov011_021cfaac: read the 4-bit blend field at data_ov011_021d3f20
 * +0x2b0 (bits 12:9); when it's 0 or 1, RMW the config word at
 * data_ov011_021d3f5c+0x274 (mask 0xffe01fff), OR-ing in 0x28000 for the
 * 0 case only, and return the just-stored value; otherwise return the
 * blend field itself. */
typedef struct {
    char _pad1[0x2b0];
    unsigned _pad2 : 9;
    unsigned blend : 4;
} Ov011ViewState;
extern Ov011ViewState data_ov011_021d3f20;
extern char data_ov011_021d3f5c[];

int func_ov011_021cfaac(void) {
    unsigned blend = data_ov011_021d3f20.blend;
    char *cfg = data_ov011_021d3f5c;

    switch (blend) {
    case 0:
        return *(unsigned *)(cfg + 0x274) =
            (*(unsigned *)(cfg + 0x274) & 0xffe01fffu) | 0x28000u;
    case 1:
        return *(unsigned *)(cfg + 0x274) =
            (*(unsigned *)(cfg + 0x274) & 0xffe01fffu);
    default:
        return blend;
    }
}
