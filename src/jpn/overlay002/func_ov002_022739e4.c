/* func_ov002_022739e4: bit1 of data_ov002_022cd220+0x16 short-circuits to 1;
 * else dispatch func_0202b824 on a 15-bit field of field_0 and branch on
 * whether it's 9. */

extern struct {
    int field_0;
    char pad[0x16 - 4];
    unsigned short h16;
} data_ov002_022cd220;

extern int func_0202b824(int id);
extern int func_ov002_02272934(void);
extern int func_ov002_022719c4(void);

int func_ov002_022739e4(void) {
    unsigned int bit1 = ((unsigned int)(data_ov002_022cd220.h16 << 30)) >> 31;
    if (bit1) return 1;
    unsigned int field = ((unsigned int)(data_ov002_022cd220.field_0 << 9)) >> 17;
    if (func_0202b824(field) == 9) return func_ov002_02272934();
    return func_ov002_022719c4();
}
