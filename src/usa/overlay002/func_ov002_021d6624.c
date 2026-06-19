/* func_ov002_021d6624: if player (arg0&1)'s row arg1 slot id is set, pack
 * (0x8000?|0x35, arg1, arg2, 8) into the func_ov002_021d46ac event queue. */
struct slot { unsigned int id : 13; };
extern char data_ov002_022cf08c[];
extern int func_ov002_021d46ac(int a, int b, int c, int d);
void func_ov002_021d6624(int arg0, int arg1, int arg2) {
    char *base = data_ov002_022cf08c + (arg0 & 1) * 0x868;
    if (((struct slot *)(base + arg1 * 20 + 48))->id == 0)
        return;
    func_ov002_021d46ac((unsigned short)((arg0 ? 0x8000 : 0) | 0x35),
                        (unsigned short)arg1, (unsigned short)arg2, 8);
}
