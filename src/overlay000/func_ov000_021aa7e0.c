/* func_ov000_021aa7e0: set the active object's 4-bit facing field; if it was
 * already 4 first run the wrap handler, and if the new value is 3 mark the
 * +0x13e status word. (*021c73e0 active object.) */
extern void func_ov000_021aa8d4(void);
extern char data_ov000_021c73e0[];
struct Ov000ObjF {
    char pad[318];
    unsigned short status;   /* +0x13e */
    int facing : 4;          /* +0x140 */
};
void func_ov000_021aa7e0(int facing) {
    struct Ov000ObjF *obj = *(struct Ov000ObjF **)data_ov000_021c73e0;
    if (obj->facing == 4) {
        func_ov000_021aa8d4();
    }
    obj->facing = (short)facing;
    if (facing == 3) {
        obj->status = 0xffff;
    }
}
