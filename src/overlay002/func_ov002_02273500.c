/* func_ov002_02273500: if the global's low-byte bitfield is 0, reset it to
 * 0x1e, then tail-call func_ov002_02271ab4. */
struct Ov002F18 { unsigned lowbyte : 8; unsigned rest : 24; };
extern struct { char _pad[0x18]; struct Ov002F18 f_18; } data_ov002_022cd300;
extern void func_ov002_02271ab4(void);

void func_ov002_02273500(void) {
    if (data_ov002_022cd300.f_18.lowbyte == 0) {
        data_ov002_022cd300.f_18.lowbyte = 0x1e;
    }
    func_ov002_02271ab4();
}
