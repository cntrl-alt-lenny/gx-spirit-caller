/* func_ov002_02273410: if the global's low-byte bitfield is 0, reset it to
 * 0x1e, then tail-call func_ov002_022719c4. */
struct Ov002F18 { unsigned lowbyte : 8; unsigned rest : 24; };
extern struct { char _pad[0x18]; struct Ov002F18 f_18; } data_ov002_022cd220;
extern void func_ov002_022719c4(void);

void func_ov002_02273410(void) {
    if (data_ov002_022cd220.f_18.lowbyte == 0) {
        data_ov002_022cd220.f_18.lowbyte = 0x1e;
    }
    func_ov002_022719c4();
}
